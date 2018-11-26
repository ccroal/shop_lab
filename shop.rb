class Shop

  attr_reader :name, :till

  def initialize(name, till)
    @name = name
    @till = till
  end

  def sell_item(customer, item)
    customer.buy_item(item)
    @till.till_sell_item(item)
  end
end
