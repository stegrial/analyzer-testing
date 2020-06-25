require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/planetblue/*.rb"

product_details = ProductDetails.new
order_details = OrderDetails.new
modal = Modal.new
login = Login.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
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
          modal.click_close_continue_shop_button
        end

        step "User clicks Add to Bag button" do
          product_details.click_add_to_bag_button
        end

        step "User clicks CHECKOUT button" do
          product_details.click_checkout_button
          sleep  20  # wait for page load
        end

        step "User clicks Checkout confirm button" do
          login.click_sign_up_close_button
          modal.click_close_policies_button
          sleep 2
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
