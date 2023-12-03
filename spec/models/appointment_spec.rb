require "rails_helper"

RSpec.describe Appointment, type: :model do
  describe "validations" do
    it "requires appointment_date to be present" do
      appointment = Appointment.new(price: 150.0, doctor: Doctor.new)
      appointment.valid?
      expect(appointment.errors[:appointment_date]).to include("can't be blank")
    end

    it "requires price to be present" do
      appointment = Appointment.new(appointment_date: Date.today, doctor: Doctor.new)
      appointment.valid?
      expect(appointment.errors[:price]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "belongs to a doctor" do
      appointment = Appointment.new
      expect(appointment).to respond_to(:doctor)
    end
  end
end
