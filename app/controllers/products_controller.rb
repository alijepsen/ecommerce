class ProductsController < ApplicationController
  before_action :set_category, except: [:all_products]

  before_action :set_product, except: [:index, :new, :create, :all_products]

  skip_before_action :authenticate_user!, only: [:index, :show, :all_products]


  def index
    @products = @category.products
  end

  def show
    @comments = @product.comments
    @average = @comments.average(:rating)
  end

  def new
    @product = @category.products.new
  end

  def create
    @product = @category.products.new(product_params)
    if @product.save
      redirect_to category_product_path(@category, @product)
    else
      render :new
    end
  end

  def edit
    if current_user.id != @product.category.user_id
      flash[:error] = 'That does not belong to you!'
      redirect_to category_products_path(@category)
    end
  end

  def update
    if @product.update(product_params)
      redirect_to category_product_path(@category, @product)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id != @product.user_id
      flash[:error] = 'That does not belong to you!'
      redirect_to category_products_path(@category)
    else
      @product.destroy
      redirect_to category_products_path(@category)
    end
  end

  def all_products
   @products = Product.all
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :inventory, :image, :avatar)
    end

    def set_product
      @product = @category.products.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end
end
