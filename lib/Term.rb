class Term
    attr_reader :name, :sub_name, :description, :references, :categories
    @@total_terms = 0

    def initialize(name, sub_name, description, reference, categories)
        @name = name
        @sub_name = sub_name
        @description = description
        @references = reference
        @categories = categories
        @@total_terms += 1
    end

    def self.total_terms
        @@total_terms
    end
end