require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

product_page = TheTiebarProductPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Add product to cart' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['shirts_page'] do |url|
        page.visit url
      end

      step "User clicks the second shirt on product" do
        product_page.click_second_shirt_on_product
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
      end
    end

  # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['shirts_page'] do |url|
        page.visit url
      end

      step "User clicks the second shirt on product" do
        check_element_path :xpath, TheTiebarProductPage::SECOND_SHIRT_PDP_EP, TheTiebarProductPage::SECOND_SHIRT_PDP_IL
        product_page.click_second_shirt_on_product
      end

      step "User clicks the size button" do
        product_page.click_to_select_neck_size
      end

      step "User clicks the sleeve_length button" do
        product_page.click_sleeve_length_btn
      end

      step "User clicks the + button to add quantity" do
        check_element_path :xpath, TheTiebarProductPage::QUANTITY_EP, TheTiebarProductPage::QUANTITY_IL
        product_page.click_add_quantity_btn
      end

      step "User clicks the add to cart button" do
        check_element_path :xpath, TheTiebarProductPage::ADD_TO_CART_EP, TheTiebarProductPage::ADD_TO_CART_IL
        product_page.click_add_to_cart_btn
      end

    end
  end
end