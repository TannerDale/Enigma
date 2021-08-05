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
      expect(encrypt.offsets).to eq([3, 27, 73, 20])
    end
  end

  context 'date formatting and key generating' do
    encrypt = Encryptor.new("Hello World", '02715', "050821")

    it 'can format a date' do
      expect(Encryptor.format_today(Time.new(2021, 8, 5))).to eq("050821")
    end

    it 'can generate a number' do
      expect(encrypt.generate_number).to be_between(0, 99999)
    end

    it 'can make a new key' do
      allow(encrypt).to receive(:generate_number).and_return(256)

      expect(encrypt.make_key_string).to eq("00256")
    end
  end

  context 'decrypting' do
    it 'can encrypt basic message' do
      encrypt = Encryptor.new("hello world", '02715', '040895')

      expect(encrypt.encrypted_message).to eq("keder ohulw")
    end

    it 'can encrypt message with capitol letters' do
      encrypt = Encryptor.new("Hello World", '02715', '040895')

      expect(encrypt.encrypted_message).to eq("keder ohulw")
    end

    it 'can encrypt mesage with puntuation' do
      encrypt = Encryptor.new("Hello World!", '02715', '040895')

      expect(encrypt.encrypted_message).to eq("keder ohulw!")
    end

    it 'can encrypt a different message' do
      encrypt = Encryptor.new("hello world end", "08304", "291018")

      expect(encrypt.encrypted_message).to eq("vjqtbeaweqihssi")
    end

    it 'can format a encrypted message' do
      encrypt = Encryptor.new("hello world", '02715', '040895')
      expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
      expect(encrypt.format_encryption).to eq(expected)
    end
  end

  it 'can encrypt a message' do
    expected = {
      encryption: "vjqtbeaweqihssi!",
      key: "08304",
      date: "291018"
    }

    expect(Encryptor.encrypt("hello WORLD end!", "08304", "291018")).to eq(expected)
  end
end
