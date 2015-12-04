class BidsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @bid = @product.bids.new(bid_params)

    if params[:bid][:amount].to_f > @product.min_bid  && @bid.save
      @product.update(min_bid: params[:bid][:amount].to_f)
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
