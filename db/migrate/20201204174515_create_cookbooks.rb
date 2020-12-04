class CreateCookbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbooks do |t|
      t.string :name
      t.string :cover
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
