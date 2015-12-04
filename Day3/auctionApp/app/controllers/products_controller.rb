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
    @product = Product.find_by(id: params[:product_id]) || Product.find_by(id: params[:id])
    @bids = @product.get_all_bids
    @bid_winner = @product.highest_bid
    @new_bid = @product.bids.new
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :deadline, :min_bid)
  end

end
