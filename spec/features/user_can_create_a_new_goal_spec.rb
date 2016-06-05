require 'rails_helper'

RSpec.feature "User creates a Goal", type: :feature do
  scenario "new_goal_is_created" do
    login_user
    category = Category.create(title: "Nutrition")

    click_link "Make a New Goal"

    fill_in "Description", with: "Eat a healthy breakfast"
    #drop down to chose a category
    find('#select_category').click

    click_button "Create Goal"

    expect(page).to have_content("Goal created successfully")

    within '#goal-show' do
      expect(page).to have_content("Eat a healthy breakfast")
    end
  end
end
