class AddUserReferenceToScheduledGoals < ActiveRecord::Migration
  def change
    add_reference :scheduled_goals, :user, index: true, foreign_key: true
  end
end
