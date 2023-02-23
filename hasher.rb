require 'json'

class Hasher
  def initialize
    @filename = ''
  end

  def save_data(filename, data)
    File.write("#{filename}.json", JSON.pretty_generate(data))
  end

  def recover_data(filename)
    return JSON.parse(File.read("#{filename}.json")) if File.exist?("#{filename}.json")
  end
end
