FactoryBot.define do
  factory :test_result do
    student_name { "John" }
    subject { "Math" }
    marks { 80 }
    timestamp { Time.current }
  end
end