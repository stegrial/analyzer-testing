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

    scenario 'Recording IL', il_run1: true do

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
        sleep 5
        it.click_proceed_to_checkout1
        it.click_proceed_to_checkout2
      end

      step "User set name ", "juli test" do |name|
        sleep 2
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

      step "User set zip code ", "10001" do |zip|
        sleep 2
        it.set_zip_code(zip)
      end

      step "User set phone ", "475628461" do |number|
        sleep 3
        it.set_phone(number)
        end
      step "User set phone ", "julia.arapova@softesis.com" do |email|
        it.set_order_email(email)
      end

      step "User clicks save button and continue checkout" do
        it.click_continue_save_btn
      end
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
        sleep 5
        it.click_proceed_to_checkout1
        it.click_proceed_to_checkout2
      end

      step "User set name ", "juli test" do |name|
        check_element_path :xpath, Revolve::FULL_NAME_TA, Revolve::FULL_NAME_IL
        it.set_name(name)
      end

      step "User set address ", "Home st." do |address|
        check_element_path :xpath, Revolve::ADDRESS_TA, Revolve::ADDRESS_IL
        it.set_address(address)
      end

      step "User set more address", "apt.12" do |address2|
        check_element_path :xpath, Revolve::DEEP_ADDRESS_TA, Revolve::DEEP_ADDRESS_IL
        it.set_deep_address(address2)
      end

      step "User set zip code ", "10001" do |zip|
        check_element_path :xpath, Revolve::ZIP_CODE_TA, Revolve::ZIP_CODE_IL
        it.set_zip_code(zip)
      end

      step "User set phone ", "475628461" do |number|
        check_element_path :xpath, Revolve::PHONE_TA, Revolve::PHONE_IL
        it.set_phone(number)
      end

      step "User set phone ", "julia.arapova@softesis.com" do |email|
        check_element_path :xpath, Revolve::ORDER_EMAIL_TA, Revolve::ORDER_EMAIL_IL
        it.set_order_email(email)
      end

      step "User clicks save button and continue checkout" do
        check_element_path :xpath, Revolve::SAVE_CONTINUE_BTN_TA, Revolve::SAVE_CONTINUE_BTN_IL
        it.click_continue_save_btn
      end


    end
    # Element Picker from Repository
    scenario 'Searching EP', ep_run: true do

      step "User goes to the page" do
        visit 'https://revolve-pwa.moovweb.cloud/mobile/s?s=c&c=Jewelry%20%26%20Accessories&sc=&d=Womens&fw=false'
      end

      step "User clicks on jewelry product img" do
        check_element_path :xpath, Revolve::PRODUCT_IMG_EP, Revolve::PRODUCT_IMG_IL
        it.click_jewelry_product_img :ep
      end

      step "User clicks on buy button" do
        check_element_path :xpath, Revolve::ADD_TO_BAG_EP, Revolve::ADD_TO_BAG_IL
        it.click_add_to_bag :ep
      end

      step "User clicks cart page" do
        check_element_path :xpath, Revolve::VIEW_BAG_EP, Revolve::VIEW_BAG_IL
        it.click_view_bag :ep
      end

      step "User clicks on checkout page" do
        sleep 5
        it.click_proceed_to_checkout1
        it.click_proceed_to_checkout2
      end

      step "User set name ", "juli test" do |name|
        check_element_path :xpath, Revolve::FULL_NAME_EP, Revolve::FULL_NAME_IL
        it.set_name(:ep, name)
      end

      step "User set address ", "Home st." do |address|
        check_element_path :xpath, Revolve::ADDRESS_EP, Revolve::ADDRESS_IL
        it.set_address(:ep, address)
      end

      step "User set more address", "apt.12" do |address2|
        check_element_path :xpath, Revolve::DEEP_ADDRESS_EP, Revolve::DEEP_ADDRESS_IL
        it.set_deep_address(:ep, address2)
      end

      step "User set zip code ", "10001" do |zip|
        check_element_path :xpath, Revolve::ZIP_CODE_EP, Revolve::ZIP_CODE_IL
        it.set_zip_code(:ep, zip)
      end

      step "User set phone ", "475628461" do |number|
        check_element_path :xpath, Revolve::PHONE_EP, Revolve::PHONE_IL
        it.set_phone(:ep, number)
      end

      step "User set phone ", "julia.arapova@softesis.com" do |email|
        check_element_path :xpath, Revolve::ORDER_EMAIL_EP, Revolve::ORDER_EMAIL_IL
        it.set_order_email(:ep, email)
      end

      step "User clicks save button and continue checkout" do
        check_element_path :xpath, Revolve::SAVE_CONTINUE_BTN_EP, Revolve::SAVE_CONTINUE_BTN_IL
        it.click_continue_save_btn :ep
      end


    end
  end
end
