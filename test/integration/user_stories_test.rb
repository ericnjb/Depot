require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

  # Replace this with your real tests.
  test "buying a product" do
    # Prep the data
    LineItem.delete_all
    ruby_book = products(:ruby)
    
    # A user goes to the store index page.
    get "/"
    assert_response :success
    assert_template "index"
    
    # They select a product, adding it to their cart.
    xml_http_request :post, '/line_items', :product_id => ruby_book.id
    assert_response :success
    
    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal ruby_book, cart.line_items[0].product
    
    # Then they check out...
    get "/orders/new"
    assert_response :success
    assert_template "new"
    
    # They fill out details on the checkout form and post the data.
    post_via_redirect "/orders",
      :order => { :name => "Dave Thomas",
                  :address => "123 The Street",
                  :email => "dave@example.com",
                  :pay_type => "Check" }
    assert_response :success
    assert_template "index"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size
    
    # Verify that we've created the appropriate order for this user in the DB.
    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]
    
    assert_equal "Dave Thomas", order.name
    assert_equal "123 The Street", order.address
    assert_equal "dave@example.com", order.email
    assert_equal "Check", order.pay_type
    
    assert_equal 1, order.line_items.size
    line_item = order.line_items[0]
    assert_equal ruby_book, line_item.product
    
    # Verify the e-mail itself is addressed correctly, with the expected subject line
    mail = ActionMailer::Base.deliveries.last
    assert_equal ["dave@example.com"], mail.to
    assert_equal "Bob Tester <tester@example.com>", mail[:from].value
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
  end
end
