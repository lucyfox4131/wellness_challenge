require 'rails_helper'

RSpec.feature "User not logged in", type: :feature do
  scenario "user is not logged in and tries to see their goals" do
    user = User.create(first_name: "Bob", last_name: "Vance", username: "bobvance", password: "password" )

    visit user_path(user)

    expect(page).to have_content("Login to see your goals and progress")
    expect(page).to_not have_content("Welcome, Bob")
  end
end
