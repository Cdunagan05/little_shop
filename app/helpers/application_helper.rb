module ApplicationHelper
  def cart_button(item)
    if item.active?
      button_to('Add to Cart',
                cart_items_path(item_id: item.id),
                class: 'btn btn-primary')
    else
      button_to 'Item Retired', '#', class: 'btn-primary', disabled: 'disabled'
    end
  end
end
