# Daily at 6 PM
every 1.day, at: '6:00 pm' do
  runner "DailyStatsJob.perform_later"
end

# Monthly logic check (runs daily, but internally decides)
every 1.day, at: '6:05 pm' do
  runner "MonthlyAveragesJob.perform_later"
end