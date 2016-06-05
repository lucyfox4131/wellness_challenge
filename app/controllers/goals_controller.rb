class GoalsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @goal = Goal.new
  end

  def create
    @user = User.find(params[:user_id])
    @goal = @user.goals.new(goal_params)
    if @goal.save
      flash[:success] = "Goal created successfully"

      redirect_to user_goal_path(@user, @goal)
    else

    end
  end

  def show
    @user = User.find(params[:user_id])
    @goal = Goal.find(params[:id])
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :category_id)
  end

end
