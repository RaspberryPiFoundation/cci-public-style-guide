class Section < ActiveRecord::Base
  include Hideable
  include Orderable

  has_many :pages

  validates_presence_of   :path, :title

  validates_uniqueness_of :order
  validates_uniqueness_of :path
end
