class AddCategoryIdToStekjes < ActiveRecord::Migration[6.0]
  def change
    add_column :stekjes, :category_id, :string
  end
end
