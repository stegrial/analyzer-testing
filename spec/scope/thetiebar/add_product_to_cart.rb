require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

product_page = TheTiebarProductPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Add product to cart' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['shirts_page'] do |url|
          page.visit url
        end

        step "User clicks the second shirt on product" do
          product_page.click_second_shirt_on_product
        end

        step "User clicks the trim button" do
          sleep 5 # need sleep because page freezes when searching the element
          product_page.click_fit_trim_btn
        end

        step "User clicks the size button" do
          product_page.click_to_select_neck_size
        end

        step "User clicks the sleeve_length button" do
          product_page.click_sleeve_length_btn
        end

        step "User clicks the add to cart button" do
          product_page.click_add_to_cart_btn
        end

        sleep 3
      end
    end

  end
end
