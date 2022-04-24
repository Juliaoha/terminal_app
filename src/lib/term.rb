# frozen_string_literal: true

# This class creates the Term objects
class Term
  attr_reader :name, :sub_name, :description, :reference

  def initialize(name, sub_name, description, reference)
    @name = name
    @sub_name = sub_name
    @description = description
    @reference = reference
  end
end
