module ExamplesHelper

  def render_example(render_code = true, &block)
    content_tag(:div, :class => 'sg-example') do
      output = ''

      output << content_tag(:div, 'Example', :class => 'sg-example__preview')

      output << content_tag(:div, :class => 'sg-example__preview') do
        yield
      end

      if render_code
        output << content_tag(:code, :class => 'sg-example__code') do
          convert_code(capture(&block))
        end
      end

      raw output
    end
  end

  def convert_code(html)
    # Replace < and > with &lt; and &gt;
    html.gsub! '<', '&lt;'
    html.gsub! '>', '&gt;'

    # Trim leading and trailing whitespace
    html.strip!

    # Swap line breaks for <br>
    html.gsub! /\r/, ''
    html.gsub! /\n/, '<br>'

    # Replace spaces with non-breaking spaces
    html.gsub!(' ', '&nbsp;')

    return raw html
  end

end
