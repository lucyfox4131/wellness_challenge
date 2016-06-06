require 'rails_helper'

RSpec.feature "User sees scheduled goals" do
  scenario "user can view all goals that have been scheduled" do
    user = login_user
    goal1 = user.goals.create(description: "Eat breakfast")
    goal2 = user.goals.create(description: "Goal2")
    scheduled_goal = user.scheduled_goals.create(goal_id: goal1.id, start_time: "2014-01-01")

    visit user_scheduled_goals_path(user)

    expect(page).to have_content ("Eat breakfast on 2014-01-01")
    expect(page).to_not have_content ("Goal2")
  end
end
