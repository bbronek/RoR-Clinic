class PatientsController < ApplicationController
  def index
    @patients = Patient.all

    @q = @patients.ransack(params[:q])
    @patients = @q.result(distinct: true).order(:last_name).page(params[:page])
  end

  def show
    @patient = Patient.find(params[:id])
    @appointments = @patient.appointments
  end
end
