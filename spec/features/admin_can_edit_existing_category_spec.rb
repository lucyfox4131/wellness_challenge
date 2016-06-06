require 'rails_helper'

RSpec.feature "Edit a Category", type: :feature do
    scenario "user can edit a category" do
      admin = User.create(first_name: "Lucy", last_name: "Fox", username: "lucyfox", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      c = Category.create(title: "Nutrition")

      visit admin_category_path(c)

      click_on "Edit Category"

      fill_in "Title", with: "Health"
      click_on "Update Category"

      expect(page).to have_content("Health")
      expect(page).to have_content("Category edited successfullly")
    end
end
