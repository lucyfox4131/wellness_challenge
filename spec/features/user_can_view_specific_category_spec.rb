require 'rails_helper'

RSpec.feature "Viewing a Category", type: :feature do
    scenario "user can view an existing category" do
      category = Category.create(title: "Nutrition")

      visit category_path(category)

      expect(page).to have_content("Nutrition")
    end
end
