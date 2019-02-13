class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
	belongs_to :admin, class_name: "User"

	validates :start_date, presence: true 
	validate :start_date_cannot_be_in_the_past

	validates :duration, presence: true, length: { in: 1..140 }
	validate :check_multiple_5

	validates :title, presence: true, length: { in: 5..140 }

	validates :description, presence: true, length: { in: 20..1000 }

	validates :price, presence: true, numericality: { less_than_or_equal_to: 1000, more_than_or_equal_to: 1, only_integer: true }

	validates :location, presence: true


  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end 

  def check_multiple_5
    if duration % 5 != 0
      errors.add(:duration, "duration must be a multiple of 5") 
    end
  end


  def end_date
  	e = start_date + (duration*60)
  	return e
  end

  # check if user is already attendant to display or not stripe button in event_path
  def already_attendant?(current_user)
  	already_attendant = true

  	self.attendances.each do |attendance|
  		if attendance.user == current_user
  			already_attendant = false
  		end
  	end
  	return already_attendant
  end

  
end
