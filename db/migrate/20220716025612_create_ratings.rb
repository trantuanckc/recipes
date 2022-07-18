class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :rated_by
      t.integer :recipe_id
      t.integer :point
      t.string :content
      t.string :status
      t.timestamps
    end

    add_index :ratings, :rated_by
    add_index :ratings, :recipe_id
    add_index :ratings, [:rated_by, :recipe_id], unique: true
  end
end
