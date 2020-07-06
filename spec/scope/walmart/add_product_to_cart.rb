require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

header_nav = HeaderNavigationPageWalmart.new
plp = ProductsListPageWalmart.new
cart_page = CartPageWalmart.new
checkout_page = CheckoutPageWalmart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Adding product to cart' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['main_page'] do |url|
          page.visit url
        end

        step "User clicks to open hamburger menu" do
          header_nav.click_hamburger_menu
        end

        step "User clicks select baby category" do
          header_nav.click_baby_category
        end

        step "User clicks to New Arrivals" do
          header_nav.click_new_arrivals
        end

        step "User clicks to select gender unisex" do
          plp.click_gender_unisex
          sleep 3 # wait for page load
        end

        step "User clicks to select free pickup" do
          plp.click_free_pickup
          sleep 3 # wait for page load
        end

        step "User clicks to select product" do
          plp.click_to_add_product_to_cart
        end

        step "User clicks on cart icon" do
          header_nav.click_cart_icon
        end

        step "User sees Your Cart h1" do
          cart_page.should_see_your_cart_h1
        end

        step "User click Checkout button" do
          cart_page.click_checkout_btn
        end

        step "User sees Checkout text" do
          checkout_page.should_see_checkout_text
        end

        sleep 3
      end
    end

  end
end
