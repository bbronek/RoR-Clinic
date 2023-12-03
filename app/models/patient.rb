class Patient < ApplicationRecord
  has_many :appointments
  validates_presence_of :first_name, :last_name, :gender, :pesel, :date_of_birth
end
