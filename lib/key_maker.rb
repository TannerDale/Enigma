module KeyMaker
  def format_keys(key=make_key_string)
    key.chars.each_cons(2).map do |key|
      key.join
    end
  end

  def generate_number
    rand(0..99999)
  end

  def make_key_string
    generate_number.to_s.rjust(5, '0')
  end
end
