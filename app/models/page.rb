class Page < ActiveRecord::Base
  include Hideable
  include Orderable

  belongs_to :section

  before_save :set_default_example_page_value

  validates_presence_of :path, :title, :section_id
  validates_presence_of :back_page_id, :if => :is_example_page?

  def back_page
    Page.find(@page.back_page_id) if is_example_page?
  end

  def has_view?
    File.exists?(view)
  end

  def is_example_page?
    example_page
  end

  def partial_path
    "pages/content/#{section.path}/#{view_filename}.html.erb"
  end

  def set_default_example_page_value
    self.example_page = false if example_page.nil?
    true
  end

  def view_filename
    path.gsub("-", "_")
  end

  def view
    Rails.root.join("app", "views", "pages", "content", "#{section.path}", "_#{view_filename}.html.erb")
  end
end
