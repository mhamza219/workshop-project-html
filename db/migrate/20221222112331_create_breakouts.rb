class CreateBreakouts < ActiveRecord::Migration[6.1]
  def change
    create_table :breakouts do |t|
      t.string :name

      t.timestamps
    end
  end
end
