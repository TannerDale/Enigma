require './lib/offset'
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
  end

  context 'key maker module' do
    offset = Offset.new("02715", "040895")

    it 'can seperate keys' do
      expect(offset.seperated_keys("02715")).to eq(%w(02 27 71 15))
    end

    it 'can format keys' do
      expect(offset.format_keys("02715")).to eq({a: 2, b: 27, c: 71, d: 15})
    end
  end

  context 'offset making' do
    offset = Offset.new("02715", "040895")

    it 'can make offsets' do
      expect(offset.make_offsets).to eq([3, 27, 73, 20])
    end

    it 'can make date modfiers hash' do
      expect(offset.date_modifiers). to eq({a: 1, b: 0, c: 2, d: 5})
    end

    it 'can calculate date modifiers' do
      expect(offset.date_modifiers_array). to eq([1, 0, 2, 5])
    end
  end

  it 'can make offsets' do
    expect(Offset.offsets("02715", "040895")).to eq([3, 27, 73, 20])
  end
end
