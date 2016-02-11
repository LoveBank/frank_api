# This migration comes from frank (originally 20151220134900)
class CreateLoveBanks < ActiveRecord::Migration
  def change
    create_table :love_banks do |t|
      t.integer :rating
      t.text :note
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
