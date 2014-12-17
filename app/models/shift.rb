class Shift < ActiveRecord::Base
  AVAILABILITY = 'available'
  SEEKING = 'seek'

  belongs_to :user

  scope :availables, -> { where(slot_type: AVAILABILITY) }
  scope :seekings, -> { where(slot_type: SEEKING) }

  validates :slot_type, inclusion: { in: [AVAILABILITY, SEEKING] }, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
