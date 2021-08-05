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
end
