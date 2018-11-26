class Till

  attr_reader :balance, :sales, :refunds, :income

  def initialize(balance)
    @balance = balance
    @sales = 0
    @refunds = 0
    @income = 0
  end

  def till_change_balance_sale(item)
    @balance += item.price
  end

  def till_change_balance_refund(item)
    @balance -= item.price
  end

  def increase_sales(item)
    @sales += item.price
  end

  def increase_refunds(item)
    @refunds += item.price
  end

  def calculate_income()
    @income = @sales -= @refunds
  end

  def till_sell_item(item)
    till_change_balance_sale(item)
    increase_sales(item)
    calculate_income()
  end

  def till_refund_item(item)
    till_change_balance_refund(item)
    increase_refunds(item)
    calculate_income()
  end
end
