# frozen_string_literal: true

class Term
  attr_reader :name, :sub_name, :description, :reference

  @@total_terms = 0

  def initialize(name, sub_name, description, reference)
    @name = name
    @sub_name = sub_name
    @description = description
    @reference = reference
    @@total_terms += 1
  end

  def self.total_terms
    @@total_terms
  end
end
