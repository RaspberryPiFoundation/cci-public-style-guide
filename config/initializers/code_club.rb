require 'yaml'

CC_CONFIG = YAML.load_file("#{Rails.root}/config/code_club.yml").with_indifferent_access
