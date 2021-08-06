require './lib/key_maker'
require './lib/offset'
require './lib/run_decryption'
require './lib/cypher'

RSpec.describe RunDecryption do
  context 'initialize' do
    message = 'hello world'
    key = '02715'
    date = '040895'
    decrypt = RunDecryption.new(message, key, date)

    it 'exists' do
      expect(decrypt).to be_a(RunDecryption)
    end

    it 'has attributes' do
      expect(decrypt.message).to eq(message)
      expect(decrypt.key).to eq(key)
      expect(decrypt.date).to eq(date)
      expect(decrypt.offsets).to eq([3, 27, 73, 20])
    end
  end

  context 'decrypting' do
    it 'can calculate a shift' do
      decrypt = RunDecryption.new('hello world', '02715', '040895')
      expect(decrypt.calculate_shift(' ', 5)).to eq(21)
    end

    it 'can get the next letter index and letter' do
      decrypt = RunDecryption.new('hello world', '02715', '040895')
      expect(decrypt.next_index('b', 3)).to eq(25)
      expect(decrypt.next_letter('b', 0)).to eq('z')
    end

    it 'can decrypt basic message' do
      decrypt = RunDecryption.new('keder ohulw', '02715', '040895')

      expect(decrypt.process_message).to eq('hello world')
    end

    it 'can decrypt message with capitol letters' do
      decrypt = RunDecryption.new('keder ohulw', '02715', '040895')

      expect(decrypt.process_message).to eq('hello world')
    end

    it 'can decrypt mesage with puntuation' do
      decrypt = RunDecryption.new('keder ohulw!', '02715', '040895')

      expect(decrypt.process_message).to eq('hello world!')
    end

    it 'can decrypt a different message' do
      decrypt = RunDecryption.new('vjqtbeaweqihssi', '08304', '291018')

      expect(decrypt.process_message).to eq('hello world end')
    end

    it 'can format a decrypted message' do
      decrypt = RunDecryption.new('keder ohulw', '02715', '040895')
      expected = {
        decryption: 'hello world',
        key: '02715',
        date: '040895'
      }
      expect(decrypt.format_decryption).to eq(expected)
    end
  end

  it 'can decrypt a message' do
    expected = {
      decryption: 'hello world end!',
      key: '08304',
      date: '291018'
    }

    expect(RunDecryption.decrypt('vjqtbeaweqihssi!', '08304', '291018')).to eq(expected)
  end
end
