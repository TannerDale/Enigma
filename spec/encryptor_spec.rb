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
    end
  end

  context 'date formatting' do
    encrypt = Encryptor.new("Hello World", '02715')

    it 'can format a date' do
      allow(encrypt).to receive(:format_today).and_return("050821")

      expect(encrypt.date).to eq("050821")
    end
  end
end
