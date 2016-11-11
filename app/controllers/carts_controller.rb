class CartsController < ApplicationController
  before_action :set_cart, except: [:index, :new, :create]

  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to cart_path(@cart)
    else
      render :new
    end
  end

  def update
    if @cart.update(cart_params)
      redirect_to cart_path(@cart)
    else
      render :edit
    end
  end

  def destroy
    @cart.destroy
    redirect_to carts_path
  end

  private

    def cart_params
      params.require(:cart).permit(:item)
    end

    def set_cart
      @cart = Cart.find(params[:id])
    end
  end

end
