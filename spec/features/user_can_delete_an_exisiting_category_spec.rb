require 'rails_helper'

RSpec.feature "Deleting a Category", type: :feature do
    scenario "user can delete an existing category" do
      c = Category.create(title: "Health")
      c1 = Category.create(title: "Nutrition")

      visit category_path(c)

      click_on "Delete Category"
      
      expect(page).to have_content("Health")
      expect(page).to have_content("New category created successfullly.")
    end
end
