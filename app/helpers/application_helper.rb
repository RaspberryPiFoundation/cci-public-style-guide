module ApplicationHelper

  def body_class
    "page page--#{@page}"
  end

  def markdown(text)
    if text.is_a? String
      engine   = Redcarpet::Render::HTML.new hard_wrap: true
      renderer = Redcarpet::Markdown.new engine

      raw renderer.render text
    end
  end

end
