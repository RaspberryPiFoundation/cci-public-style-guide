class Page < ActiveRecord::Base

  belongs_to :section

  validates_presence_of :path, :title, :order

end
