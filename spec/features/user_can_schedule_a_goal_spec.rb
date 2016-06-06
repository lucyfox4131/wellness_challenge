require 'rails_helper'

RSpec.feature "User schedules goal" do
  scenario "user can schedule an goal" do
    user = login_user
    goal1 = user.goals.create(description: "Eat breakfast")

    visit user_goals_path(user)

    click_on "Schedule Goal"

    find('#goals').click
    page.find('#start_time').set("2014-01-01")

    click_button "Schedule Goal"
    expect(page).to have_content "Goal Scheduled Successfully"
  end
end
