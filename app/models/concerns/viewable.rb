module Viewable
  extend ActiveSupport::Concern

  included do
    def has_view?
      File.exists?(view)
    end

    def view_filename
      path.gsub("-", "_")
    end
  end
end
