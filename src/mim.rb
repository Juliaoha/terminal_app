# frozen_string_literal: true

require './lib/input_output'
require './lib/term'
require './lib/read_write'
require './lib/pdf_writer'
require './lib/search'

# Runs the app
class Mim
  def initialize(input_output, read_write, pdf_writer, search)
    @input_output = input_output
    @read_write = read_write
    @search = search
    @pdf_writer = pdf_writer
    @running = true
    @terms = []
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def run
    read_json_terms
    while @running
      @input_output.main_menu
      menu_choice = @input_output.user_input

      case menu_choice
      when '1'
        new_term = @input_output.create_new_term
        term = Term.new(new_term[:name], new_term[:sub_name], new_term[:description], new_term[:reference])
        @terms.push(term)
        @read_write.write(new_term)
      when '2'
        @input_output.search_term
        search_term = @input_output.user_input
        similar_terms = @search.return_similar_terms(@read_write.read, search_term)
        @input_output.display_search_results(similar_terms)
      when '3'
        @input_output.print_to_pdf_message
        @pdf_writer.write_to_pdf(@terms)
        @input_output.print_to_pdf_complete
      when '4'
        @input_output.quit_message
        @running = false
      else
        @input_output.invalid_option_message
      end
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def read_json_terms
    json_term_array = @read_write.read

    json_term_array.each do |json_term|
      term = Term.new(json_term['name'], json_term['sub_name'], json_term['description'], json_term['reference'])
      @terms.push(term)
    end
  end
end

app = Mim.new(InputOutput.new, ReadWrite.new('./data.json'), PDFWriter.new, Search.new)
app.run
