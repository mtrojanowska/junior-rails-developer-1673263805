class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category was successfully created'
      redirect_to categories_path
    else
      flash[:alert] = @category.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = 'Category was successfully updated'
      redirect_to categories_path
    else
      flash[:alert] = @category.errors.full_messages.join(', ')
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
