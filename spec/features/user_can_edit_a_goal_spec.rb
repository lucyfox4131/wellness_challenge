require 'rails_helper'

RSpec.feature "User edits Goal", type: :feature do
  scenario "user can edit an existing goal" do
    user = login_user
    category = Category.create(title: "Nutrition")
    goal1 = user.goals.create(description: "Goal one", category_id: category.id)

    visit user_goal_path(user, goal1)

    click_link "Edit"

    fill_in "Description", with: "Awesome Goal"
    click_button "Update Goal"

    expect(page).to have_content("Goal updated successfully")
    
    within '#goal-show' do
      expect(page).to_not have_content("Goal one")
      expect(page).to have_content("Awesome Goal")
    end
  end
end
