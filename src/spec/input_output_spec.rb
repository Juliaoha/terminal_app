# frozen_string_literal: true

require 'stringio'
require './lib/input_output'
require './lib/read_write'

# rubocop:disable Metrics/BlockLength
describe InputOutput do
  describe '#main_menu' do
    it 'Displays the main menu' do
      output = StringIO.new
      input_output = InputOutput.new(output: output)
      input_output.main_menu

      # rubocop:disable Layout/LineLength
      expect(output.string).to eq("\n\e[0;36;49mWelcome to Project Mim\e[0m\n\e[0;36;49mPlease select from the following\e[0m\n\n\e[0;33;49m[1] Create a new term\e[0m\n\e[0;32;49m[2] Search for a term\e[0m\n\e[0;34;49m[3] Print terms to PDF\e[0m\n\e[0;95;49m[4] Quit\e[0m\n")
      # rubocop:enable Layout/LineLength
    end
  end

  describe '#create_new_term' do
    it 'Returns a new term entered by the user' do
      input = StringIO.new("TDD\nTest Driven Development\nThis is a description\nThis is a reference\n")
      output = StringIO.new
      input_output = InputOutput.new(input: input, output: output)

      new_term = input_output.create_new_term

      # rubocop:disable Layout/LineLength
      expect(output.string).to eq("\e[H\e[2J\n\e[0;33;49mPlease enter a name for your term\e[0m\n\e[0;33;49mPlease enter the sub name\e[0m\n\e[0;33;49mPlease enter a description\e[0m\n\e[0;33;49mPlease enter a reference\e[0m\n")
      expect(new_term).to eq({ name: 'TDD', sub_name: 'Test Driven Development',
                               description: 'This is a description', reference: 'This is a reference' })
      # rubocop:enable Layout/LineLength
    end
  end

  describe '#search_term' do
    it 'prints search term message' do
      output = StringIO.new
      input_output = InputOutput.new(output: output)

      input_output.search_term

      expect(output.string).to eq("\e[H\e[2J\n\e[0;32;49mPlease enter a term\e[0m\n")
    end
  end

  describe '#print_to_pdf_message' do
    it 'prints the pdf message' do
      output = StringIO.new
      input_output = InputOutput.new(output: output)

      input_output.print_to_pdf_message

      expect(output.string).to eq("\e[H\e[2J\n\e[0;34;49mPrinting terms to PDF...\e[0m\n")
    end
  end

  describe '#print_to_pdf_complete' do
    it 'prints the pdf complete message' do
      output = StringIO.new
      input_output = InputOutput.new(output: output)

      input_output.print_to_pdf_complete

      expect(output.string).to eq("\e[0;34;49mDone :)\e[0m\n")
    end
  end

  describe '#quit_message' do
    it 'prints quit message' do
      output = StringIO.new
      input_output = InputOutput.new(output: output)

      input_output.quit_message

      expect(output.string).to eq("\e[H\e[2J\n\e[0;95;49mThank you for using Project Mim. See you next time\e[0m\n")
    end
  end

  describe '#user_input' do
    it 'gets the user input' do
      input = StringIO.new("TDD\n")
      input_output = InputOutput.new(input: input)

      user_input = input_output.user_input

      expect(user_input).to eq('TDD')
    end

    it 'gets the user input' do
      input = StringIO.new("         Variable             \n")
      input_output = InputOutput.new(input: input)

      user_input = input_output.user_input

      expect(user_input).to eq('Variable')
    end
  end

  describe '#invalid_option_message' do
    it 'prints invalid option message' do
      output = StringIO.new
      input_output = InputOutput.new(output: output)

      input_output.invalid_option_message

      expect(output.string).to eq("\e[0;31;49mInvalid option\e[0m\n")
    end
  end

  describe '#display_search_results' do
    it 'display search results' do
      read_write = ReadWrite.new('./spec/testData.json')
      output = StringIO.new
      input_output = InputOutput.new(output: output)

      test_array = read_write.read
      input_output.display_search_results(test_array)

      # rubocop:disable Layout/LineLength
      expect(output.string).to eq("\e[0;32;49mSearch Results:\e[0m\n\nResult #1\nName: \e[0;95;49mkkkkkkkkkkkkkkkk\e[0m\nSub Name: \e[0;95;49masdfasdfasdf\e[0m\nDescription: \e[0;95;49masdfasdfasdf\e[0m\nReference: \e[0;95;49masdfasdfds\e[0m\n\n\nResult #2\nName: \e[0;95;49mpppppopopopopo\e[0m\nSub Name: \e[0;95;49m2423423\e[0m\nDescription: \e[0;95;49masdasd\e[0m\nReference: \e[0;95;49masdas\e[0m\n\n\nResult #3\nName: \e[0;95;49masdasdastermasdasdasd\e[0m\nSub Name: \e[0;95;49masdasd\e[0m\nDescription: \e[0;95;49masdasd\e[0m\nReference: \e[0;95;49masdaad\e[0m\n\n")
      # rubocop:enable Layout/LineLength
    end
  end

  describe '#clear_screen' do
    it 'prints invalid option message' do
      output = StringIO.new
      input_output = InputOutput.new(output: output)

      input_output.clear_screen
      expect(output.string).to eq("\e[H\e[2J\n")
    end
  end
end
# rubocop:enable Metrics/BlockLength
