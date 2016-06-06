class Goal < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :scheduled_goals

  def start_time
    self.scheduled_goals.each do |goal|
      goal.start_time
    end
  end
end
