class CartItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)

    session[:cart] = @cart.contents

    redirect_to :back
  end
end
