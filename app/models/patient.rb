class Patient < ApplicationRecord
  has_many :appointments
  validates_presence_of :first_name, :last_name, :gender, :pesel, :date_of_birth

  def self.ransackable_attributes(auth_object = nil)
    %w[gender last_name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[appointments]
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
