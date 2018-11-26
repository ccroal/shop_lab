require('minitest/autorun')
require('minitest/rg')
require_relative('../till.rb')
require_relative('../item.rb')
require_relative('../customer.rb')


class Tilltest < MiniTest::Test

  def setup()
    @item = Item.new(15)

    @customer = Customer.new("Sarah", 50)

    @till = Till.new(100)
  end

  def test_till_has_balance()
    assert_equal(100, @till.balance)
  end

  def test_till_has_sales()
    assert_equal(0, @till.sales)
  end

  def test_till_has_refunds()
    assert_equal(0, @till.refunds)
  end

  def test_till_has_income()
    assert_equal(0, @till.income)
  end

  def test_till_change_balance_sale()
    @till.till_change_balance_sale(@item)
    assert_equal(115, @till.balance)
  end

  def test_till_change_balance_refund()
    @till.till_change_balance_refund(@item)
    assert_equal(85, @till.balance)
  end

  def test_increase_sales()
    @till.increase_sales(@item)
    assert_equal(15, @till.sales)
  end

  def test_increase_refunds()
    @till.increase_refunds(@item)
    assert_equal(15, @till.refunds)
  end

  def test_calculate_income()
    @till.increase_sales(@item)
    @till.increase_sales(@item)
    @till.increase_refunds(@item)

    @till.calculate_income()
    assert_equal(15, @till.income)
  end

  def test_till_sell_item()
    @till.till_sell_item(@item)
    assert_equal(115, @till.balance)
    assert_equal(15, @till.sales)
  end
end
