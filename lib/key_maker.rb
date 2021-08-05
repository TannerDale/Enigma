module KeyMaker
  def format_keys(keys)
    letter_keys = %i[a b c d]
    seperated_keys(keys).each_with_index.map do |key, i|
      [letter_keys[i], key.to_i]
    end.to_h
  end

  def seperated_keys(keys)
    keys.chars.each_cons(2).map do |key|
      key.join
    end
  end

  def make_key_string
    generate_number.to_s.rjust(5, '0')
  end

  def generate_number
    rand(0..99999)
  end
end
