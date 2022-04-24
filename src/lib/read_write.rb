# frozen_string_literal: true

require 'json'

# This class reads and writes to a JSON file
class ReadWrite
  def initialize(file_name)
    @file_name = file_name
  end

  def write(term)
    array = read
    array.push(term)
    File.open(@file_name, 'w') do |f|
      f.write(JSON.pretty_generate(array))
    end
  rescue Errno::ENOENT
    raise ReadFileError
  end

  def read
    file = File.read(@file_name)
    JSON.parse(file)
  rescue Errno::ENOENT
    raise ReadFileError
  end
end

# This class is the error handler for ReadWrite errors
class ReadFileError < StandardError
  def message
    'Error reading file. Please make sure you have a data.json file in src/'
  end
end
