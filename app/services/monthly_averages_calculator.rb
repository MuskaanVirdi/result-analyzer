class MonthlyAveragesCalculator
  def self.call
    return unless valid_run_day?

    stats = DailyStatistic.order(date: :desc)

    selected = []
    total_count = 0

    stats.each do |stat|
      selected << stat
      total_count += stat.result_count

      break if total_count >= 200
    end

    return if selected.empty?

    avg_high = selected.sum(&:daily_high) / selected.size.to_f
    avg_low  = selected.sum(&:daily_low) / selected.size.to_f

    MonthlyAverage.create!(
      avg_daily_high: avg_high,
      avg_daily_low: avg_low,
      total_result_count: total_count,
      calculated_at: Time.current
    )
  end

  def self.valid_run_day?
    today = Date.today

    # get all Wednesdays in month
    wednesdays = (1..31)
      .map { |d| Date.new(today.year, today.month, d) rescue nil }
      .compact
      .select(&:wednesday?)

    third_wednesday = wednesdays[2]

    week_range = third_wednesday.beginning_of_week..third_wednesday.end_of_week

    today.monday? && week_range.cover?(today)
  end
end