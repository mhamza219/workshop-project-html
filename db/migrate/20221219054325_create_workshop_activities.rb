class CreateWorkshopActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :workshop_activities do |t|
      t.string :name
      t.references :workshop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
