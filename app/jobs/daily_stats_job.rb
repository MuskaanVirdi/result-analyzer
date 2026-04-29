class DailyStatsJob < ApplicationJob
  queue_as :default

  def perform
    DailyStatisticsCalculator.call(Date.today)
  end
end