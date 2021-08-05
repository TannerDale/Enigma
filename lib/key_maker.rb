module KeyMaker
  def format_keys(key=make_key_string)
    letter_keys = [:a, :b, :c, :d]
    seperated_keys(key).each_with_index.map do |key, i|
      [letter_keys[i], key.to_i]
    end.to_h
  end

  def seperated_keys(key)
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
