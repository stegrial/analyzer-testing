require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

product_details = ProductDetails.new
order_details = OrderDetails.new
modal = Modal.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {:deviceName => 'iPhone 5'}
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Planet Blue - Purchase Product (without Login)' do

    $run_count.times do
      scenario 'Recording Locators', "#{$tag}": true do

        step "User goes to the page",
             settings('planetblue')['page'] + 'products/the-jessie-midi-2?variant=31773312122964' do |url|
          page.visit url
        end

        step "User clicks Add to Bag button" do
          scroll_to_element 800
          modal.click_close_discount_button
          product_details.click_add_to_bag_button
        end

        step "User clicks CHECKOUT button" do
          product_details.click_checkout_button
        end

        step "User clicks Checkout confirm button" do
          modal.click_close_policies_button
          modal.click_close_discount_button :il
          scroll_to_element 500
          product_details.click_checkout_confirm_button
        end

        step "User checks Order Fields" do
          [
              "First Name",
              "Last Name",
              "Email",
              "Address Line 1",
              "City / Suburb",
              "Mobile Phone"
          ].each {|name|
            order_details.should_see_order_field name
          }
        end

        step "User clicks 'Pay and place order' button" do
          order_details.should_see_pay_button
        end

        sleep 3
      end
    end

  end
end
