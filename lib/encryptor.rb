require './lib/offset'
require './lib/key_maker'

class Encryptor
  include KeyMaker
  attr_reader :message, :key, :date, :offsets

  def initialize(message, key=make_key_string, date=format_today)
    @message = message
    @date = date
    @key = key
    @offsets = Offset.offsets(@key, @date)
  end

  def format_today
    date = Time.now
    date.strftime("%d%m") + date.strftime("%Y")[2..]
  end
end
