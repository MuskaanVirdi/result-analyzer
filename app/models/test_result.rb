class TestResult < ApplicationRecord
# app/models/test_result.rb
  validates :student_name, :subject, :marks, :timestamp, presence: true
end
