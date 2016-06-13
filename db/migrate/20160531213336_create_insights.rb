class CreateInsights < ActiveRecord::Migration
  def change
    create_table :insights do |t|
      t.string :title
      t.text :body
      t.string :love_language
      t.string :category

      t.timestamps null: false
    end
  end
end
