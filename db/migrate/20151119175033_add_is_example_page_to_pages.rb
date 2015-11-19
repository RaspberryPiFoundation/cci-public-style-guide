class AddIsExamplePageToPages < ActiveRecord::Migration
  def change
    add_column :pages, :example_page, :boolean
    add_column :pages, :back_page_id, :integer
  end
end
