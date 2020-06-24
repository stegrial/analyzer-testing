require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/flipkart/*.rb"


header_nav = HeaderNavigationFlipkart.new
plp = ProductListPageFlipkart.new
pdp = ProductPageFlipkart.new
cart_page = CartPageFlipkart.new

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
        step "User goes to the page", settings('flipkart')['main_page'] do |url|
          page.visit url
        end

        step "Need to press escape " do
          header_nav.escape
        end

        step "User clicks women link" do
          header_nav.click_women_link
        end

        step "User clicks on dresses link" do
          header_nav.click_dresses_link
        end

        step "User clicks second dress link" do
          sleep 3 # wait for page load
          plp.click_second_dress_link
        end

        step "Switch to window" do
          plp.switch_to_window
        end

        step "User sees general name of product" do
          pdp.should_see_product_name
        end

        step "User sees  price of product" do
          pdp.should_see_product_price
        end

        step "User sees available offers text" do
          pdp.should_see_available_offers
        end

        step "User click to select color of product" do
          pdp.click_to_choose_color
        end

        step "User click to select size of product" do
          pdp.click_to_choose_size
        end

        step "User click Add to Cart button" do
          pdp.click_add_to_cart
        end

        step "User sees My Cart text on page" do
          sleep 2
          cart_page.should_see_my_cart
        end

        sleep 3
      end
    end

  end
end

