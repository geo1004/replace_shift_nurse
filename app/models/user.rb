class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shifts
  has_many :availabilities, -> { availables }, class_name: 'Shift'
  has_many :seekings,  -> { seekings }, class_name: 'Shift'

  # Return the user if a targeted shift is completly covered
  def full_matches
    user_matching(:full)
  end

  # Return the user if a targeted shift is partially covered
  def partial_matches
    user_matching(:partial)
  end

  private

  def user_matching(type)
    case type
    when :full
      date_comparator = :date_fully_included?
    when :partial
      date_comparator = :date_partially_included?
    end
    users_matching ||= []

    seekings.each do |target_shift|
      Shift.availables.exclude_user(self).each do |comparing_shift|
        if target_shift.send(date_comparator, comparing_shift)
          users_matching << comparing_shift.user
        end
      end
    end

    users_matching
  end
end
