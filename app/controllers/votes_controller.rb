class VotesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    vote = Vote.new(vote_params)

    if vote.save
      "horray!"
    end

  end

  private

  def vote_params
    params.require(:vote).permit(:content).merge({voter: current_user, question: @question})
  end
end
