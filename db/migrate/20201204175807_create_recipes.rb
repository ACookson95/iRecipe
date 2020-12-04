class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.integer :cooktime
      t.integer :preptime
      t.boolean :public
      t.integer :servings
      t.text :notes
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
