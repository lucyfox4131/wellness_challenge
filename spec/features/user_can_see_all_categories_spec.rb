require 'rails_helper'

RSpec.feature "Viewing all categories", type: :feature do
  scenario "user can see all categories" do
    category1 = Category.create(title: "Health")
    category2 = Category.create(title: "Nutrition")

    visit categories_path

    within "#category-titles" do 
      expect(page).to have_content("Health")
      expect(page).to have_content("Nutrition")
    end
  end
end
