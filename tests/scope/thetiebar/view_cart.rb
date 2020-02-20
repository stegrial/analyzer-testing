require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

product_page = TheTiebarProductPage.new
header_page = TheTiebarHeader.new
cart_page = TheTiebarCartPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'View Cart  - adding quantity in cart page' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['shirts_page'] do |url|
        page.visit url
      end

      step "User clicks the second shirt on product" do
        product_page.click_second_shirt_on_product
      end

      step "User clicks the trim  button" do
        product_page.click_fit_trim_btn
      end

      step "User clicks the size button" do
        product_page.click_to_select_neck_size
      end

      step "User clicks the sleeve_length button" do
        product_page.click_sleeve_length_btn
      end

      step "User clicks the + button to add quantity" do
        product_page.click_add_quantity_btn
      end

      step "User clicks the add to cart button" do
        product_page.click_add_to_cart_btn
        sleep 4
      end


      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click cart button" do
        sleep 2
        header_page.click_cart_icon
      end

      step "User click plus quantity icon" do
        cart_page.click_plus_quantity_icon
      end

      step "User click view cart link" do
        cart_page.click_view_cart_link
      end

      step "User click checkout button" do
        cart_page.click_checkout_now_btn
      end
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['shirts_page'] do |url|
        page.visit url
      end

      step "User clicks the second shirt on product" do
        check_element_path :xpath, TheTiebarProductPage::SECOND_SHIRT_PDP_TA, TheTiebarProductPage::SECOND_SHIRT_PDP_IL
        product_page.click_second_shirt_on_product
      end

      step "User clicks the trim  button" do
        check_element_path :xpath, TheTiebarProductPage::FIT_TRIM_TA, TheTiebarProductPage::FIT_TRIM_IL
        product_page.click_fit_trim_btn
      end

      step "User clicks the size button" do
        product_page.click_to_select_neck_size
      end

      step "User clicks the sleeve_length button" do
        product_page.click_sleeve_length_btn
      end

      step "User clicks the + button to add quantity" do
        check_element_path :xpath, TheTiebarProductPage::QUANTITY_TA, TheTiebarProductPage::QUANTITY_IL
        product_page.click_add_quantity_btn
      end

      step "User clicks the add to cart button" do
        check_element_path :xpath, TheTiebarProductPage::ADD_TO_CART_TA, TheTiebarProductPage::ADD_TO_CART_IL
        product_page.click_add_to_cart_btn
        sleep 4
      end


      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click cart button" do
        sleep 2
        check_element_path :xpath, TheTiebarHeader::CART_BTN_TA, TheTiebarHeader::CART_BTN_IL
        header_page.click_cart_icon
      end

      step "User click plus quantity icon" do
        check_element_path :xpath, TheTiebarCartPage::PLUS_QUANTITY_CART_TA, TheTiebarCartPage::PLUS_QUANTITY_CART_IL
        cart_page.click_plus_quantity_icon
      end

      step "User click view cart link" do
        check_element_path :xpath, TheTiebarCartPage::VIEW_CART_TA, TheTiebarCartPage::VIEW_CART_IL
        cart_page.click_view_cart_link
      end

      step "User click checkout button" do
        check_element_path :xpath, TheTiebarCartPage::CHECKOUT_NOW_BTN_TA, TheTiebarCartPage::CHECKOUT_NOW_BTN_IL
        cart_page.click_checkout_now_btn
      end
    end

  # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['shirts_page'] do |url|
        page.visit url
      end

      step "User clicks the second shirt on product" do
        check_element_path :xpath, TheTiebarProductPage::SECOND_SHIRT_PDP_EP, TheTiebarProductPage::SECOND_SHIRT_PDP_IL
        product_page.click_second_shirt_on_product :ep
      end

      step "User clicks the trim  button" do
        check_element_path :xpath, TheTiebarProductPage::FIT_TRIM_EP, TheTiebarProductPage::FIT_TRIM_IL
        product_page.click_fit_trim_btn :ep
      end

      step "User clicks the size button" do
        product_page.click_to_select_neck_size
      end

      step "User clicks the sleeve_length button" do
        product_page.click_sleeve_length_btn
      end

      step "User clicks the + button to add quantity" do
        check_element_path :xpath, TheTiebarProductPage::QUANTITY_EP, TheTiebarProductPage::QUANTITY_IL
        product_page.click_add_quantity_btn :ep
      end

      step "User clicks the add to cart button" do
        check_element_path :xpath, TheTiebarProductPage::ADD_TO_CART_EP, TheTiebarProductPage::ADD_TO_CART_IL
        product_page.click_add_to_cart_btn :ep
        sleep 4
      end


      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User click cart button" do
        sleep 2
        check_element_path :xpath, TheTiebarHeader::CART_BTN_EP, TheTiebarHeader::CART_BTN_IL
        header_page.click_cart_icon :ep
      end

      step "User click plus quantity icon" do
        check_element_path :xpath, TheTiebarCartPage::PLUS_QUANTITY_CART_EP, TheTiebarCartPage::PLUS_QUANTITY_CART_IL
        cart_page.click_plus_quantity_icon :ep
      end

      step "User click view cart link" do
        check_element_path :xpath, TheTiebarCartPage::VIEW_CART_EP, TheTiebarCartPage::VIEW_CART_IL
        cart_page.click_view_cart_link :ep
      end

      step "User click checkout button" do
        check_element_path :xpath, TheTiebarCartPage::CHECKOUT_NOW_BTN_EP, TheTiebarCartPage::CHECKOUT_NOW_BTN_IL
        cart_page.click_checkout_now_btn :ep
      end
    end
  end
end