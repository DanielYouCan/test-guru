class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show result update gist]
  before_action :get_end_time, only: %i[update result]
  before_action :check_end_time, only: %i[update]

  def show
  end

  def result
    if @end_time.present? && @end_time <= Time.now
      @test_passage.current_question_id = nil
      @test_passage.save
      session[:end_time] = nil
    end
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
    @test_passage.accept!(params[:answer_ids]) unless @test_passage.completed?

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
      @test_passage.update(passed: true) if @test_passage.passed?
      @badges = BadgesSelector.select_badges(@test_passage, current_user)
      if @badges.present?
        current_user.badges.push(@badges)
        flash[:notice] = t('.new_badges', count: @badges.count)
      end
    else
      render :show
    end
  end

  private

  def get_end_time
    @end_time = session[:"end_time_#{@test_passage.id}"]
  end

  def check_end_time
    if @end_time.present? && @end_time <= Time.now
      redirect_to result_test_passage_path(@test_passage)
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
