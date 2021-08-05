require 'time'
require './lib/key_maker'

class Offset
  include KeyMaker

  attr_reader :key, :date

  def initialize(key=make_key_string, date=format_today(Time.now))
    @key = key
    @date = date
  end

  def format_today(date)
    date.strftime("%d%m") + date.strftime("%Y")[2..]
  end

  def date_modifiers
    letter_keys = [:a, :b, :c, :d]
    date_modifiers_array.each_with_index.map do |num, i|
      [letter_keys[i], num]
    end.to_h
  end

  def date_modifiers_array
    (@date.to_i ** 2).digits.reverse[-4..-1]
  end

  def make_offsets
    modifiers = date_modifiers
    format_keys(@key).each.map do |key_let, key|
      [key_let, key + modifiers[key_let]]
    end.to_h
  end

  def self.offsets(key, date)
    Offset.new(key, date).make_offsets
  end
end
