require './lib/encryptor'
require './lib/decryptor'
require './lib/key_maker'

class Enigma
  include KeyMaker

  def initialize
  end

  def format_today(date=Time.now)
    date.strftime('%d%m') + date.strftime('%Y')[2..]
  end

  def encrypt(message, key=make_key_string, date=format_today)
    Encryptor.encrypt(message, key, date)
  end

  def decrypt(message, key=make_key_string, date=format_today)
    Decryptor.decrypt(message, key, date)
  end
end
