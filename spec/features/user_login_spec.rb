require 'rails_helper'

RSpec.feature "User Login", type: :feature do
  scenario "user can login successfully" do
    user = User.create(first_name: "Lucy", last_name: "Fox", username: "lucyfox", password: "password")

    visit login_path

    fill_in "Username", with: "lucyfox"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("Welcome, Lucy")
  end
end
