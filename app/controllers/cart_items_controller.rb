class CartItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)

    session[:cart] = @cart.contents
    flash[:success] = "Added #{item.title} to cart!"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    item = Item.find(params[:id])
    @cart.remove_item(item.id)

    session[:cart] = @cart.contents
    flash[:success] = "Successfully removed <a href='/items/#{item.id}'>#{item.title}</a> from your cart.".html_safe
    redirect_back(fallback_location: cart_path)
  end

  def update
    @cart.change_quantity(params[:id], params[:cart_items][:quantity])
    session[:cart] = @cart.contents
    redirect_back(fallback_location: cart_path)
  end

  def undo_link(item)
    view_context.link_to(item.title, item_path(item))
  end
end
