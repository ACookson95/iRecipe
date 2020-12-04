class CreateCookbookRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbook_recipes do |t|
      t.string :recipe_id
      t.text :notes
      t.belongs_to :cookbook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
