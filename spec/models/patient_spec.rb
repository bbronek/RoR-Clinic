require "rails_helper"

RSpec.describe Patient, type: :model do
  describe "validations" do
    it "validates presence of first_name" do
      patient = Patient.new(last_name: "Doe", gender: "Male", pesel: "12345678901", date_of_birth: Date.today)
      expect(patient).not_to be_valid
      expect(patient.errors[:first_name]).to include("can't be blank")
    end

    it "validates presence of last_name" do
      patient = Patient.new(first_name: "John", gender: "Male", pesel: "12345678901", date_of_birth: Date.today)
      expect(patient).not_to be_valid
      expect(patient.errors[:last_name]).to include("can't be blank")
    end

    it "validates presence of gender" do
      patient = Patient.new(first_name: "John", last_name: "Doe", pesel: "12345678901", date_of_birth: Date.today)
      expect(patient).not_to be_valid
      expect(patient.errors[:gender]).to include("can't be blank")
    end

    it "validates presence of pesel" do
      patient = Patient.new(first_name: "John", last_name: "Doe", gender: "Male", date_of_birth: Date.today)
      expect(patient).not_to be_valid
      expect(patient.errors[:pesel]).to include("can't be blank")
    end

    it "validates presence of date_of_birth" do
      patient = Patient.new(first_name: "John", last_name: "Doe", gender: "Male", pesel: "12345678901")
      expect(patient).not_to be_valid
      expect(patient.errors[:date_of_birth]).to include("can't be blank")
    end
  end
end
