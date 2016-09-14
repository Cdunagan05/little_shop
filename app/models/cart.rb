class Cart
  attr_reader :contents

  def initialize(initial_content)
    @contents = initial_content || {}
  end

  def add_item(item_id)
    @contents[item_id.to_s] ||= 0
    @contents[item_id.to_s] += 1
  end

  def item_quantities
    result = {}
    @contents.each do |item_id, quantity|
      result[Item.find(item_id)] = quantity
    end
    result
  end

  def total
    item_quantities.reduce(:+) do |_total, content|
      content.first.price * content.last
    end
  end
end
