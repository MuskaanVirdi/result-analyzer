class Api::TestResultsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    result = TestResult.new(test_result_params)

    if result.save
      render json: { message: "Saved" }, status: :created
    else
      render json: { errors: result.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def test_result_params
    params.require(:test_result).permit(:student_name, :subject, :marks, :timestamp)
  end
end