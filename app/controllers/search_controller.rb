class SearchController < ApplicationController

  def show
    query = Tag.find_by_name(search_term)
    @result = query.questions
  end

end
