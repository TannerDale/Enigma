module KeyMaker
  def new_key
    generate_key
  end

  def generate_key
    format_number(rand(0..99999))
  end

  def formatt_number(number)
    number.to_s.rjust(5, '0')
  end
end
