class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shifts
  has_many :availabilities, -> { availabilities }, class_name: 'Shift'
  has_many :seekings,  -> { seekings }, class_name: 'Shift'

  # Return the user if a targeted shift is completly covered
  # type can be availabilities or seekings
  def full_matches(args)
    fail 'This method need a type' if args[:type].blank?
    user_matching(:full, args[:type])
  end

  # Return the user if a targeted shift is partially covered
  # type can be availabilities or seekings
  def partial_matches(args)
    fail 'This method need a type' if args[:type].blank?
    user_matching(:partial, args[:type])
  end

  private

  # 'type' is :seekings if self is a user looking for vacation and so someone
  # to replace him
  # 'type' is :availabilities if self is a user looking for job and so someone
  # to replace
  def user_matching(search_inclusion, type)
    users_matching ||= []

    send(type).each do |target_shift|
      Shift.send(contrary(type)).exclude_user(self).each do |comparing_shift|
        if target_shift.send(date_comparator(search_inclusion), comparing_shift)
          users_matching << comparing_shift.user
        end
      end
    end

    users_matching
  end

  def date_comparator(search_inclusion)
    case search_inclusion
    when :full
      :date_fully_included?
    when :partial
      :date_partially_included?
    end
  end

  def contrary(type)
    type.to_s == 'seekings' ? 'availabilities' : 'seekings'
  end
end
