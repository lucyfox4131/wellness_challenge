require 'rails_helper'

RSpec.feature "User edits scheduled goal" do
  scenario "user can successfully edit a goal" do
    user = login_user
    goal1 = user.goals.create(description: "Eat breakfast")
    scheduled_goal = user.scheduled_goals.create(goal_id: goal1.id, start_time: "2014-01-01")

    visit user_scheduled_goal_path(user, scheduled_goal)
    click_on "Delete"

    expect(page).to have_content("Successfully deleted")
    expect(page).to have_content("Welcome, #{user.first_name}")
  end
end
