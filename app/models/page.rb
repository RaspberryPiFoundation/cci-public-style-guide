class Page < ActiveRecord::Base
  include Hideable
  include Orderable

  belongs_to :section

  before_save :set_default_example_page_value

  validates_presence_of :path, :title, :section_id
  validates_presence_of :back_page_id, :if => :is_example_page?

  def is_example_page?
    example_page
  end

  def set_default_example_page_value
    self.example_page = false if example_page.nil?
    true
  end
end
