require './lib/key_maker'
require './lib/offset'
require './lib/encryptor'
require './lib/cypher'

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

  context 'encrypting' do
    it 'can get the next letter index and letter' do
      encrypt = Encryptor.new('hello world', '02715', '040895')
      expect(encrypt.next_index('b', 3)).to eq(4)
      expect(encrypt.next_letter('b', 0)).to eq('e')
    end

    it 'can encrypt basic message' do
      encrypt = Encryptor.new('hello world', '02715', '040895')

      expect(encrypt.process_message).to eq('keder ohulw')
    end

    it 'can encrypt message with capitol letters' do
      encrypt = Encryptor.new('Hello World', '02715', '040895')

      expect(encrypt.process_message).to eq('keder ohulw')
    end

    it 'can encrypt mesage with puntuation' do
      encrypt = Encryptor.new('Hello World!', '02715', '040895')

      expect(encrypt.process_message).to eq('keder ohulw!')
    end

    it 'can encrypt a different message' do
      encrypt = Encryptor.new('hello world end', '08304', '291018')

      expect(encrypt.process_message).to eq('vjqtbeaweqihssi')
    end

    it 'can format a encrypted message' do
      encrypt = Encryptor.new('hello world', '02715', '040895')
      expected = {
        encryption: 'keder ohulw',
        key: '02715',
        date: '040895'
      }
      expect(encrypt.format_encryption).to eq(expected)
    end
  end

  it 'can encrypt a message' do
    expected = {
      encryption: 'vjqtbeaweqihssi!',
      key: '08304',
      date: '291018'
    }

    expect(Encryptor.encrypt('hello WORLD end!', '08304', '291018')).to eq(expected)
  end
end
