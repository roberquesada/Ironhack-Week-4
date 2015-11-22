class BidsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @bid = @product.bids.new(bid_params)

    if @bid.save
      redirect_to action: 'show', controller: 'products', id: @product
    else
      render 'products/show'
    end

  end

  private

  def bid_params
    Bid.get_user_id_from_email(params)
    params.require(:bid).permit(:amount, :user_id)
  end

end
