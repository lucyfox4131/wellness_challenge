require 'rails_helper'

RSpec.feature "Admin sees categories", type: :feature do
  context "only admin can see categories" do
    scenario "logged in admin views category index" do
      admin = User.create(first_name: "Lucy", last_name: "Fox", username: "lucyfox", password: "password", role: 1)
      category1 = Category.create(title: "Category one")
      category2 = Category.create(title: "Category two")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      within '#page_title' do
        expect(page).to have_content("All Categories")
      end

      within '#category-titles' do
        expect(page).to have_link("Category one")
        expect(page).to have_link("Category two")
      end
    end

    scenario "regular user cannot see all categories" do
      user = User.create(first_name: "Regular", last_name: "User", username: "regularuser", password: "password", role: 0)

      category1 = Category.create(title: "Category one")
      category2 = Category.create(title: "Category two")

      visit admin_categories_path

      expect(page).to_not have_content("All Categories")
      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end
  end

end
