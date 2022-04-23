require 'colorize'

class InputOutput

    def initialize(input: $stdin, output: $stdout)
        @input = input
        @output = output
    end

    def main_menu
        @output.puts
        @output.puts "Welcome to Project Mim".colorize(:cyan)
        @output.puts "Please select from the following".colorize(:cyan)
        @output.puts
        @output.puts "[1] Create a new term".colorize(:yellow)
        @output.puts "[2] Search for a term".colorize(:green)
        @output.puts "[3] Print terms to PDF".colorize(:blue)
        @output.puts "[4] Quit".colorize(:light_magenta)
    end

    def create_new_term
        clear_screen
        term_hash = {}
        @output.puts "Please enter a name for your term".colorize(:yellow)
        name = get_user_input
        @output.puts "Please enter the sub name".colorize(:yellow)
        sub_name = get_user_input
        @output.puts "Please enter a description".colorize(:yellow)
        description = get_user_input
        @output.puts "Please enter a reference".colorize(:yellow)
        reference = get_user_input
        
        return {
            :name => name,
            :sub_name => sub_name,
            :description => description,
            :reference => reference
        }
    end

    def search_term
        clear_screen
        @output.puts "Please enter a term".colorize(:green)
    end

    def print_to_pdf_message
        clear_screen
        @output.puts "Printing terms to PDF...".colorize(:blue)
    end

    def print_to_pdf_complete
        @output.puts "Done :)".colorize(:blue)
    end

    def quit_message
        clear_screen
        @output.puts "Thank you for using Project Mim. See you next time".colorize(:light_magenta)
    end

    def get_user_input
        return @input.gets.strip
    end

    def invalid_option_message
        @output.puts "Invalid option".colorize(:red)
    end

    def display_search_results(results)
        count = 0
        @output.puts "Search Results:".colorize(:green)
        results.each do |result|
            count += 1
            @output.puts
            @output.puts "Result ##{count}"
            @output.puts "Name: #{result["name"].colorize(:light_magenta)}"
            @output.puts "Sub Name: #{result["sub_name"].colorize(:light_magenta)}"
            @output.puts "Description: #{result["description"].colorize(:light_magenta)}"
            @output.puts "Reference: #{result["reference"].colorize(:light_magenta)}"
            @output.puts
        end
    end

    def clear_screen
        @output.puts "\e[H\e[2J"
    end
end