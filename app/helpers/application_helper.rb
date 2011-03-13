module ApplicationHelper

  def title string
    content_for(:title, string)
    string
  end 

end
