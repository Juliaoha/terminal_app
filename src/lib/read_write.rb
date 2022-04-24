# frozen_string_literal: true

require 'json'

class ReadWrite
  def initialize(file_name)
    @file_name = file_name
  end

  def write(term)
    begin
      array = read
      array.push(term)
      File.open(@file_name, 'w') do |f|
        f.write(JSON.pretty_generate(array))
      end
    rescue Errno::ENOENT
      raise ReadFileError
    end
  end

  def read
    begin
      file = File.read(@file_name)
      JSON.parse(file)
    rescue Errno::ENOENT
      raise ReadFileError
    end
  end
end

class ReadFileError < StandardError
  def message
    'Error reading file. Please make sure you have a data.json file in src/'
  end
end
