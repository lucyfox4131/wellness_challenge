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

  def edit
    @user = User.find(params[:user_id])
    @goals = @user.goals
    @scheduled_goal = ScheduledGoal.find(params[:id])
  end

  def update
    @scheduled_goal = ScheduledGoal.find(params[:id])
    if @scheduled_goal.update(schedule_goal_params)
      flash[:success] = "Scheduled goal updated sucessfully"
      redirect_to user_scheduled_goals_path(User.find(params[:user_id]))
    else
    end
  end

  def show
    @user = User.find(params[:user_id])
    @scheduled_goal = ScheduledGoal.find(params[:id])
  end

  def destroy
    @scheduled_goal = ScheduledGoal.find(params[:id])
    @scheduled_goal.destroy
    @user = User.find(params[:user_id])
    flash[:success] = "Successfully deleted"

    redirect_to @user
  end

  private

  def schedule_goal_params
    params.require(:scheduled_goal).permit(:start_time, :goal)
  end
end
