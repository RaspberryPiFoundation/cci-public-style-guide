module NavigationHelper

  def render_navigation
    @html = ""

    @cc_config[:navigation_sections].each do |path, attributes|
      make_navigation_section(path, attributes)
    end

    @html.html_safe
  end

  private

  def make_navigation_section(section, section_attributes)
    section_title = (section_attributes.present? && section_attributes[:title]) || section.capitalize

    @html << content_tag(:h5, section_title)

    make_navigation_pages_list(section, section_attributes[:pages])

    return
  end

  def make_navigation_pages_list(section, pages)
    list_items = ""

    pages.each do |page, page_attributes|
      list_items << content_tag(:li, :class => current_page_class(section, page)) do
        page_title = (page_attributes.present? && page_attributes[:title]) || page.capitalize

        link_to(page_title, pages_show_path(section, page))
      end
    end

    @html << content_tag(:ul) do
      list_items.html_safe
    end

    return
  end

  def get_navigation_config_for(page)
    #@cc_config[:navigation_sections]
  end

  def current_page_class(section, page)
    'cur' if section == @section && page == @page
  end

end
