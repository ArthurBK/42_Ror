class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :pict
      t.text :description
      t.references :brand, index: true, foreign_key: true
      t.integer :price

      t.timestamps null: false
    end
  end
end
