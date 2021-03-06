module ApplicationHelper

  FLASH_CLASS = {
      'notice' =>'alert alert-info', 'success' => 'alert alert-success',
      'error' => 'alert alert-danger', 'alert' => 'alert alert-warning' }

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to yield, "https://github.com/#{author}/#{repo}", target: :_blank
  end

  def greeting
    greeting = "Welcome, " + content_tag(:b, current_user.full_name) + " Guru"
    greeting.html_safe
  end

  def flash_class(key)
    FLASH_CLASS[key]
  end

end
