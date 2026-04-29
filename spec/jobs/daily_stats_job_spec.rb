require 'rails_helper'

RSpec.describe DailyStatsJob, type: :job do
  it "calls DailyStatisticsCalculator" do
    expect(DailyStatisticsCalculator).to receive(:call)

    described_class.perform_now
  end
end