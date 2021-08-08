require './lib/enigma'

RSpec.describe Enigma do
  context 'date formatting and key generating' do
    enigma = Enigma.new

    it 'can format a date' do
      expect(enigma.format_today(Time.new(2021, 8, 5))).to eq('050821')
    end

    it 'can generate a number' do
      expect(enigma.generate_number).to be_between(0, 99999)
    end

    it 'can make a new key' do
      allow(enigma).to receive(:generate_number).and_return(256)

      expect(enigma.make_key_string).to eq('00256')
    end
  end

  it 'can decrypt a message' do
    enigma = Enigma.new

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it 'can encrypt a message' do
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'can encrypt then decrypt' do
    enigma = Enigma.new

    message = "what's up doc?"
    result = enigma.encrypt(message)

    decrypted = enigma.decrypt(result[:encryption], result[:key], result[:date])

    expect(decrypted[:decryption]).to eq(message)
  end

  it 'can encrypt then decrypt again' do
    enigma = Enigma.new

    message = "Chicken Little has a 'funny' haircut"
    result = enigma.encrypt(message)

    decrypted = enigma.decrypt(result[:encryption], result[:key], result[:date])

    expect(decrypted[:decryption]).to eq(message.downcase)
  end

  it 'can crack' do
    enigma = Enigma.new

    expected = {
      decryption: "hello world end",
      date: "291018",
      key: "08304"
    }
    expect(enigma.crack("vjqtbeaweqihssi", "291018")).to eq(expected)
  end
end
