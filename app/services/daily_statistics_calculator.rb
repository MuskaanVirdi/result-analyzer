class DailyStatisticsCalculator
  def self.call(date = Date.today)
    TestResult.where(timestamp: date.all_day)
              .group_by(&:subject)
              .each do |subject, records|

      marks = records.map(&:marks)

      DailyStatistic.create!(
        date: date,
        subject: subject,
        daily_low: marks.min,
        daily_high: marks.max,
        result_count: marks.size
      )
    end
  end
end