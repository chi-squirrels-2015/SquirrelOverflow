class QuestionsController < ApplicationController

  def index
    @questions = Question.recent
  end

  def show
    @question = Question.find_by_id(params[:id])
    @answers = @question.answers
    @new_answer = Answer.new(question: @question)
  end

  def new
    @question = Question.new
  end

  def preview
    options = { autolink: true,
                disable_indented_code_blocks: true,
                fenced_code_blocks: true,
                prettify: true}
    render json: {content: Redcarpet::Markdown.new(Redcarpet::Render::HTML, options).render(params[:question][:content]) }
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to action: "show", id: @question.id
    else
      render :new
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
