require 'rails_helper'

RSpec.feature "User creates an account", type: :feature do
  scenario "a user can be created" do
    visit new_user_path

    fill_in "First name", with: "Lucy"
    fill_in "Last name", with: "Fox"
    fill_in "Username", with: "lucyfox"
    fill_in "Password", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Welcome, Lucy")
  end
end
