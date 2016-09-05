module UtilitiesHelper


  BASE = 16

  def extract_classes_from_file(file_name, special_prefix='u-')
    data = File.read(File.join(Rails.root, 'app', 'assets', 'code-club', 'stylesheets', 'utilities', file_name))
    matches = data.to_enum(:scan, /#{special_prefix}[a-zA-Z0-9|-]+*/).map { Regexp.last_match }
    matches.map { |match| match[0] }.uniq
  end


  def get_location_prefixes_for(attribute)
    ['.u-' + attribute + '--',
     '.u-' + attribute + '-top--',
     '.u-' + attribute + '-right--',
     '.u-' + attribute + '-bottom--',
     '.u-' + attribute + '-left--']
  end


  def get_margin_classes
    [['none', 0],
     ['base', BASE],
     ['xx-small', BASE * 0.25],
     ['x-small',  BASE * 0.5],
     ['small', BASE * 0.75],
     ['large', BASE * 2],
     ['x-large', BASE * 3],
     ['xx-large', BASE * 4]]
  end

  def get_padding_classes
    [['none', 0],
     ['base', BASE],
     ['xx-small', BASE * 0.25],
     ['x-small',  BASE * 0.5],
     ['small', BASE * 0.75],
     ['large', BASE * 1.25],
     ['x-large', BASE * 2],
     ['xx-large', BASE * 3],
     ['xxx-large', BASE * 4],
     ['xxxx-large', BASE * 5]]
  end

end
