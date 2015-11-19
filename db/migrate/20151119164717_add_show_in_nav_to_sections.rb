class AddShowInNavToSections < ActiveRecord::Migration
  def change
    add_column :sections, :show_in_nav, :boolean
  end
end
