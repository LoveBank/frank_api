class AddLastDailyReportIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :last_daily_report_id, :integer
  end
end
