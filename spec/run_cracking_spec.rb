require './lib/run_cracking'

RSpec.describe RunCracking do
  context 'initialize' do
    crack = RunCracking.new('hello world end', '111111')

    it 'exists' do
      expect(crack).to be_a(RunCracking)
    end

    it 'has attributes' do
      expect(crack.message).to eq('hello world end')
      expect(crack.date).to eq('111111')
    end
  end

  context 'cracking' do
    crack = RunCracking.new('vjqtbeaweqihssi', '291018')

    it 'can find where to start' do
      expect(crack.start_offset).to eq(3)
    end

    it 'can find the beginning of a message' do
      expect(crack.find).to eq('eqihssi')
    end


    it 'can tell if a key is correct' do
      allow(crack).to receive(:process_message).and_return(' end')

      expect(crack.correct_key?("00000")).to be(true)

      allow(crack).to receive(:process_message).and_return(' ')

      expect(crack.correct_key?("00000")).to be(false)
    end

    it 'can make a key' do
      allow(crack).to receive(:correct_key?).and_return(true)

      crack.make_key

      expect(crack.key).to eq("00000")
    end

    it 'can format a decrypted message' do
      expected = {
        decryption: "hello world end",
        date: "291018",
        key: "08304"
      }

      expect(crack.decrypted).to eq(expected)
    end
  end

  context 'edge case' do
    crack = RunCracking.new('vjqtbeaweqih', '291018')

    it 'can process a failed crack' do
      expect(crack.decrypted).to eq("Cracking Failed")
    end
  end
end
