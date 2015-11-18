class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string  :path
      t.string  :title
      t.integer :order

      t.timestamps null: false
    end
  end
end
