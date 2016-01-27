class Section < ActiveRecord::Base
  include Hideable
  include Orderable
  include Viewable

  has_many :pages

  validates_presence_of   :path, :title

  validates_uniqueness_of :order
  validates_uniqueness_of :path

  def partial_path
    "sections/content/#{view_filename}.html.erb"
  end

  def view
    Rails.root.join("app", "views", "sections", "content", "_#{view_filename}.html.erb")
  end
end
