class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show edit update destroy]
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    redirect_to controller: 'tests', action: 'show', id: "#{params[:test_id]}"
  end

  def show
    @question
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_question_path(@test, @question)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @question.update(question_params)
      redirect_to test_question_path(@test, @question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@test)
  end

  private

  def find_question
    @question = Test.find(params[:test_id]).questions.find(params[:id])
  end

  def find_questions
    @questions = Test.find(params[:test_id]).questions
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
