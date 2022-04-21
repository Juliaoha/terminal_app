require './lib/Term.rb'

describe Term do
    it "Creates a new term" do
        term = Term.new("TDD", "Test Driven Development", "This is the description", ["reference1", "reference2"])
        expect(term.name).to eq("TDD")
        expect(term.sub_name).to eq("Test Driven Development")
        expect(term.description).to eq("This is the description")
        expect(term.references).to eq(["reference1", "reference2"])
        expect(Term.total_terms).to eq(1)
    end

    it "Creates a new term without a sub name" do
        term = Term.new("TDD", nil, "This is the description", ["reference1", "reference2"])
        expect(term.sub_name).to eq(nil)
    end
end