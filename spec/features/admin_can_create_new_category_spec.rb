require 'rails_helper'

RSpec.feature "Create Categories", type: :feature do
  context "only admin can create a new category" do
    scenario "logged in admin makes new category index" do
      admin = User.create(first_name: "Lucy", last_name: "Fox", username: "lucyfox", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      click_on "Create New Category"

      fill_in "Title", with: "Personal Wellness"
      click_on "Create Category"

      expect(page).to have_content("New category created successfullly.")
      expect(page).to have_content("Personal Wellness")
    end

    scenario "regular user cannot create category" do
      user = User.create(first_name: "Regular", last_name: "User", username: "regularuser", password: "password", role: 0)

      visit new_admin_category_path
    
      expect(page).to_not have_content("New Category")
      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end
  end

end
