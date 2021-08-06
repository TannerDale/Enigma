require './lib/cypher'

class RunDecryption < Cypher
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
    RunDecryption.new(message, key, date).format_decryption
  end
end
