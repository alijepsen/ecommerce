class CommentsController < ApplicationController
  before_action :set_product
  before_action :set_category
  before_action :set_comment, except: [:index, :new, :create]

  def index
  	@comments = @product.comments
    @average = @comments.average(:rating)
  end

  def show
  end

  def new
  	@comment = @product.comments.new
  end

  def create
  	@comment = @product.comments.new(comment_params)
  	if @comment.save
  		redirect_to product_comment_path(@product, @comment)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @comment.update(comment_params)
  		redirect_to product_comment_path(@product, @comment)
  	else
  		render :edit
  	end
  end

  def destroy
  	@comment.destroy
  	redirect_to category_product_path(@category, @product)
  end

  private

  def comment_params
  	params.require(:comment).permit(:review, :rating)
  end

  def set_product
  	@product = Product.find(params[:product_id])
  end

  def set_category
    @category = @product.category_id
  end

  def set_comment
  	@comment = @product.comments.find(params[:id])
  end
end
