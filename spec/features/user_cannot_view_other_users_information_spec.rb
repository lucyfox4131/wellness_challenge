require 'rails_helper'

RSpec.feature "Users only see their own information", type: :feature do
  scenario "a user cannot see another users information" do
    user1 = login_user
    user2 = User.create(first_name: "user1", last_name: "last", username: "woo", password: "password")

    visit user_path(user2)

    expect(page).to_not have_content("Welcome, user1")
  end

  scenario "a user can only see their own goals" do
    user1 = login_user
    user2 = User.create(first_name: "user1", last_name: "last", username: "woo", password: "password")
    goal1 = user1.goals.create(description: "wooop there it is")
    goal2 = user2.goals.create(description: "awesome sauce")

    visit user_goals_path(user2)

    expect(page).to have_content("wooop there it is")
    expect(page).to_not have_content("awesome sauce")
  end
end
