require 'rails_helper'

RSpec.feature "Deleting a Category", type: :feature do
    scenario "user can delete an existing category" do
      admin = User.create(first_name: "Lucy", last_name: "Fox", username: "lucyfox", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      c = Category.create(title: "Health")
      c1 = Category.create(title: "Nutrition")

      visit admin_category_path(c)

      click_on "Delete"

      expect(page).to have_content("Nutrition")
      expect(page).to have_content("Category deleted successfully")
    end
end
