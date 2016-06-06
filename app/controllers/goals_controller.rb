class GoalsController < ApplicationController

 # a way to dry up some of your code is to make a before action for your goals controller.
 # so if we say that in order for you to create a goal you need to be a registered user (which you've done)
 # you can make a method that will essentially link everything to the current user
 #so now in your forms and and anyting in the view you can just call in the current user. 

# ------------------------
   #before_action :require_authenticated_user

    #def require_authenticated_user
    #  redirect_to login_path flash[:login] ="Must Login" unless current_user
    #end

    #something along these lines!
# -------------------------
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
        #so like here you can just redirect to curent user
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
