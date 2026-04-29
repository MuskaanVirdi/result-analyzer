require 'rails_helper'

RSpec.describe DailyStatisticsCalculator do
  describe ".call" do
    it "calculates daily stats correctly" do
      date = Date.today

      create(:test_result, subject: "Math", marks: 50, timestamp: date)
      create(:test_result, subject: "Math", marks: 90, timestamp: date)

      expect {
        described_class.call(date)
      }.to change(DailyStatistic, :count).by(1)

      stat = DailyStatistic.last

      expect(stat.daily_low).to eq(50)
      expect(stat.daily_high).to eq(90)
      expect(stat.result_count).to eq(2)
    end
  end
end