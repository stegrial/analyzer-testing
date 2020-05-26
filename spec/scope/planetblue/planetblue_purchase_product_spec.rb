require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

product_details = ProductDetails.new
order_details = OrderDetails.new
modal = Modal.new
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
        modal.click_close_discount_button
        product_details.click_checkout_button
      end

      step "User clicks Checkout confirm button" do
        page.execute_script "window.scrollBy(0,1000)"
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
        ].each { |name|
          order_details.find_order_field name
        }
      end

      step "User clicks 'Pay and place order' button" do
        order_details.find_pay_button
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
        check_element_path :css, modal.CLOSE_DISCOUNT_BUTTON_TA, modal.CLOSE_DISCOUNT_BUTTON_IL
        modal.click_close_discount_button :ta
        check_element_path :css, product_details.ADD_TO_BAG_BUTTON_TA, product_details.ADD_TO_BAG_BUTTON_IL
        product_details.click_checkout_button :ta
      end

      step "User clicks Order toggle button" do
        check_element_path :css, product_details.CHECKOUT_BUTTON_TA, product_details.CHECKOUT_BUTTON_IL
        product_details.click_checkout_button :ta
      end

      step "User clicks Checkout confirm button" do
        page.execute_script "window.scrollBy(0,1000)"
        check_element_path :css, product_details.CHECKOUT_CONFIRM_BUTTON_TA, product_details.CHECKOUT_CONFIRM_BUTTON_IL
        product_details.click_checkout_confirm_button :ta
      end

      step "User checks Order Fields" do
        [
            "First Name",
            "Last Name",
            "Email",
            "Address Line 1",
            "City / Suburb",
            "Mobile Phone"
        ].each { |name|
          check_element_path :css, order_details.order_field(:ta, name), order_details.order_field(:il, name)
          order_details.find_order_field name
        }
      end

      step "User clicks 'Pay and place order' button" do
        check_element_path :css, order_details.PAY_BUTTON_TA, order_details.PAY_BUTTON_IL
        order_details.find_pay_button :ta
      end

    end

  end
end