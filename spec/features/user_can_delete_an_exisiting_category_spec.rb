require 'rails_helper'

RSpec.feature "Deleting a Category", type: :feature do
    scenario "user can delete an existing category" do
      c = Category.create(title: "Health")
      c1 = Category.create(title: "Nutrition")

      visit category_path(c)

      click_on "Delete"

      expect(page).to have_content("Nutrition")
      expect(page).to have_content("Category deleted successfully")
    end
end
