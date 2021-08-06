require './lib/enigma'
require './lib/key_maker'
require './lib/file_worker'

ARGV == ['encrytped.txt', 'decrypted.txt', 'key', 'date']
ARGV[0] == 'encrytped.txt'
ARGV[1] == 'decrypted.txt'
ARGV[2] == 'date'

class KeyCracker < FileWorker
  include KeyMaker

  def initialize
    super(ARGV[0], ARGV[1], :decryption)
    @date = ARGV[2] || nil
    @enigma = Enigma.new
    @message = read_file(@read_file).chomp
    @result = decrypted
  end

  def make_key
    current_key = 0
    while current_key < 99999
      key = make_key_string(current_key)
      return key if correct_key?(key)

      current_key += 1
    end
  end

  def decrypted
    @enigma.decrypt(@message, make_key, @date)
  end

  def correct_key?(key)
    result = @enigma.decrypt(find, key, @date)[@method]
    result.end_with?(" end")
  end

  def find
    start = -(4 - start_offset)
    @message[start..-1]
  end

  def start_offset
    @message.size % (@message.size - 4)
  end
end

puts KeyCracker.new.output
