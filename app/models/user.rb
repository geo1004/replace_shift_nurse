class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shifts
  has_many :availabilities, -> { availables }, class_name: 'Shift'
  has_many :seekings,  -> { seekings }, class_name: 'Shift'
end
