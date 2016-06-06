class CreateScheduledGoals < ActiveRecord::Migration
  def change
    create_table :scheduled_goals do |t|
      t.references :goal, index: true, foreign_key: true
      t.datetime :start_time
      t.boolean :achieved, default: false

      t.timestamps null: false
    end
  end
end
