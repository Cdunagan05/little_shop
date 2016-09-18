class Cart
  attr_reader :contents

  def initialize(initial_content = {})
    @contents = initial_content || {}
  end

  def add_item(item_id)
    @contents[item_id.to_s] ||= 0
    @contents[item_id.to_s] += 1
  end

  def remove_item(item_id)
    @contents.delete item_id.to_s
  end

  def change_quantity(item_id, quantity)
    @contents[item_id.to_s] = if quantity.to_i <= 0
                                0
                              else
                                quantity.to_i
                              end
  end

  def item_quantities
    result = {}
    @contents.each do |item_id, quantity|
      result[Item.find(item_id)] = quantity
    end
    result
  end

  def empty_message
    'False Start!  You have nothing in your cart!'
  end

  def total
    item_quantities.reduce(0) do |total, content|
      total += content.first.price * content.last
    end
  end
end
