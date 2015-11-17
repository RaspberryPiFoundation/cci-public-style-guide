module ComponentHelper

  def ui(name, options = {}, &block)
    buffer = capture(&block) if block_given?

    @html = ""
    @html << "START OF #{name}<br>"
    @html << buffer if buffer.present?
    @html << "END OF #{name}"
    @html.html_safe
  end

end
