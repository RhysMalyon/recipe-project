class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients, array: true, default: []
      t.integer :prep_time
      t.text :instructions
      t.integer :rating, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
