# This migration comes from frank (originally 20160210142929)
class RenameTablesForFrankNamespace < ActiveRecord::Migration
  def change
    rename_table :families, :frank_families
    rename_table :profiles, :frank_profiles
    rename_table :entries, :frank_entries
    rename_table :love_banks, :frank_love_banks
    rename_table :comments, :frank_comments
    rename_table :moods, :frank_moods
  end
end
