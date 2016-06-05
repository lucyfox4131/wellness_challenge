require 'rails_helper'

RSpec.feature "User sees all goals", type: :feature do
  scenario "user can see existing goals" do
    user = login_user
    category = Category.create(title: "Nutrition")
    goal1 = user.goals.create(description: "Goal one", category_id: category.id)
    goal2 = user.goals.create(description: "Goal two", category_id: category.id)

    visit user_path(user)

    click_link "All Goals"

    within '#category-goals' do
      expect(page).to have_link(goal1.description)
      expect(page).to have_link(goal2.description)
    end
  end
end
