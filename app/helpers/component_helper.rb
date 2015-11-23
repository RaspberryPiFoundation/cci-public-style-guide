module ComponentHelper

  def ui_variants(name)
    file_path        = "#{Rails.root}/config/_components/#{name}.yml"
    component_config = YAML.load(File.read(file_path)).with_indifferent_access

    render :partial => "shared/components_variants", :locals => component_config
  end

  def ui(name, options = {}, &block)
    options = prepare_options!(name, options, &block)

    render :partial => "_components/#{name}",   :locals => options
  end

  def ui_code(name, options, &block)
    options = prepare_options!(name, options, &block)

    render :partial => "shared/component_code", :locals => { :name => name, :options => options }
  end

  private

  def default_ui_options
    {
      :content      => nil,
      :html_classes => nil
    }
  end

  def prepare_options!(name, options, &block)
    options[:name]    = name
    options[:content] = capture(&block) if block_given?

    default_ui_options.merge(options).with_indifferent_access
  end

end
