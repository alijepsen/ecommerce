class CategoriesController < ApplicationController
before_action :set_category, only: [:edit, :update, :show, :destroy]
skip_before_action :authenticate_user!, only: [:index]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to category_products_path(@category)
    else
      render :new
    end
  end

  def edit
    if current_user.id != @category.user_id
      flash[:error] = 'That shop does not belong to you!'
      redirect_to categories_path
    end
  end

  def update
    if @category.update(category_params)
      redirect_to category_products_path(@category)
    else
      render :edit
    end
end

  def destroy
    if current_user.id != @category.user_id
      flash[:error] = 'That shop does not belong to you!'
      redirect_to categories_path
    else
      @category.destroy
      redirect_to categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:style)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
