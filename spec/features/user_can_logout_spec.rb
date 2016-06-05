require 'rails_helper'

RSpec.feature "User Logout", type: :feature do
  scenario "user successfully logs out" do
    login_user

    expect(page).to have_content("Welcome, Lucy")

    click_link "Logout"

    expect(page).to_not have_content("Welcome, Lucy")
  end
end
