require 'rails_helper'

RSpec.feature "User edits scheduled goal" do
  scenario "user can successfully edit a goal" do
    user = login_user
    goal1 = user.goals.create(description: "Eat breakfast")
    scheduled_goal = user.scheduled_goals.create(goal_id: goal1.id, start_time: "2014-01-01")

    visit edit_user_scheduled_goal_path(user, scheduled_goal)
    fill_in "Start time", with: "2016-05-04"
    click_on "Update Scheduled Goal"

    expect(page).to have_content("2016")
  end
end
