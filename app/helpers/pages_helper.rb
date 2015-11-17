module PagesHelper

  def page_title
    nav_config = get_navigation_config_for(@page)
  end

end
