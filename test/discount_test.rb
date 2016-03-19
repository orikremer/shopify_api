require 'test_helper'

class DiscountTest < Test::Unit::TestCase

  test "create should create discount" do
    fake 'discounts', :method => :post, :status => 201, :body => load_fixture('discount')
    discount = ShopifyAPI::Discount.create(code: 'TENOFF', value: 10, discount_type: 'percentage')
    assert_equal 680866, discount.id
  end

  test "get should get an order" do
    fake 'orders/680866', :method => :get, :status => 200, :body => load_fixture('discount')
    discount = ShopifyAPI::Discount.find(680866)
    assert_equal 680866, discount.id
  end

  test "get all should get all orders" do
    fake 'discounts', :method => :get, :status => 200, :body => load_fixture('discounts')
    discounts = ShopifyAPI::Discount.all
    assert_equal 680866, discounts.first.id
  end
end

