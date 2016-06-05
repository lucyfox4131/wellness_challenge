require 'rails_helper'

RSpec.feature "Admin views category", type: :feature do
    scenario "admin views existing category" do
      admin = User.create(first_name: "Lucy", last_name: "Fox", username: "lucyfox", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      category = Category.create(title: "Nutrition")

      visit admin_category_path(category)

      expect(page).to have_content("Nutrition")
    end

    scenario "regular user cannot view category" do
      user = User.create(first_name: "Regular", last_name: "User", username: "regularuser", password: "password", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      category = Category.create(title: "Nutrition")

      visit admin_category_path(category)

      expect(page).to_not have_content("Nutrition")
      expect(page).to have_content("The page you were looking for doesn't exist (404)")
      
    end
end
