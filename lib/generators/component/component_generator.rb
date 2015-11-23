class ComponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  desc "Creates a new component with templates for styles and partials."

  argument :name, {
    :banner   => "name:string",
    :desc     => "The name of your new component",
    :required => true,
    :type     => :string
  }

  argument :title, {
    :banner   => "title:string",
    :desc     => "A human-friendly title for the component",
    :required => true,
    :type     => :string
  }

  argument :description, {
    :banner   => "description:string",
    :desc     => "Briefly describe what your component is for",
    :required => false,
    :type     => :string
  }

  class_option :with_javascript, {
    :default => false,
    :desc    => "Include a JavaScript template file for this component.",
    :type    => :boolean
  }


  def set_vars
    @assets_root   = "#{Rails.root}/app/assets"
    @js_root       = "#{@assets_root}/javascripts/code_club"
    @scss_root     = "#{@assets_root}/stylesheets/code_club"

    @config_root   = "#{Rails.root}/config/_components"
    @partials_root = "#{Rails.root}/app/views/_components"

    @js_file       = "#{@js_root}/code_club.js"
    @scss_file     = "#{@scss_root}/code_club.scss"

    @description   = description
    @name          = name.sub(/^_/, '').underscore
  end

  def create_files
    puts "Attempting to create component: `#{@name}`"
    puts ""

    @config_destination = "#{@config_root}/#{@name}.yml"
    puts " - Generating component config file: #{@config_destination}"
    template "config.yml", @config_destination
    puts ""

    @partial_destination = "#{@partials_root}/_#{@name}.html.erb"
    puts " - Generating erb partial: #{@partial_destination}"
    template "_partial.html.erb", @partial_destination
    puts ""

    @stylesheet_destination = "#{@scss_root}/components/_#{@name}.scss"
    puts " - Generating Sass partial: #{@stylesheet_destination}"
    template "stylesheet.scss", @stylesheet_destination
    puts ""

    if options.with_javascript?
      @javascript_destination = "#{@js_root}/components/_#{@name}.js"
      puts " - Generating JavaScript file: #{@javascript_destination}"
      template "javascript.js", @javascript_destination
      puts ""
    end
  end

  def add_components_to_scss_and_js
    puts "Adding #{@name}.scss to main code_club.scss file"

    inject_into_file @scss_file, after: "//  Components\n" do
      "@import 'components/#{@name}';\n"
    end

    puts ""

    if options.with_javascript?
      puts "Adding #{@name}.js to main code_club.js file"

      inject_into_file @js_file, after: "//  Import Modules from component JavaScript files\n" do
        "import * as #{@name} from 'components/#{@name}';\n"
      end

      puts ""
    end
  end

  def summary
    puts "All done!"
  end
end
