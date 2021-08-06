require './lib/offset'

class Cypher
  attr_reader :message, :key, :date, :offsets

  ALPHABET = ('a'..'z').to_a << ' '

  def initialize(message, key, date)
    @message = message.downcase
    @date = date
    @key = key
    @offsets = Offset.offsets(@key, @date)
  end

  def process_message(message=@message)
    message.chars.each_with_index.map do |letter, i|
      if ALPHABET.include?(letter)
        next_letter(letter, i)
      else
        letter
      end
    end.join
  end

  def next_letter(letter, i)
    ALPHABET[next_index(letter, @offsets[i % 4])]
  end

  def next_index(letter, offset)
    calculate_shift(letter, offset) % ALPHABET.size
  end
end
