require 'rails_helper'

RSpec.describe ScheduledGoal, type: :model do
  it { should belong_to(:goal) }
  it { should belong_to(:user) }
end
