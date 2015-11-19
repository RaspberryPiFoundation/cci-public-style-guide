class Section < ActiveRecord::Base
  include Hideable
  include Orderable

  has_many :pages

  validates_presence_of   :path, :title
end
