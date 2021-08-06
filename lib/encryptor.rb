require './lib/cypher'

class Encryptor < Cypher
  def initialize(message, key, date)
    super
  end

  def calculate_shift(letter, shift)
    ALPHABET.index(letter) + shift
  end

  def format_encryption
    {
      encryption: process_message,
      key: @key,
      date: @date
    }
  end

  def self.encrypt(message, key, date)
    Encryptor.new(message, key, date).format_encryption
  end
end
