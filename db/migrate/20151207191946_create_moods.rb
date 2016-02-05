class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.integer :rating
      t.text :note
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
