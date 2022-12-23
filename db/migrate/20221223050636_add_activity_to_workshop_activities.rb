class AddActivityToWorkshopActivities < ActiveRecord::Migration[6.1]

	add_reference :workshop_activities, :activity, polymorphic: true, index: true
  def change
  end
end
