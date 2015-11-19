module Orderable
  extend ActiveSupport::Concern

  included do
    validates_presence_of   :order
    validates_uniqueness_of :order

    default_scope -> { order(:order => :asc) }
  end
end
