class MonthlyAveragesJob < ApplicationJob
  queue_as :default

  def perform
    MonthlyAveragesCalculator.call
  end
end