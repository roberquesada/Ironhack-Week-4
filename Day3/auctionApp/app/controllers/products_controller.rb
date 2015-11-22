class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @user = User.find(params[:user_id])
    @product = @user.products.new
  end

  def create
    @user = User.find(params[:user_id])
    @product = @user.products.new(product_params)

    if @product.save
      redirect_to('/products')
    else
      render 'new'
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :deadline)
  end

end
