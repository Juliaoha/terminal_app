# frozen_string_literal: true

require 'amatch'

class Search
  def return_similar_terms(terms, search_word)
    similar_terms = []
    terms.each do |term|
      likeness_score = found_similar_term(search_word, term['name'])
      if likeness_score
        term['likeness_score'] = likeness_score
        similar_terms.push(term)
      end
    end

    sort_search_terms(similar_terms)[0, 5]
  end

  def found_similar_term(search_word, target_word)
    # https://stackoverflow.com/a/45335093
    return search_word.jaro_similar(target_word) if search_word.jaro_similar(target_word) > 0.8

    false
  end

  def sort_search_terms(terms)
    # sort in reverse order by adding a minus https://www.rubyguides.com/2017/07/ruby-sort/
    terms.sort_by { |k| -k['likeness_score'] }
  end
end
