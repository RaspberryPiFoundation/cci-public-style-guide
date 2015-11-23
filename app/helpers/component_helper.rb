module ComponentHelper

  def ui_variants(name)
    component_config = get_component_config_for(name)

    render :partial => "shared/component_variants", :locals => component_config
  end

  def ui_variants_code(name)
    component_config = get_component_config_for(name)

    render :partial => "shared/component_variants_code", :locals => component_config
  end

  def ui(name, options = {}, show_code = false, &block)
    options = prepare_options!(name, options, &block)

    html_buffer = render :partial => "_components/#{name}", :locals => options

    if show_code
      html_buffer << ui_code(name, options, &block)
    end

    return html_buffer
  end

  def ui_code(name, options, &block)
    options = prepare_options!(name, options, &block)

    render :partial => "shared/component_code", :locals => { :name => name, :options => options }
  end

  private

  def default_ui_options
    {
      :content      => nil,
      :classes => nil
    }
  end

  def get_component_config_for(name)
    file_path        = "#{Rails.root}/config/_components/#{name}.yml"
    component_config = YAML.load(File.read(file_path)).with_indifferent_access
  end

  def prepare_options!(name, options, &block)
    options[:name]    = name
    options[:content] = capture(&block) if block_given?

    default_ui_options.merge(options).with_indifferent_access
  end

end
