module ExamplesHelper

  def render_example(options, &block)
    options = {
      :with_code => true,
      :only_code => false
    }.merge(options)

    content_tag(:div, :class => 'sg-example') do
      output = ''
      output << content_tag(:div, 'Example', :class => 'sg-example__heading')

      if !options[:only_code]
        output << content_tag(:div, :class => 'sg-example__preview') do
          yield
        end
      end

      if options[:with_code]
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

    # Replace references to local assets with path from bower package
    location_local = 'assets/code-club/'
    location_bower = 'bower_components/code-club/dist/'

    html.gsub!(location_local, location_bower)

    return raw html
  end

end
