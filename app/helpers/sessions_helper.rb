module SessionsHelper
  def flash_message
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    elsif flash[:notice]
      content_tag :p, flash[:notice], class: 'flash notice'
    end
  end
end
