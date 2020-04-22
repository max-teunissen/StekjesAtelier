class RemoveCategoryFromStekjes < ActiveRecord::Migration[6.0]
  def change

    remove_column :stekjes, :category, :string
  end
end
