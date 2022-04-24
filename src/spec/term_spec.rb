# frozen_string_literal: true

require './lib/term'

describe Term do
  it 'Creates a new term' do
    term = Term.new('TDD', 'Test Driven Development', 'This is the description', 'reference')
    expect(term.name).to eq('TDD')
    expect(term.sub_name).to eq('Test Driven Development')
    expect(term.description).to eq('This is the description')
    expect(term.reference).to eq('reference')
    expect(Term.total_terms).to eq(1)
  end

  it 'Creates a new term without a sub name' do
    term = Term.new('TDD', nil, 'This is the description', 'reference')
    expect(term.sub_name).to eq(nil)
  end
end
