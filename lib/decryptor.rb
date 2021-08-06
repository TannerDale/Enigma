require './lib/cypher'

class Decryptor < Cypher
  def initialize(message, key, date)
    super
  end

  def calculate_shift(letter, shift)
    ALPHABET.index(letter) - shift
  end

  def format_decryption
    {
      decryption: process_message,
      key: @key,
      date: @date
    }
  end

  def self.decrypt(message, key, date)
    Decryptor.new(message, key, date).format_decryption
  end
end
