class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def buy_item(item)
    @wallet -= item.price
  end

  def refund_item(item)
    @wallet += item.price
  end
end
