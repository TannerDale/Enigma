
class FileWorker
  def initialize(read_file, write_file)
    @read_file = read_file
    @write_file = write_file
  end

  def read_file(read_file)
    File.open(@read_file, 'r').first
  end

  def write_to_file(file, info)
    new_file = File.open(file, "w")
    new_file.write(info)
    new_file.close
  end

  def output
    write_to_file(@write_file, @result[@method])
    formatted_output
  end

  def formatted_output
    "Created '#{@write_file}' with the key #{@result[:key]} and date #{@result[:date]}"
  end
end
