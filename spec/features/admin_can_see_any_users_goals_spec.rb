require 'rails_helper'

RSpec.feature "Admin sees users" do
  scenario "logged in admin can see all users" do
    admin = login_admin
    user = User.create(first_name: "Bob", last_name: "Vance", username: "bobvance", password: "password")
    goal1 = user.goals.create(description: "New Goal")

    visit admin_user_path(user)

    within '#user-details' do
      expect(page).to have_content("Bob Vance")
      expect(page).to have_content("Username: bobvance")
    end

    within '#user-goals' do
      expect(page).to have_content("Bob's Goals:")
      expect(page).to have_content(goal1.description)
    end
  end
end
