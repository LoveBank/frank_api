# This migration comes from frank (originally 20151108171702)
class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name, index: true

      t.timestamps null: false
    end
  end
end
