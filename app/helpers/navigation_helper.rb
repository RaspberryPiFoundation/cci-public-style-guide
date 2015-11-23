module NavigationHelper

  def render_navigation
    @html = ""

    Section.shown_in_nav.each do |section|
      make_navigation_section(section)
    end

    @html.html_safe
  end

  private

  def make_navigation_section(section)
    @html << content_tag(:h5, section.title)

    make_navigation_pages_list(section)

    return
  end

  def make_navigation_pages_list(section)
    list_items = ""

    section.pages.shown_in_nav.each do |page|
      list_items << content_tag(:li, :class => current_page_class(section.path, page.path)) do
        link_to(page.title, page_path(section.path, page.path))
      end
    end

    @html << content_tag(:ul) do
      list_items.html_safe
    end

    return
  end

  def current_page_class(section, page)
    if @section.present? && @page.present?
      'cur' if section == @section.path && page == @page.path
    end
  end

end
