class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.string :cuisine
      t.string :prep_time
      t.string :cook_time
      t.integer :serves
      t.string :photo

      t.timestamps
    end
  end
end
