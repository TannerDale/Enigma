require './lib/cypher'

class Decryptor < Cypher
  def initialize(message, key, date)
    super
  end

  def next_index(letter, shift)
    (ALPHABET.index(letter) - shift) % ALPHABET.size
  end

  def format_decryption
    {
      decryption: process_message,
      key: @key,
      date: @date
    }
  end

  def self.decrypt(message, key=make_key_string, date=format_today)
    Decryptor.new(message, key, date).format_decryption
  end
end
