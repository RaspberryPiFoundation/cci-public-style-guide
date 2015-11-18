class Section < ActiveRecord::Base

  has_many :pages

  validates_presence_of :path, :title, :order

end
