# frozen_string_literal: true

# Error handling class
class ReadFileError < StandardError
  def message
    'Error reading file. Please make sure you have a data.json file in the src/'
  end
end
