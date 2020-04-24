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

    scenario 'Searching Locators', search: true do

      step "User goes to the page",
           settings('planetblue')['page'] + 'products/the-jessie-midi-2?variant=31773312122964' do |url|
        page.visit url
      end

      step "User clicks Add to Bag button" do
        page.execute_script "window.scrollBy(0,700)"
        check_element_path :css, product_details.ADD_TO_BAG_BUTTON_TA, product_details.ADD_TO_BAG_BUTTON_IL
        product_details.click_add_to_bag_button :ta
      end

      step "User clicks CHECKOUT button" do
        check_element_path :css, product_details.ADD_TO_BAG_BUTTON_TA, product_details.ADD_TO_BAG_BUTTON_IL
        product_details.click_checkout_button :ta
      end

      step "User clicks Order toggle button" do
        check_element_path :css, order_details.ADD_TO_BAG_BUTTON_TA, order_details.ADD_TO_BAG_BUTTON_IL
        order_details.click_toggle_order_button :ta
      end

      step "User checks payment methods buttons" do
        check_element_path :css, order_details.payment_button(:ta, 'Google Pay'),
                           order_details.payment_button(:il, 'Google Pay')
        check_element_path :css, order_details.payment_button(:ta, 'PayPal'),
                           order_details.payment_button(:il, 'PayPal')
        check_element_path :css, order_details.payment_button(:ta, 'Amazon Pay'),
                           order_details.payment_button(:il, 'Amazon Pay')
        order_details.find_payment_button :ta, 'Google Pay'
        order_details.find_payment_button :ta, 'PayPal'
        order_details.find_payment_button :ta, 'Amazon Pay'
      end

      step "User checks 'Log In' link" do
        check_element_path :css, order_details.PAYMENT_LOGIN_LINK_TA, product_details.PAYMENT_LOGIN_LINK_IL
        order_details.find_payment_login_link :ta
      end

      step "User checks News Checkbox" do
        check_element_path :css, order_details.PAYMENT_NEWS_CHECKBOX_TA, product_details.PAYMENT_NEWS_CHECKBOX_IL
        order_details.find_payment_news_checkbox :ta
      end

      step "User clicks Continue button" do
        check_element_path :css, order_details.CONTINUE_BUTTON_TA, order_details.CONTINUE_BUTTON_IL
        order_details.click_continue_button :ta
      end

      step "User checks Alerts for required Order Fields" do
        [
            "Last name",
            "Address",
            "City"
        ].each { |name|
          check_element_path :css, order_details.order_alert_field(:ta, name),
                             order_details.order_alert_field(:il, name)
          order_details.find_order_alert_field :ta, name
        }
      end

    end

  end
end