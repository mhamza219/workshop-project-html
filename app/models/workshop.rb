class Workshop < ApplicationRecord
  belongs_to :project
  has_many :workshop_activities
end