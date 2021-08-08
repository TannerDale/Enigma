require './lib/file_worker'
require './lib/enigma'

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
