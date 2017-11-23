class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy]
  before_action :find_questions, only: [:index, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @questions.inspect
  end

  def show
    render plain: @question.body
  end

  def new

  end

  def create
    question = @questions.create(question_params)

    render plain: question.inspect
  end

  def destroy
    @question.destroy

    render plain: 'Question has been destoyed'
  end

  private

  def find_question
    @question = Test.find(params[:test_id]).questions.find(params[:id])
  end

  def find_questions
    @questions = Test.find(params[:test_id]).questions
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
