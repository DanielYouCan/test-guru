class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def gist
    gistservice = GistQuestionService.new(@test_passage.current_question)
    gistclient = gistservice.client
    gistservice.call

    url = gistclient.last_response.data[:html_url]
    link_to_gist = (helpers.link_to 'Gist', url)

    flash_options = if gistservice.gist_created?
      { notice: t('.success_html', gist: link_to_gist)}
    else
      { alert: t('.failure') }
    end

    current_user.add_gist(@test_passage.current_question, url) if gistservice.gist_created?

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
