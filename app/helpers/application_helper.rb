module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to yield, "https://github.com/#{author}/#{repo}", target: :_blank
  end

  def flash_message
    message = ""
    flash.each do |key, value|
      message = (content_tag :p, value, class: "flash #{key}")
    end
    message
  end
end
