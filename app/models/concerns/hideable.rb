module Hideable
  extend ActiveSupport::Concern

  included do
    before_create :set_default_values

    def set_default_values
      self.show_in_nav = true if show_in_nav.nil?
    end
  end

end
