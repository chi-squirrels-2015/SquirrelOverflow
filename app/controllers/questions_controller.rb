class QuestionsController < ApplicationController

  def index
    @questions = Question.recent
  end

  def show
    @question = Question.find_by_id(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    if question.save
      redirect_to action: "show", id: question.id
    else
      redirect_to action: "new"
    end
  end

  def edit
     @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
  end

  # need to decide if we will implement this
  def destroy
    Question.find(params[:id]).destroy
    redirect_to "/questions}"
  end

  private

  def question_params
    params.require(:question).permit(:title, :content).merge({author: current_user})
  end

end
