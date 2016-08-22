module ExamplesHelper

  def render_example(options = {}, type='html', &block)

    formatter = Rouge::Formatters::HTML.new
    formatter = Rouge::Formatters::HTMLLinewise.new(formatter, class_format: 'line-%i')
    lexer = select_lexer(type)

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
          content_tag(:pre) do
            render inline: Rouge.highlight(capture(&block), lexer, formatter)
          end
        end
      end

      raw output
    end
  end

  def highlight_html_example(html, classes='')
    highlight_example(html, type='html', classes)
  end

  def highlight_sass_example(sass, classes='')
    highlight_example(sass, type='sass', classes)
  end

  def highlight_css_example(sass, classes='')
    highlight_example(sass, type='css', classes)
  end

  def highlight_example(code, type='', classes='')
    formatter = Rouge::Formatters::HTML.new
    lexer = select_lexer(type)

    content_tag(:code, :class => classes) do
        render inline: Rouge.highlight(code, lexer, formatter)
    end

  end

  def select_lexer(type)
    case type
      when 'sass'
        Rouge::Lexers::Scss.new
      when 'css'
        Rouge::Lexers::CSS.new
      when 'html'
        Rouge::Lexers::HTML.new
      else
        Rouge::Lexers::Shell.new
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
