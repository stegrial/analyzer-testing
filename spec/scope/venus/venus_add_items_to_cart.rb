require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/venus/*.rb"


product_page = ProductDetails.new
navigation_page = VenusNavigation.new
order_page = OrderDetails.new
modal = Modal.new

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

        step "User selects Size", 8 do |size|
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

        step "User checks checkout image", "BASIC HIGH NECK DRESS" do |name|
          order_page.should_see_order_image image
        end

        step "User checks checkout item name", "BASIC HIGH NECK DRESS" do |name|
          order_page.should_see_order_item name
        end

        step "User clicks Checkout confirm button" do
          order_page.clicks_checkout_button
        end

        step "User checks Order Fields" do

        end


      end
    end
  end
end