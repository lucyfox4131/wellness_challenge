class GoalsController < ApplicationController

  def index
    @user = current_user
    @goals = @user.goals.order(:category_id)
  end

  def new
    @user = current_user
    @goal = Goal.new
  end

  def create
    @user = current_user
    @goal = @user.goals.new(goal_params)
    if @goal.save
      flash[:success] = "Goal created successfully"

      redirect_to user_goal_path(@user, @goal)
    else
    end

    def edit
      @user = current_user
      @goal = Goal.find(params[:id])
    end

    def update
      @user = current_user
      @goal = Goal.find(params[:id])
      if @goal.update(goal_params)
        flash[:success] = "Goal updated successfully"

        redirect_to user_goal_path(@user, @goal)
      else
      end
    end

    def destroy
      @user = current_user
      @goal = Goal.find(params[:id])
      @goal.destroy

      flash[:success] = "Goal deleted successfully"
      redirect_to user_goals_path(@user)
    end

  end

  def show
    @user = current_user
    @goal = Goal.find(params[:id])
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :category_id)
  end

end
