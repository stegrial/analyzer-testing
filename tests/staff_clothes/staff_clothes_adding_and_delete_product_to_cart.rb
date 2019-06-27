require 'spec_helper'
require_relative '../../pages/staff_clothes.rb'
require_relative '../../helpers/special_methods'

include StaffClothes

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
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

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do
      step "User goes to the page", settings('staff')['page'] do |url|
        page.visit url
      end

      step "User clicks on hamburger menu button" do
        ep_click_humburg_menu
      end

      step "User clicks for selecting Mans category" do
        ep_click_men_category
      end

      step "User click on Polo and T-shirt" do
        ep_click_polo_tshirts
      end

      step "User clicks for selecting staff" do
        ep_click_to_choose_polo
      end

      step "User clicks for size selecting" do
        ep_click_to_choose_size
      end

      step "User clicks for adding to cart" do
        ep_click_to_add_to_cart
      end

      step "User clicks for changing order in cart" do
        ep_click_to_change_cart
      end

      step "User clicks for delete from cart" do
        ep_click_to_delete_order
      end

      step "User clicks for changing order in carfort" do
        ep_click_to_update_cart
      end
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do

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

    scenario 'Searching debug', search_debug: true do

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

  end
end