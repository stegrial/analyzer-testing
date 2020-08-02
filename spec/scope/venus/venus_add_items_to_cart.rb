require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"


product_page = VenusProduct.new
navigation_page = VenusNavigation.new
order_details = OrderDetails.new
login_page = VenusLogin.new
shipping_page = ShippingPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Venus - Add and check items in cart' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page",
             settings('venus')['view_product_page'] + '?BRANCH=7~72~3030~&ProductDisplayID=69113' do |url|
          page.visit url
        end

        step "User selects Size", 'S' do |size|
          scroll_to_element 1000
          product_page.choose_list_size size
        end

        step "User opens dropdown to select the quantity of product" do
          product_page.open_qty_dropdown
        end

        step "User selects the quantity of product", 2 do |qty|
          product_page.select_quantity qty
        end

        step "User clicks 'Add to Bag' button" do
          product_page.click_add_to_bag_button
        end

        step "User clicks Cart button" do
          navigation_page.click_cart_button
        end

        step "User checks checkout item name", "STRIPED SWEATER DRESS" do |name|
          order_details.should_see_order_item name
        end

        step "User clicks Checkout confirm button" do
          order_details.clicks_checkout_button
        end

        step "User logs in" do
          login_page.fill_email_field email
          login_page.fill_pass_field pass
          login_page.click_sign_in_button
        end

        step "User checks Order Fields" do
          shipping_page.should_see_first_name_field
          shipping_page.should_see_last_name_field
          shipping_page.should_see_country_field
          shipping_page.should_see_address_line_field
          shipping_page.should_see_address_line_optional_field
          shipping_page.should_see_city_field
          shipping_page.should_see_state_field
          shipping_page.should_see_postal_code_field
          shipping_page.should_see_phone_field
          shipping_page.should_see_shipping_option_selector
          shipping_page.should_see_billing_button
        end

      end
    end
  end
end