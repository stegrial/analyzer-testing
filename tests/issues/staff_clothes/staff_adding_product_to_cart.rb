require 'spec_helper'
require_relative '../../pages/es/united_methods'
require_relative '../../pages/staff_clothes.rb'
require_relative '../../helpers/special_methods'

include PathCheck
include StaffClothes

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Analyzer returns the wrong element (link) in the Offer of month section' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('staff')['page'] do |url|
        page.visit url
      end

      step "User clicks on hamburger menu button" do
        click_humburg_menu
      end

      step "User clicks for selecting Mans category" do
        click_men_category
      end

      step "User click on Polo and T-shirt" do
        click_polo_tshirts
      end

      step "User clicks for selecting staff" do
        click_to_choose_polo
      end

      step "User clicks for size selecting" do
        click_to_choose_size
      end

      step "User clicks for adding to cart" do
        click_to_add_to_cart
      end

      step "User clicks for changing order in cart" do
        click_to_change_cart
      end

      step "User clicks for delete from cart" do
        click_to_delete_order
      end

      step "User clicks for changing order in carfort" do
        click_to_update_cart
      end

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('staff')['page'] do |url|
        page.visit url
      end

      step "User clicks on hamburger menu button" do
        check_element_path @hamburger_menu_ta, @hamburger_menu_il
        click_humburg_menu
      end

      step "User clicks for selecting Mans category" do
        check_element_path @men_category_ta, @men_category_il
        click_men_category
      end

      step "User click on Polo and T-shirt" do
        check_element_path @polo_tshirts_ta, @polo_tshirts_il
        click_polo_tshirts
      end

      step "User clicks for selecting staff" do
        check_element_path @choose_polo_ta, @choose_polo_il
        click_to_choose_polo
      end

      step "User clicks for size selecting" do
        check_element_path @choose_size_ta, @choose_size_il
        click_to_choose_size
      end

      step "User clicks for adding to cart" do
        check_element_path @add_to_cart_ta, @add_to_cart_il
        click_to_add_to_cart
      end

      step "User clicks for changing order in cart" do
        check_element_path @go_to_cart_btn_ta, @go_to_cart_btn_il
        click_to_change_cart
      end

      step "User clicks for delete from cart" do
        check_element_path @delete_order_ta, @delete_order_il
        click_to_delete_order
      end

      step "User clicks for changing order in carfort" do
        check_element_path @comeback_to_catalog_ta, @comeback_to_catalog_il
        click_to_update_cart
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('staff')['page'] do |url|
        page.visit url
      end

      step "User clicks on hamburger menu button" do
        check_element_path @hamburger_menu_ep, @hamburger_menu_il
        click_humburg_menu :ep
      end

      step "User clicks for selecting Mans category" do
        check_element_path @men_category_ep, @men_category_il
        click_men_category :ep
      end

      step "User click on Polo and T-shirt" do
        check_element_path @polo_tshirts_ep, @polo_tshirts_il
        click_polo_tshirts :ep
      end

      step "User clicks for selecting staff" do
        check_element_path @choose_polo_ep, @choose_polo_il
        click_to_choose_polo :ep
      end

      step "User clicks for size selecting" do
        check_element_path @choose_size_ep, @choose_size_il
        click_to_choose_size :ep
      end

      step "User clicks for adding to cart" do
        check_element_path @add_to_cart_ep, @add_to_cart_il
        click_to_add_to_cart :ep
      end

      step "User clicks for changing order in cart" do
        check_element_path @go_to_cart_btn_ep, @go_to_cart_btn_il
        click_to_change_cart :ep
      end

      step "User clicks for delete from cart" do
        check_element_path @delete_order_ep, @delete_order_il
        click_to_delete_order :ep
      end

      step "User clicks for changing order in carfort" do
        check_element_path @comeback_to_catalog_ep, @comeback_to_catalog_il
        click_to_update_cart :ep
      end
    end

  end
end