require 'rails_helper'

RSpec.feature "Edit a Category", type: :feature do
    scenario "user can edit a category" do
      c = Category.create(title: "Nutrition")

      visit category_path(c)

      click_on "Edit Category"

      fill_in "Title", with: "Health"
      click_on "Update Category"

      expect(page).to have_content("Health")
      expect(page).to have_content("Category edited successfullly")
    end
end
