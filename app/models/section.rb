class Section < ActiveRecord::Base
  include Hideable

  has_many :pages

  validates_presence_of :path, :title, :order
end
