require 'rails_helper'

RSpec.feature "User deletes a goal", type: :feature do
  scenario "user can delete a goal" do
    user = login_user
    category = Category.create(title: "Nutrition")
    goal1 = user.goals.create(description: "Goal one", category_id: category.id)
    goal2 = user.goals.create(description: "Goal two", category_id: category.id)

    visit user_goal_path(user, goal1)

    click_link "Delete"

    expect(page).to have_content("Goal deleted successfully")

    within '#category-goals' do
      expect(page).to_not have_link(goal1.description)
      expect(page).to have_link(goal2.description)
    end
  end
end
