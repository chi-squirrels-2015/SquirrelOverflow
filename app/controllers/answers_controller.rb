class Answers < ApplicationController

  def new
    @question = Question.find_by_id(params[:question_id])
    @answer = Answer.new
  end

  def create
    answer = Answer.new(answer_params)
    respond_to do |format|
        if answer.save
          format.html { redirect_to answer.question, notice: 'Answer was successfully created.' }
          format.js   {}
          format.json { render json: answer, status: :created, location: answer }
        else
          format.html { render action: "new" }
          format.json { render json: answer.errors, status: :unprocessable_entity }
        end
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
