require './lib/key_maker'
require './lib/offset'
require './lib/encryptor'

RSpec.describe Encryptor do
  context 'initialize' do
    message = 'hello world'
    key = '02715'
    date = '040895'
    encrypt = Encryptor.new(message, key, date)

    it 'exists' do
      expect(encrypt).to be_a(Encryptor)
    end

    it 'has attributes' do
      expect(encrypt.message).to eq(message)
      expect(encrypt.key).to eq(key)
      expect(encrypt.date).to eq(date)
      expect(encrypt.offsets).to eq({a: 3, b: 27, c: 73, d: 20})
    end
  end

  context 'date formatting and key generating' do
    encrypt = Encryptor.new("Hello World", '02715')

    it 'can format a date' do
      allow(encrypt).to receive(:format_today).and_return("050821")

      expect(encrypt.date).to eq("050821")
    end

    it 'can generate a number' do
      expect(encrypt.generate_number).to be_between(0, 99999)
    end

    it 'can make a new key' do
      allow(encrypt).to receive(:generate_number).and_return(256)

      expect(encrypt.make_key_string).to eq("00256")
    end
  end
end
