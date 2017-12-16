module GistsHelper
  def gist_link(gist)
    link_to t('.gist_link'), gist.gist_url, :target => '_blank'
  end

  def gist_question(question)
    link_to truncate(question.body, length: 25), admin_question_path(question)
  end

end
