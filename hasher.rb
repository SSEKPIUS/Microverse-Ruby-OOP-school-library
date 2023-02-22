require 'json'

class Hasher
  def initialize
    @filename = ''
  end

  def save_data(filename, data)
    File.write("#{filename}.json", data.to_json)
  end

  def recover_data(filename)
    if File.exist?("#{filename}.json")
     return JSON.parse(File.read("#{filename}.json"))
    else
     return []
    end
  end
end