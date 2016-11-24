module SectionHeaderHelper
  include ActionView::Helpers::OutputSafetyHelper

  def section_header(title, heading_tag = :h2)
    slug = slugify(title)

    icon = content_tag(:span, nil, :class => 'c-icon c-icon--link sg-section-heading__icon')

    link_content = [
      icon,
      title,
    ].join(' ')

    link_href = [
      '#',
      slugify(title),
    ].join

    heading_link = link_to(raw(link_content), link_href, :class => 'sg-section-heading__link')

    content_tag(raw(heading_tag), heading_link, :id => slug, :class => 'sg-section-heading')
  end
end
