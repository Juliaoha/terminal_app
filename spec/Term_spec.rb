require './lib/Term.rb'
require './lib/Category.rb'

describe Term do
    it "Creates a new term" do
        term = Term.new("TDD", "Test Driven Development", "This is the description", ["reference1", "reference2"], [Category.new("Tech"),Category.new("Software Development") ])
        expect(term.name).to eq("TDD")
        expect(term.sub_name).to eq("Test Driven Development")
        expect(term.description).to eq("This is the description")
        expect(term.references).to eq(["reference1", "reference2"])
        expect(term.categories[0].name).to eq("Tech")
        expect(term.categories[1].name).to eq("Software Development")
        expect(Term.total_terms).to eq(1)
    end

    it "Creates a new term without a sub name" do
        term = Term.new("TDD", nil, "This is the description", ["reference1", "reference2"], [Category.new("Tech"),Category.new("Software Development") ])
        expect(term.sub_name).to eq(nil)
    end
end