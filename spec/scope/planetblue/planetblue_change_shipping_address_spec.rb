require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

shipping = Shipping.new
modal = Modal.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Change Shipping Address' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] + 'pages/student-discounts' do |url|
        page.visit url
      end

      step "User clicks Shipping dropdown" do
        shipping.click_shipping_dropdown
      end

      step "User selects Country from dropdown" do
        shipping.select_country 'Zambia'
      end

      step "User selects currency from dropdown" do
        shipping.select_currency 'US Dollar'
      end

      step "User clicks Save button" do
        shipping.click_save_button
      end

    end

    scenario 'Searching Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] + 'pages/student-discounts' do |url|
        page.visit url
      end

      step "User clicks Shipping dropdown" do
        check_element_path :css, shipping.SHIPPING_DROPDOWN_TA, shipping.SHIPPING_DROPDOWN_IL
        shipping.click_shipping_dropdown :ta
      end

      step "User selects Country from dropdown" do
        check_element_path :css, shipping.COUNTRY_DROPDOWN_TA, shipping.COUNTRY_DROPDOWN_IL
                           shipping.select_country :ta, 'Zambia'
      end

      step "User selects currency from dropdown" do
        check_element_path :css, shipping.CURRENCY_DROPDOWN_TA, shipping.CURRENCY_DROPDOWN_IL
        shipping.select_currency :ta, 'US Dollar'
      end

      step "User clicks Save button" do
        check_element_path :css, shipping.SAVE_BUTTON_TA, shipping.SAVE_BUTTON_IL
        shipping.click_save_button :ta
      end

    end

  end
end