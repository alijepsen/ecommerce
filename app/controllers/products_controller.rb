class ProductsController < ApplicationController
  before_action :set_category

  before_action :set_product, except: [:index, :new, :create]


  def index
    @products = @category.products
  end

  def show
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
  end

  def update
    if @product.update(product_params)
      redirect_to category_product_path(@category, @product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to category_products_path(@category)
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
