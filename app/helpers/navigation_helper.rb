module NavigationHelper

  def render_navigation
    @html = '<nav class="sg-navigation">'

    Section.shown_in_nav.each do |section|
      make_navigation_section(section)
    end

    @html << '</nav>'

    @html.html_safe
  end

  private

  def make_navigation_section(section)
    @html << content_tag(:p, section.title, :class => 'sg-navigation-list-header u-h5')

    make_navigation_pages_list(section)

    return
  end

  def make_navigation_pages_list(section)
    list_items = ""

    section.pages.shown_in_nav.each do |page|
      list_items << content_tag(:li, :class => 'sg-navigation-item') do
        link_class = 'sg-navigation-link'
        link_class << current_page_class(section.path, page.path)

        link_to(page.title, page_path(section.path, page.path), :class => link_class)
      end
    end

    @html << content_tag(:ul, :class => 'sg-navigation-list') do
      list_items.html_safe
    end

    return
  end

  def current_page_class(section, page)
    page_class = ''

    if @section.present? && @page.present?
      page_class = ' sg-current-page' if section == @section.path && page == @page.path
    end

    page_class
  end

end
