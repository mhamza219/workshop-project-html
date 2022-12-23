class WorkshopActivity < ApplicationRecord
  belongs_to :workshop
  belongs_to :activity, polymorphic: true

  # ACTIVITY= ['Poll', 'Content', 'Breakout', "'Discussion"]
end
