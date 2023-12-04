module Patients
  class AppointmentsController < ApplicationController
    before_action :set_patient

    def index
      @appointments = @patient.appointments
    end

    private

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end
  end
end
