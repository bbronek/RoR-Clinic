require "rails_helper"

RSpec.describe Doctor, type: :model do
  describe "validations" do
    it "validates presence of first_name" do
      doctor = Doctor.new(last_name: "Doe", specialization: "General Medicine")
      expect(doctor).not_to be_valid
      expect(doctor.errors[:first_name]).to include("can't be blank")
    end

    it "validates presence of last_name" do
      doctor = Doctor.new(first_name: "John", specialization: "General Medicine")
      expect(doctor).not_to be_valid
      expect(doctor.errors[:last_name]).to include("can't be blank")
    end

    it "validates presence of specialization" do
      doctor = Doctor.new(first_name: "John", last_name: "Doe")
      expect(doctor).not_to be_valid
      expect(doctor.errors[:specialization]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "has many appointments" do
      doctor = Doctor.create(first_name: "Jan", last_name: "Kowalski", specialization: "rodzinny")
      appointment1 = Appointment.new(doctor: doctor)
      appointment2 = Appointment.new(doctor: doctor)

      expect(appointment1.doctor).to eq(doctor)
      expect(appointment2.doctor).to eq(doctor)
    end
  end
end
