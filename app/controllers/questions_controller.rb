class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]
  before_action :find_questions, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: "<% @questions.each do |q| %><p><%= q.body %></p><% end %>"
  end

  def show
    render plain: @question.body
  end

  def new

  end

  def create
    question = Question.create(question_params)

    render plain: question.inspect
  end

  def destroy
    question = Question.find(params[:id])

    question.destroy
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_questions
    @questions = Test.find(params[:test_id]).questions
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
