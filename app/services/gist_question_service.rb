class GistQuestionService

  include ActionView::Helpers

  attr_reader :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV["MY_TOKEN"])
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_created?
    status = @client.last_response.status

    true if status == 201
  end

  private

  def gist_params
    {
      description: t('gist_desc',title: @test.title),
      files: {
        "test-guru-question.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
