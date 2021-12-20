class CreateRecipeFood < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_foods do |t|
      t.decimal :quantity, precision: 10, scale: 2

      t.timestamps
    end
  end
end
