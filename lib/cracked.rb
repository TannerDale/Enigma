require './lib/enigma'
require './lib/key_maker'
require './lib/file_worker'

ARGV == ['encrytped.txt', 'decrypted.txt', 'date']
ARGV[0] == 'encrytped.txt'
ARGV[1] == 'decrypted.txt'
ARGV[2] == 'date'

class KeyCracker < FileWorker
  include KeyMaker

  def initialize
    super(ARGV[0], ARGV[1], :decryption)
    @date = ARGV[2]
    @message = read_file(@read_file).chomp
    @result = decrypted
  end

  def decrypted
    Enigma.new.crack(@message, @date)
  end
end

puts KeyCracker.new.output
