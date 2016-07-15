class AddProfileToLink < ActiveRecord::Migration
  def change
    add_reference :links, :profile, index: true
    add_foreign_key :links, :profiles
    add_column :links, :to_profile_id, :integer, index: true
  end
end
