class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.string :name
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
