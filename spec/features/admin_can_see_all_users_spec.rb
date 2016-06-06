require 'rails_helper'

RSpec.feature "Admin sees users" do
  scenario "logged in admin can see all users" do
    admin = login_admin
    user1 = User.create(first_name: "Bob", last_name: "Vance", username: "bobvance", password: "password")
    user2 = User.create(first_name: "Michael", last_name: "Scott", username: "mscott", password: "password")

    visit user_path(admin)

    click_link "All Users"

    expect(page).to have_link("Bob Vance")
    expect(page).to have_link("Michael Scott")
  end
end
