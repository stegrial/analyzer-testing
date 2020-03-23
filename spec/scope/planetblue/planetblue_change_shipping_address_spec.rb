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

      # step "User closes Policies Modal" do
      #   modal.click_close_policies_button
      # end

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

  end
end