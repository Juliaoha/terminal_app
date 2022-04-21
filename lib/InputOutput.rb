class InputOutput

    def initialize(input: $stdin, output: $stdout)
        @input = input
        @output = output
    end

    def main_menu
        @output.puts
        @output.puts "Welcome to Project Mim"
        @output.puts "Please select from the following"
        @output.puts "[1] Create a new term"
        @output.puts "[2] Search for a term"
        @output.puts "[3] Print terms to PDF"
        @output.puts "[4] Quit"
    end

    def create_new_term
        term_hash = {}
        @output.puts
        @output.puts "Please enter a name for your term"
        name = get_user_input
        @output.puts "Please enter the sub name"
        sub_name = get_user_input
        @output.puts "Please enter a description"
        description = get_user_input
        @output.puts "Please enter a reference"
        reference = get_user_input
        
        return {
            :name => name,
            :sub_name => sub_name,
            :description => description,
            :reference => reference
        }
    end

    def search_term
        @output.puts
        @output.puts "Please enter a term"
        search_term = get_user_input

        return search_term
    end

    def print_to_pdf_message
        @output.puts "Printing terms to PDF..."
    end

    def print_to_pdf_complete
        @output.puts "Done"
    end

    def quit_message
        @output.puts "Thank you for using Project Mim. See you next time"
    end

    def get_user_input
        return @input.gets.strip
    end
end