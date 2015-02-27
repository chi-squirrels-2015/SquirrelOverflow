class AnswersController < ApplicationController

  def new
    @question = Question.find_by_id(params[:question_id])
    @new_answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    answer = Answer.new(answer_params)
    if answer.save
      redirect_to question_path(@question)
    else
      #some error handling here
    end
  end

  def edit

  end

  def update

  end

  # need to decide if we will implement this
  def destroy

  end

  private

  def answer_params
    params.require(:answer).permit(:content).merge({author: current_user, question: @question})
  end
end
