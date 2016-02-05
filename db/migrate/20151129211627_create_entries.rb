class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.boolean :received
      t.boolean :private
      t.integer :rating
      t.text :note
      t.datetime :occurred_on
      t.integer :linked_profile_id, :integer, index: true
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
