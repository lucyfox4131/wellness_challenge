require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should have_many(:scheduled_goals) }
end
