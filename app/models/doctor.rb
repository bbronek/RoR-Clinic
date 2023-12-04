class Doctor < ApplicationRecord
  has_many :appointments
  validates_presence_of :first_name, :last_name, :specialization

  def full_name
    "#{first_name} #{last_name}"
  end
end
