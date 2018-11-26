require('minitest/autorun')
require('minitest/rg')
require_relative('../shop.rb')
require_relative('../till.rb')
require_relative('../item.rb')
require_relative('../customer.rb')


class ShopTest < MiniTest::Test

  def setup()
    @item = Item.new(20)
    @customer = Customer.new("Susan", 75)
    till = Till.new(100)

    @shop = Shop.new("Local Shop", till)
  end

  def test_shop_has_name()
    assert_equal("Local Shop", @shop.name)
  end

  def test_sell_item()
    @shop.sell_item(@customer, @item)
    assert_equal(55, @customer.wallet)
    assert_equal(120, @shop.till.balance)
    assert_equal(20, @shop.till.sales)
    assert_equal(20, @shop.till.income)
  end

  def test_refund_item()
    @shop.refund_item(@customer, @item)
    assert_equal(95, @customer.wallet)
    assert_equal(80, @shop.till.balance)
    assert_equal(20, @shop.till.refunds)
    assert_equal(-20, @shop.till.income)
  end
end
