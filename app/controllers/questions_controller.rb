class QuestionsController < ApplicationController

  class CodeColorRender < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def index
    if params[:query]
      @questions = Question.search(params[:query])
    else
      @questions = Question.recent
    end
    puts @questions
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
    coderay = CodeColorRender.new(filter_html: true, hard_wrap: true)
    options = { autolink: true,
                fenced_code_blocks: true
              }
    render json: {content: Redcarpet::Markdown.new(coderay, options).render(params[:question][:content]) }
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
