require 'rails_helper'

RSpec.describe MonthlyAveragesJob, type: :job do
  it "calls MonthlyAveragesCalculator" do
    # Pretend today is always a valid run day
    allow(MonthlyAveragesCalculator).to receive(:valid_run_day?).and_return(true)

    expect(MonthlyAveragesCalculator).to receive(:call)

    described_class.perform_now
  end
end