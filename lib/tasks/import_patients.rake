# frozen_string_literal: true

namespace :import do
  desc "Import patients from CSV file"
  task patients: :environment do
    require "csv"

    csv_path = Rails.root.join("db/data/fake_medical_patients.csv")

    CSV.foreach(csv_path, headers: true) do |row|
      first_name = row["first_name"]
      last_name = row["last_name"]
      pesel = row["pesel"]
      city = row["city"]

      birth_year = "19#{pesel[0..1]}".to_i
      birth_month = pesel[2..3].to_i
      birth_day = pesel[4..5].to_i

      gender = (pesel[9].to_i.even?) ? "Female" : "Male"

      Patient.find_or_create_by!(
        first_name: first_name,
        last_name: last_name,
        gender: gender,
        date_of_birth: Date.new(birth_year, birth_month, birth_day),
        pesel: pesel,
        city: city
      )
    end

    puts "Patients imported successfully!"
  end
end
