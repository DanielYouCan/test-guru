module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to yield, "https://github.com/#{author}/#{repo}", target: :_blank
  end

  def greeting
    greeting = "Welcome, " + content_tag(:b, current_user.email.split("@")[0]) + " Guru"
    greeting.html_safe
  end

end
