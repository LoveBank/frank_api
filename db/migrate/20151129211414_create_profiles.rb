class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      # t.uuid :id, :primary_key => true
      t.string :firstname
      t.string :lastname
      t.string :email, index: true
      t.string :phone

      t.references :family, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
