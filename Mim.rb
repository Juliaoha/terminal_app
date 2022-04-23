require './lib/InputOutput.rb'
require './lib/Term.rb'
require './lib/ReadWrite.rb'
require './lib/PDFWriter.rb'

class Mim
    def initialize(input_output, read_write, pdf_writer)
        @input_output = input_output
        @read_write = read_write
        @pdf_writer = pdf_writer
        @running = true
        @terms = []
    end

    def run
        upload_json_terms
        while @running do
            @input_output.main_menu
            menu_choice = @input_output.get_user_input

            if menu_choice == '1'
                new_term = @input_output.create_new_term
                term = Term.new(new_term[:name],new_term[:sub_name], new_term[:description], new_term[:reference])
                @terms.push(term)
                @read_write.write(new_term)
            elsif menu_choice == '2'
                @input_output.search_term
            elsif menu_choice == '3'
                @input_output.print_to_pdf_message
                @pdf_writer.write_to_pdf(@read_write.read)
                @input_output.print_to_pdf_complete
            elsif menu_choice == '4'
                @input_output.quit_message
                @running = false
            else
                @input_output.invalid_option_message
            end
        end
    end

    def upload_json_terms
        json_term_array = @read_write.read
 
        json_term_array.each do |json_term|
            term = Term.new(json_term["name"],json_term["sub_name"], json_term["description"], json_term["reference"])
            @terms.push(term)
        end
    end
end

app = Mim.new(InputOutput.new, ReadWrite.new('./data.json'), PDFWriter.new)
app.run