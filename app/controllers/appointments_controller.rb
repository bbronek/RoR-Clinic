class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]
  before_action :set_patient, only: %i[new]
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @patient = Patient.find_by(id: params[:appointment][:patient_id])

    if @patient.nil?
      redirect_to root_path, alert: "Patient not found"
      return
    end

    @appointment = @patient.appointments.build(appointment_params)

    if @appointment.save
      redirect_to appointments_path, notice: "Appointment was successfully created."
    else
      render :new
    end
  end

  def edit
    @patient = @appointment.patient
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: "Appointment was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointment_path, notice: "Appointment was successfully destroyed"
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :price, :doctor_id, :patient_id)
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
end
