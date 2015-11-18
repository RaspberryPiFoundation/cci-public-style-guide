class AddSectionIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :section_id, :integer
    add_index :pages, :section_id
  end
end
