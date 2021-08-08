require './lib/enigma'
require './lib/key_maker'
require './lib/file_worker'

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
