class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :food_allergies
      t.integer :medical_condition_id
      t.string :height
      t.string :weight
      t.string :date_of_birth
      t.string :health_goal
      t.string :smoking
      t.string :alcohol
      t.string :food_preference
      t.text :breakfast
      t.text :lunch
      t.text :dinner
      t.integer :user_id

      t.timestamps
    end
  end
end
