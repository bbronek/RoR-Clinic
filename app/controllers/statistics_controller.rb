class StatisticsController < ApplicationController
  def patient_births
    @birth_data = Patient.group("EXTRACT(YEAR FROM date_of_birth)").count
    respond_to do |format|
      format.html
      format.json { render json: @birth_data }
    end
  end
end
