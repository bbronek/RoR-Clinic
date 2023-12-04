class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :appointment_date, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :doctor_id, presence: true
  validates :patient_id, presence: true
  validate  :validate_appointment_time

  private

  def validate_appointment_time
    return unless appointment_date.present? && doctor_id.present?

    conflicting_appointment = Appointment.where(doctor_id: doctor_id, appointment_date: appointment_date)
                                         .where.not(id: id)
                                         .where("appointment_date + interval '20 minutes' > ?", appointment_date)

    errors.add(:appointment_date, "conflicts with another appointment") if conflicting_appointment.exists?
  end
end
