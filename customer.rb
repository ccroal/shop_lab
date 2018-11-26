class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def buy_item(item)
    if can_afford?(item) == true
    @wallet -= item.price
    end
  end

  def refund_item(item)
    @wallet += item.price
  end

  def can_afford?(item)
    if @wallet >= item.price
      return true
    else
      return false
    end
  end

end
