class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def gist
    gistservice = GistQuestionService.new(@test_passage.current_question)
    gistservice.call

    link_to_gist = (helpers.link_to 'Gist', gistservice.gist_url)

    flash_options = if gistservice.gist_created?
      current_user.add_gist(@test_passage.current_question, gistservice.gist_url)
      { notice: t('.success_html', gist: link_to_gist)}
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
      @badges = Badge.find_badges(@test_passage, current_user)
      if !@badges.empty?
        current_user.badges.push(@badges)
        flash[:notice] = t('.new_badges', amount: @badges.count)
      end
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
