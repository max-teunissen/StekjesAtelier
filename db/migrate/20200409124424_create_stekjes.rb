class CreateStekjes < ActiveRecord::Migration[6.0]
  def change
    create_table :stekjes do |t|
      t.string :name
      t.text :image
      t.string :category
      t.integer :size
      t.text :description
      t.integer :price
      t.integer :care
      t.boolean :instock

      t.timestamps
    end
  end
end
