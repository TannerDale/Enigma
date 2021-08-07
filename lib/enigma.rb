require './lib/run_encryption'
require './lib/run_decryption'
require './lib/key_maker'

class Enigma
  include KeyMaker

  def initialize
  end

  def format_today(date=Time.now)
    date.strftime('%d%m%y')
  end

  def encrypt(message, key=make_key_string, date=format_today)
    RunEncryption.encrypt(message, key, date)
  end

  def decrypt(message, key=make_key_string, date=nil)
    date ||= format_today
    RunDecryption.decrypt(message, key, date)
  end
end
