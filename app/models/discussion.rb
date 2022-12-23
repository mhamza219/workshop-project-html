class Discussion < ApplicationRecord
	has_many :workshop_activities, as: :activity
end
