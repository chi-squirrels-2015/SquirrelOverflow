class VotesController < ApplicationController

  def upvote

    @question = Question.find(params[:question_id])
    vote = Vote.new(votable: @question, voter: current_user, upvote: true)
    respond_to do |format|
      if vote.save!
        format.html { @question.vote_count }
        format.js do
          render js: <<-endjs
              #{@question.vote_count}
          endjs
        end
      else
        format.html { @question.vote_count }
        format.js do
          render js: <<-endjs
            alert("vote fail")
          endjs
        end
      end
    end
  end

  def downvote
    @question = Question.find(params[:question_id])
    vote = Vote.new(votable: @question, voter: current_user, upvote: false)
    respond_to do |format|
      if vote.save!
        format.html { @question.vote_count }
        format.js do
          render js: <<-endjs
              #{@question.vote_count}
          endjs
        end
      else
        format.html { @question.vote_count }
        format.js do
          render js: <<-endjs
            alert("vote fail")
          endjs
        end
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:content).merge({voter: current_user, question: @question})
  end
end
