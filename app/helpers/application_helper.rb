module ApplicationHelper
  def body_class
    class_name = 'page'
    class_name << " page--#{@page.path}" if @page.present?
    class_name
  end

  def markdown(text)
    if text.is_a? String
      engine   = Redcarpet::Render::HTML.new(:hard_wrap => true)
      renderer = Redcarpet::Markdown.new(engine)

      raw renderer.render text
    end
  end
end
