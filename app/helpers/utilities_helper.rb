module UtilitiesHelper

  BASE = 16

  def extract_classes_from_file(file_name)
    data = File.read(File.join(Rails.root, 'app', 'assets', 'code-club', 'stylesheets', 'utilities', file_name))
    matches = data.to_enum(:scan, /u-[a-zA-Z0-9|-]+*/).map { Regexp.last_match }
    matches.map { |match| match[0] }.uniq
  end


  def set_margin_classes
    @class_prefixes = ['.u-margin--', '.u-margin-top--', '.u-margin-right--', '.u-margin-bottom--', '.u-margin-left--']
    @class_values =  [ ['none', 0],
                       ['base', BASE],
                       ['xx-small', BASE * 0.25],
                       ['x-small',  BASE * 0.5],
                       ['small', BASE * 0.75],
                       ['large', BASE * 2],
                       ['x-large', BASE * 3],
                       ['xx-large', BASE * 4]]

  end

  def set_padding_classes
    @class_prefixes = ['.u-padding--', '.u-padding-top--', '.u-padding-right--', '.u-padding-bottom--', '.u-padding-left--']
    @class_values =  [ ['none', 0],
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
