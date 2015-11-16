module NavigationHelper

  def render_navigation
    @html = ""

    CC_CONFIG['navigation_sections'].each do |section|
      get_navigation_section(section)
    end

    @html.html_safe
  end

  private

  def get_navigation_section(section)
    @html << content_tag(:h5, section[:title])

    get_navigation_pages(section[:pages])

    return
  end

  def get_navigation_pages(pages)
    list_items = ""

    pages.each do |path, attributes|
      list_items << content_tag(:li, :class => current_page_class(path)) do
        page_title = (attributes.present? && attributes[:title]) || path.capitalize

        link_to(page_title, pages_show_path(path))
      end
    end

    @html << content_tag(:ul) do
      list_items.html_safe
    end

    return
  end

  def current_page_class(page)
    'cur' if page == @page
  end

end
