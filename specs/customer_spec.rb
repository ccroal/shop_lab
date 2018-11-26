  require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../item.rb')


class CustomerTest < MiniTest::Test

  def setup()
    @item = Item.new(10)
    @customer = Customer.new("Steven", 100)
  end

  def test_customer_has_name()
    assert_equal("Steven", @customer.name)
  end

  def test_customer_has_wallet
    assert_equal(100, @customer.wallet)
  end

  def test_customer_can_buy_item()
    @customer.buy_item(@item)
    assert_equal(90, @customer.wallet)
  end

  def test_customer_can_be_refunded()
    @customer.refund_item(@item)
    assert_equal(110, @customer.wallet)
  end
end
