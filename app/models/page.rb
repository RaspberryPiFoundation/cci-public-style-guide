class Page < ActiveRecord::Base
  include Hideable

  belongs_to :section

  validates_presence_of :path, :title, :order, :section_id
end
