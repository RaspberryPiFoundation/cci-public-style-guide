module UtilitiesHelper

  UTILITIES_PATH = "app/assets/code-club/stylesheets/utilities/"

  def extract_classes_from_file(file_name)

    file = File.open(UTILITIES_PATH + file_name, "r")
    data = file.read
    file.close

    matches = data.to_enum(:scan, /\.[a-zA-Z|-]+*/).map { Regexp.last_match }
    matches.map  { |match| match[0] }
  end

end
