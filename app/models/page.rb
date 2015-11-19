class Page < ActiveRecord::Base
  include Hideable
  include Orderable

  belongs_to :section

  validates_presence_of :path, :title, :section_id
end
