require 'stringio'
require './lib/InputOutput.rb'

describe InputOutput do
    describe '#main_menu' do
        it "Displays the main menu" do
            output = StringIO.new
            input_output = InputOutput.new(output: output)
            input_output.main_menu
            expect(output.string).to eq("\nWelcome to Project Mim\nPlease select from the following\n[1] Create a new term\n[2] Search for a term\n[3] Print terms to PDF\n[4] Quit\n")
        end
    end

    describe  '#create_new_term' do   
        it 'Returns a new term entered by the user' do 
            input = StringIO.new("TDD\nTest Driven Development\nThis is a description\nThis is a reference\n")
            output = StringIO.new
            input_output = InputOutput.new(input: input, output: output)

            new_term = input_output.create_new_term

            expect(output.string).to eq("\nPlease enter a name for your term\nPlease enter the sub name\nPlease enter a description\nPlease enter a reference\n")
            expect(new_term).to eq({:name => 'TDD', :sub_name => 'Test Driven Development', :description => 'This is a description', :reference => 'This is a reference'})
        end
    end

    describe '#search_term' do
        it 'returns a search term' do
            input = StringIO.new("TDD\n")
            output = StringIO.new
            input_output = InputOutput.new(input: input, output: output)

            search_term = input_output.search_term

            expect(output.string).to eq("\nPlease enter a term\n")
            expect(search_term).to eq("TDD") 
        end
    end

    describe '#print_to_pdf_message' do
        it 'prints the pdf message' do
            output = StringIO.new
            input_output = InputOutput.new(output: output)

            input_output.print_to_pdf_message

            expect(output.string).to eq("Printing terms to PDF...\n")
        end
    end

    describe '#print_to_pdf_complete' do
        it 'prints the pdf complete message' do
            output = StringIO.new
            input_output = InputOutput.new(output: output)

            input_output.print_to_pdf_complete

            expect(output.string).to eq("Done\n")
        end
    end

    describe '#quit_message' do
        it 'prints quit message' do
            output = StringIO.new
            input_output = InputOutput.new(output: output)

            input_output.quit_message

            expect(output.string).to eq("Thank you for using Project Mim. See you next time\n")
        end
    end

    describe '#get_user_input' do
        it 'gets the user input' do
            input = StringIO.new("TDD\n")
            input_output = InputOutput.new(input: input)

            user_input = input_output.get_user_input

            expect(user_input).to eq("TDD")
        end

        it 'gets the user input' do
            input = StringIO.new("         Variable             \n")
            input_output = InputOutput.new(input: input)

            user_input = input_output.get_user_input

            expect(user_input).to eq("Variable")
        end
    end    
end
