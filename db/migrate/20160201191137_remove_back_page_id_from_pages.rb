class RemoveBackPageIdFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :back_page_id
  end
end
