require './lib/cypher'

class Encryptor < Cypher
  def initialize(message, key, date)
    super
  end

  def next_index(letter, shift)
    (ALPHABET.index(letter) + shift) % ALPHABET.size
  end

  def format_encryption
    {
      encryption: process_message,
      key: @key,
      date: @date
    }
  end

  def self.encrypt(message, key=make_key_string, date=format_today)
    Encryptor.new(message, key, date).format_encryption
  end
end
