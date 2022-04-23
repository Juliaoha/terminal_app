require 'json'

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
    end

    def read
        file = File.read(@file_name)
        terms_array = JSON.parse(file)

        return terms_array
    end
end