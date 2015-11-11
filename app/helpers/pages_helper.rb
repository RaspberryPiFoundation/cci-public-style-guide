module PagesHelper

  def current_page_class(page)
    if page == @page
      'class="cur"'.html_safe
    end
  end
end
