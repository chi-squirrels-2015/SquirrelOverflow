class TagsController < ApplicationController
  def json_index
    render json: Tag.all.map{|t| t.name}
  end

end
