require './lib/cypher'

ARGV = ['message.txt', 'encrytped.txt']
ARGV[0] = 'message.txt'
ARGV[1] = 'encrytped.txt'

class RunEncryption < Cypher
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
    RunEncryption.new(message, key, date).format_encryption
  end

  def self.process_files

  end
end
