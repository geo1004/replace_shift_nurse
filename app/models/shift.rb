class Shift < ActiveRecord::Base
  AVAILABILITY = 'available'
  SEEKING = 'seek'

  belongs_to :user

  scope :availables, -> { where(slot_type: AVAILABILITY) }
  scope :seekings, -> { where(slot_type: SEEKING) }
  scope :exclude_user, ->(user) { where.not(user: user) }


  validates :slot_type,
            inclusion: { in: [AVAILABILITY, SEEKING] },
            presence: true

  validates :start_date, presence: true
  validates :end_date, presence: true

  def date_fully_included?(comparing_shift)
    comparing_shift.start_date <= start_date &&
      comparing_shift.end_date >= end_date
  end

  def date_partially_included?(comparing_shift)
    start_date <= comparing_shift.end_date &&
      end_date >= comparing_shift.start_date
  end
end
