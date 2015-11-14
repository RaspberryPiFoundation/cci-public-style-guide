require 'yaml'

NAV_CONFIG = YAML.load_file("#{Rails.root}/config/navigation.yml").with_indifferent_access
