module ApplicationHelper
  def display_nav_links
    if !!session[:teacher_id]
      content_tag(:h2, link_to("Log Out", logout_path), :class=>nil)
    end
  end
end
