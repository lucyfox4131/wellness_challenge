class ScheduledGoalsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @goals = @user.goals
    @scheduled_goal = ScheduledGoal.new
  end

  def create
    @scheduled_goal = ScheduledGoal.new(schedule_goal_params)
    if @scheduled_goal.save
      @user = User.find(params[:user_id])
      flash[:success] = "Goal Scheduled Successfully"
      redirect_to @user
    else
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @scheduled_goals = @user.scheduled_goals
  end


  private

  def schedule_goal_params
    params.require(:scheduled_goal).permit(:start_time, :goal)
  end
end
