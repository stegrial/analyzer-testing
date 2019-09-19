require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/revolve'

it = Revolve.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-981 Filling checkout page' do

    scenario 'Recording IL', il_run: true do

      step "User goes to the page" do
        visit 'https://revolve-pwa.moovweb.cloud/mobile/s?s=c&c=Jewelry%20%26%20Accessories&sc=&d=Womens&fw=false'
      end

      step "User clicks on jewelry product img" do
        it.click_jewelry_product_img
      end

      step "User clicks on buy button" do
        it.click_add_to_bag
      end

      step "User clicks cart page" do
        it.click_view_bag
      end

      step "User clicks on checkout page" do
        it.click_proceed_to_checkout1
        sleep 10
      end


      step "User set name ", "juli test" do |name|
        it.set_name(name)
      end

      step "User set address ", "Home st." do |address|
        sleep 2
        it.set_address(address)
      end

      step "User set more address", "apt.12" do |address2|
        sleep 2
        it.set_deep_address(address2)
      end

      sleep 5

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page" do
        visit 'https://revolve-pwa.moovweb.cloud/mobile/s?s=c&c=Jewelry%20%26%20Accessories&sc=&d=Womens&fw=false'
      end

      step "User clicks on jewelry product img" do
        check_element_path :xpath, Revolve::PRODUCT_IMG_TA, Revolve::PRODUCT_IMG_IL
        it.click_jewelry_product_img
      end

      step "User clicks on buy button" do
        check_element_path :xpath, Revolve::ADD_TO_BAG_TA, Revolve::ADD_TO_BAG_IL
        it.click_add_to_bag
      end

      step "User clicks cart page" do
        check_element_path :xpath, Revolve::VIEW_BAG_TA, Revolve::VIEW_BAG_IL
        it.click_view_bag
      end

      step "User clicks on checkout page" do
        it.click_proceed_to_checkout1
        sleep 10
      end

      step "User set name ", "juli test" do |name|
        check_element_path :xpath, Revolve::FULL_NAME_TA, Revolve::FULL_NAME_IL
        it.set_name( name)
      end

      step "User set address ", "Home st." do |address|
        sleep 2
        check_element_path :xpath, Revolve::ADDRESS_TA, Revolve::ADDRESS_IL
        it.set_address(address)
      end

      step "User set more address", "apt.12" do |address2|
        sleep 2
        check_element_path :xpath, Revolve::DEEP_ADDRESS_TA, Revolve::DEEP_ADDRESS_IL
        it.set_deep_address(address2)
      end

      sleep 5

    end

    scenario 'Recording debug', rec_debug: true do

      step "User goes to the page" do
        visit 'https://revolve-pwa.moovweb.cloud/mobile/s?s=c&c=Jewelry%20%26%20Accessories&sc=&d=Womens&fw=false'
      end

      step "User clicks on jewelry product img" do
        it.click_jewelry_product_img :il
      end

      step "User clicks on buy button" do
        it.click_add_to_bag :il
      end

      step "User clicks cart page" do
        it.click_view_bag :il
      end

      step "User clicks on checkout page" do
        it.click_proceed_to_checkout1
        sleep 10
      end

      step "User set name ", "juli test" do |name|
        it.set_name(:il, name)
      end

      step "User set address ", "Home st." do |address|
        sleep 2
        it.set_address(:il, address)
      end

      step "User set more address", "apt.12" do |address2|
        sleep 2
        it.set_deep_address(address2)
      end

      sleep 5

    end
    scenario 'Searching debug', search_debug: true do

      step "User goes to the page" do
        visit 'https://revolve-pwa.moovweb.cloud/mobile/s?s=c&c=Jewelry%20%26%20Accessories&sc=&d=Womens&fw=false'
      end

      step "User clicks on jewelry product img" do
        it.click_jewelry_product_img :il
      end

      step "User clicks on buy button" do
        it.click_add_to_bag :il
      end

      step "User clicks cart page" do
        it.click_view_bag :il
      end

      step "User clicks on checkout page" do
        it.click_proceed_to_checkout1
        sleep 10
      end

      step "User set name ", "juli test" do |name|
        it.set_name(:il, name)
      end

      step "User set address ", "Home st." do |address|
        sleep 2
        it.set_address(:il, address)
      end

      step "User set more address", "apt.12" do |address2|
        sleep 2
        it.set_deep_address(address2)
      end

      sleep 5

    end
  end
end