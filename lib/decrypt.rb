require './lib/file_worker'
require './lib/enigma'

class Decryptor < FileWorker
  def initialize
    super(ARGV[0], ARGV[1], :decryption)
    @result = decrypted
  end

  def decrypted
    Enigma.new.decrypt(read_file(@read_file), ARGV[2], ARGV[3])
  end
end

puts Decryptor.new.output
