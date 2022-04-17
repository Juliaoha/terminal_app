require './lib/Category.rb'

describe Category do
    it "Creates a new category" do
        category = Category.new("Tech")
        expect(category.name).to eq("Tech")
    end
end
