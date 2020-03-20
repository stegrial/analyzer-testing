require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

product_details = ProductDetails.new
order_details = OrderDetails.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Purchase Product (without Login)' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page",
           settings('planetblue')['page'] + 'products/the-jessie-midi-2?variant=31773312122964' do |url|
        page.visit url
      end

      step "User clicks Add to Bag button" do
        page.execute_script "window.scrollBy(0,700)"
        product_details.click_add_to_bag_button
      end

      step "User clicks CHECKOUT button" do
        product_details.click_checkout_button
      end

      step "User clicks Order toggle button" do
        order_details.click_toggle_order_button
      end

      step "User checks payment methods buttons" do
        order_details.find_payment_button 'Google Pay'
        order_details.find_payment_button 'PayPal'
        order_details.find_payment_button 'Amazon Pay'
      end

      step "User checks 'Log In' link" do
        order_details.find_payment_login_link
      end

      step "User checks News Checkbox" do
        order_details.find_payment_news_checkbox
      end

      step "User checks Order Fields" do
        [
            "First name (optional)",
            "Last name",
            "Address",
            "Apartment, suite, etc. (optional)",
            "City",
            "Phone (optional)"
        ].each { |name|
          order_details.find_order_field name
        }
      end

      step "User clicks Continue button" do
        order_details.click_continue_button
      end

      step "User checks Alerts for required Order Fields" do
        [
            "Last name",
            "Address",
            "City"
        ].each { |name|
          order_details.find_order_alert_field name
        }
      end

    end

  end
end