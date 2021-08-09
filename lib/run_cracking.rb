require './lib/offset'
require './lib/run_decryption'
require './lib/key_maker'

class RunCracking < RunDecryption
  include KeyMaker

  attr_reader :message, :date, :key

  def initialize(message, date)
    @message = message
    @date = date
  end

  def make_key
    current_key = 0
    while current_key < 99999
      @key = make_key_string(current_key)
      @offsets = Offset.offsets(@key, @date)
      break if correct_key?(key)

      current_key += 1
    end
  end

  def decrypted
    make_key
    validate_decryption(format_decryption)
  end

  def validate_decryption(decryption)
    if decryption[:decryption].end_with?(' end')
      decryption
    else
      warn "Cracking Failed: Ensure original message ends with ' end'."
      "Cracking Failed"
    end
  end

  def correct_key?(key)
    result = process_message(find)

    result.end_with?(" end")
  end

  def find
    start = -4 - start_offset
    @message[start..-1]
  end

  def start_offset
    (@message.size - 4) % 4
  end

  def self.crack(message, date)
    RunCracking.new(message, date).decrypted
  end
end
