class AddShowInNavToPages < ActiveRecord::Migration
  def change
    add_column :pages, :show_in_nav, :boolean
  end
end
