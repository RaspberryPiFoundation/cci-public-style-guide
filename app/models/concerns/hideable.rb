module Hideable
  extend ActiveSupport::Concern

  included do
    before_create :set_default_values

    scope :shown_in_nav, -> { where(:show_in_nav => true) }

    def set_default_values
      self.show_in_nav = true if show_in_nav.nil?
      true
    end
  end

end
