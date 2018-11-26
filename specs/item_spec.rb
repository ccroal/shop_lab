require('minitest/autorun')
require('minitest/rg')
require_relative('../item.rb')


class ItemTest < MiniTest::Test

  def setup()
    @item = Item.new(10)
  end

  def test_item_has_price()
    assert_equal(10, @item.price)
  end
end
