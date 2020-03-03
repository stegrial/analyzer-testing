require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/staff_clothes'

include ElementSearchValidation

it = Staffclothes.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Staff Clothes - adding product to cart' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('staff')['page'] do |url|
        page.visit url
      end

      step "User clicks on hamburger menu button" do
        it.click_humburg_menu
      end

      step "User clicks for selecting Mans category" do
        it.click_men_category
      end

      step "User click on Polo and T-shirt" do
        it.click_polo_tshirts
      end

      step "User clicks for selecting staff" do
        it.click_to_choose_polo
      end

      step "User clicks for size selecting" do
        it.click_to_choose_size
      end

      step "User clicks for adding to cart" do
        it.click_to_add_to_cart
      end

      step "User clicks for changing order in cart" do
        it. click_to_change_cart
      end

      step "User clicks for delete from cart" do
        it.click_to_delete_order
      end

      step "User clicks for changing order in carfort" do
        it.click_to_update_cart
      end

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('staff')['page'] do |url|
        page.visit url
      end

      step "User clicks on hamburger menu button" do
        check_element_path :xpath,  Staffclothes::HUMBURGER_MENU_TA, Staffclothes::HUMBURGER_MENU_IL
        it.click_humburg_menu
      end

      step "User clicks for selecting Mans category" do
        check_element_path :xpath, Staffclothes::MEN_CATEGORY_TA, Staffclothes::MEN_CATEGORY_IL
        it.click_men_category
      end

      step "User click on Polo and T-shirt" do
        check_element_path :xpath, Staffclothes::POLO_TSHIRTS_TA, Staffclothes::POLO_TSHIRTS_IL
        it.click_polo_tshirts
      end

      step "User clicks for selecting staff" do
        check_element_path :xpath, Staffclothes::CHOOSE_POLO_TA, Staffclothes::CHOOSE_POLO_IL
        it.click_to_choose_polo
      end

      step "User clicks for size selecting" do
        check_element_path :xpath, Staffclothes::CHOOSE_SIZE_TA, Staffclothes::CHOOSE_SIZE_IL
        it.click_to_choose_size
      end

      step "User clicks for adding to cart" do
        check_element_path :xpath, Staffclothes::ADD_TO_CART_TA, Staffclothes::ADD_TO_CART_IL
        it.click_to_add_to_cart
      end

      step "User clicks for changing order in cart" do
        check_element_path :xpath, Staffclothes::GO_TO_CART_BTN_TA, Staffclothes::GO_TO_CART_BTN_IL
        it.click_to_change_cart
      end

      step "User clicks for delete from cart" do
        check_element_path :xpath, Staffclothes::DELETE_PRDER_TA, Staffclothes::DELETE_PRDER_IL
        it.click_to_delete_order
      end

      step "User clicks for changing order in carfort" do
        check_element_path :xpath, Staffclothes::COMEBACK_TO_CATALOG_TA, Staffclothes::COMEBACK_TO_CATALOG_IL
        it.click_to_update_cart
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('staff')['page'] do |url|
        page.visit url
      end

      step "User clicks on hamburger menu button" do
        check_element_path :xpath,  Staffclothes::HUMBURGER_MENU_EP, Staffclothes::HUMBURGER_MENU_IL
        it.click_humburg_menu :ep
      end

      step "User clicks for selecting Mans category" do
        check_element_path :xpath, Staffclothes::MEN_CATEGORY_EP, Staffclothes::MEN_CATEGORY_IL
        it.click_men_category :ep
      end

      step "User click on Polo and T-shirt" do
        check_element_path :xpath, Staffclothes::POLO_TSHIRTS_EP, Staffclothes::POLO_TSHIRTS_IL
        it.click_polo_tshirts :ep
      end

      step "User clicks for selecting staff" do
        check_element_path :xpath, Staffclothes::CHOOSE_POLO_EP, Staffclothes::CHOOSE_POLO_IL
        it.click_to_choose_polo :ep
      end

      step "User clicks for size selecting" do
        check_element_path :xpath, Staffclothes::CHOOSE_SIZE_EP, Staffclothes::CHOOSE_SIZE_IL
        it.click_to_choose_size :ep
      end

      step "User clicks for adding to cart" do
        check_element_path :xpath, Staffclothes::ADD_TO_CART_EP, Staffclothes::ADD_TO_CART_IL
        it.click_to_add_to_cart :ep
      end

      step "User clicks for changing order in cart" do
        check_element_path :xpath, Staffclothes::GO_TO_CART_BTN_EP, Staffclothes::GO_TO_CART_BTN_IL
        it.click_to_change_cart :ep
      end

      step "User clicks for delete from cart" do
        check_element_path :xpath, Staffclothes::DELETE_PRDER_EP, Staffclothes::DELETE_PRDER_IL
        it.click_to_delete_order :ep
      end

      step "User clicks for changing order in carfort" do
        check_element_path :xpath, Staffclothes::COMEBACK_TO_CATALOG_EP, Staffclothes::COMEBACK_TO_CATALOG_IL
        it.click_to_update_cart :ep
      end
    end

  end
end