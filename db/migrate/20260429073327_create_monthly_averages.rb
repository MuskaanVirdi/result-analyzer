class CreateMonthlyAverages < ActiveRecord::Migration[8.1]
  def change
    create_table :monthly_averages do |t|
      t.float :avg_daily_low
      t.float :avg_daily_high
      t.integer :total_result_count
      t.datetime :calculated_at

      t.timestamps
    end
  end
end
