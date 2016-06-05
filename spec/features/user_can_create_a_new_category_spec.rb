require 'rails_helper'

RSpec.feature "Category Creation", type: :feature do
  context "using valid attributes" do
    scenario "user can create a category" do
      visit new_admin_category_path

      fill_in "Title", with: "Health"
      click_on "Create Category"

      expect(page).to have_content("Health")
      expect(page).to have_content("New category created successfullly.")
    end
  end

end
