require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/venus_pages/*.rb"

product_page = VenusProduct.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature ', TA returns the wrong element (Venus - Check price on product)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~72~&ProductDisplayID=40289' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User checks price on product" do
        product_page.find_price_on_product
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~72~&ProductDisplayID=64968' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User checks price on product" do
        check_element_path :xpath, VenusProduct::PRICE_ON_PRODUCT_TA, VenusProduct::PRICE_ON_PRODUCT_IL
        product_page.find_price_on_product
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~72~&ProductDisplayID=64968' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User checks price on product" do
        check_element_path :xpath, VenusProduct::PRICE_ON_PRODUCT_EP, VenusProduct::PRICE_ON_PRODUCT_IL
        product_page.find_price_on_product :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~72~&ProductDisplayID=40289' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User checks price on product" do
        product_page.find_price_on_product
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", 'https://www.venus.com/viewproduct.aspx?BRANCH=7~72~&ProductDisplayID=64968' do |url|
        # If this product is not on the site, substitute URL another product
        page.visit url
      end

      step "User checks price on product" do
        check_element_path :xpath, VenusProduct::PRICE_ON_PRODUCT_TA, VenusProduct::PRICE_ON_PRODUCT_IL
        product_page.find_price_on_product
      end

      sleep 3
    end


  end
end
