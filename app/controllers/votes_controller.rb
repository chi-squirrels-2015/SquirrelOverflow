class VotesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])

  end

  private

  def vote_params

  end
end
