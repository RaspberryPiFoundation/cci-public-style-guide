class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string  :path
      t.string  :title
      t.integer :order

      t.timestamps null: false
    end
  end
end
