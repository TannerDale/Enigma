require './lib/file_worker'
require './lib/enigma'

ARGV == ['message.txt', 'encrytped.txt']
ARGV[0] == 'message.txt'
ARGV[1] == 'encrytped.txt'

class Encryptor < FileWorker
  def initialize
    super(ARGV[0], ARGV[1], :encryption)
    @result = encrypted
  end

  def encrypted
    Enigma.new.encrypt(read_file(@read_file))
  end
end

puts Encryptor.new.output
