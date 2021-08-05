require './lib/offset'
require './lib/key_maker'


RSpec.describe Offset do
  context 'initialize' do
    offset = Offset.new("02715", "040895")

    it 'exists' do
      expect(offset).to be_a(Offset)
    end

    it 'has attributes' do
      expect(offset.key).to eq("02715")
      expect(offset.date).to eq("040895")
    end

    it 'can format today' do
      date = Date.new(2021, 8, 5)

      expect(offset.format_today(date)).to eq("050821")
    end
  end

  context 'key maker module' do
    offset = Offset.new("02715")

    it 'can generate a number' do
      expect(offset.generate_number).to be_between(0, 99999)
    end

    it 'can make a new key' do
      allow(offset).to receive(:generate_number).and_return(256)

      expect(offset.make_key_string).to eq("00256")
    end

    it 'can seperate keys' do
      expect(offset.seperated_keys("02715")).to eq(%w(02 27 71 15))
    end

    it 'can format keys' do
      expect(offset.format_keys("02715")).to eq({a: 2, b: 27, c: 71, d: 15})
    end
  end

  context 'offset making' do
    offset = Offset.new("02715", "040895")

    it 'can make offset hash' do
      expect(offset.make_offsets).to eq({a: 3, b: 27, c: 73, d: 20})
    end

    it 'can make date modfiers hash' do
      expect(offset.date_modifiers). to eq({a: 1, b: 0, c: 2, d: 5})
    end

    it 'can calculate date modifiers' do
      expect(offset.date_modifiers_array). to eq([1, 0, 2, 5])
    end
  end

  it 'can make offsets' do
    expect(Offset.offsets("02715", "040895")).to eq({a: 3, b: 27, c: 73, d: 20})
  end
end
