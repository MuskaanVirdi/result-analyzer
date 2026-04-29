require 'rails_helper'

RSpec.describe MonthlyAveragesCalculator do
  describe ".call" do
    it "calculates averages when result_count >= 200" do
      5.times do |i|
        DailyStatistic.create!(
          date: Date.today - i,
          subject: "Math",
          daily_low: 50,
          daily_high: 100,
          result_count: 50
        )
      end

      allow(described_class).to receive(:valid_run_day?).and_return(true)

      expect {
        described_class.call
      }.to change(MonthlyAverage, :count).by(1)

      result = MonthlyAverage.last

      expect(result.avg_daily_high).to eq(100)
      expect(result.avg_daily_low).to eq(50)
      expect(result.total_result_count).to be >= 200
    end

    it "does nothing if no daily statistics exist" do
      allow(described_class).to receive(:valid_run_day?).and_return(true)

      expect {
        described_class.call
      }.not_to change(MonthlyAverage, :count)
    end
  end
end