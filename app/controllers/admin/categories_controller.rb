class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "New category created successfullly."
      redirect_to admin_category_path(@category)
    else
      flash.now[:error] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category edited successfullly"
      redirect_to admin_category_path(@category)
    else
      flash[:error] = @category.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category deleted successfully"


    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
