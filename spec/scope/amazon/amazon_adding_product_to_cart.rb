require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/amazon.rb'

include ElementSearchValidation

it = Amazon.new

# This tests runs when the vpn is ON

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Amazon  - adding product to cart' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('amazon')['page'] do |url|
        page.visit url
      end

      step "User clicks on ", "dress" do |data|
        it.set_data_in_search(data)
      end

      step "User clicks on search button " do
        it.click_search_btn
        sleep 3
      end

      step "User clicks on the desired search result" do
        sleep 5
        it.click_product_from_search_result
      end

      step "User clicks on the appropriate button to click size btn" do
        # sleep 5
        it.click_to_select_size_btn
      end

      step "User clicks on the appropriate button to select size" do
        it.click_to_select_size
      end

      step "User clicks add to cart button" do
        it.click_for_add_to_cart
      end
    end

    scenario 'Searching IL', il1: true do

      step "User goes to the page", settings('amazon')['page'] do |url|
        page.visit url
      end

      step "User clicks on ", "dress" do |data|
        check_element_path :xpath, Amazon::MAIN_SEARCH_TA, Amazon::MAIN_SEARCH_IL
        it.set_data_in_search(data)
      end

      step "User clicks on search button " do
        check_element_path :xpath, Amazon::SEARCH_BTN_TA, Amazon::SEARCH_BTN_IL
        it.click_search_btn
      end

      step "User clicks on the desired search result" do
        check_element_path :xpath, Amazon::PRODUCT_FROM_SEARCH_TA, Amazon::PRODUCT_FROM_SEARCH_IL
       # sleep 2
        it.click_product_from_search_result
      end

      step "User clicks on the appropriate button to click size button" do
        check_element_path :xpath, Amazon::SIZE_LIST_TA, Amazon::SIZE_LIST_IL
        it.click_to_select_size_btn
      end

      step "User clicks on the appropriate button to select size" do
        check_element_path :xpath, Amazon::SIZE_TA, Amazon::SIZE_IL
        it.click_to_select_size
      end

      step "User clicks add to cart button" do
        check_element_path :xpath, Amazon::ADD_TO_CART_TA, Amazon::ADD_TO_CART_IL
        it.click_for_add_to_cart
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('amazon')['page'] do |url|
        page.visit url
      end

      step "User clicks on ", "dress" do |data|
        check_element_path :xpath, Amazon::MAIN_SEARCH_EP, Amazon::MAIN_SEARCH_IL
        it.set_data_in_search(:ep, data)
      end

      step "User clicks on search button " do
        check_element_path :xpath, Amazon::SEARCH_BTN_EP, Amazon::SEARCH_BTN_IL
        it.click_search_btn :ep
      end

      step "User clicks on the desired search result" do
        check_element_path :xpath, Amazon::PRODUCT_FROM_SEARCH_EP, Amazon::PRODUCT_FROM_SEARCH_IL
        it.click_product_from_search_result :ep
      end

      step "User clicks on the appropriate button to select size" do
        check_element_path :xpath, Amazon::SIZE_LIST_EP, Amazon::SIZE_LIST_IL
        it.click_to_select_size_btn :ep
      end

      step "User clicks add to cart button" do
        check_element_path :xpath, Amazon::ADD_TO_CART_EP, Amazon::ADD_TO_CART_IL
        it.click_for_add_to_cart :ep
      end
    end
  end
end