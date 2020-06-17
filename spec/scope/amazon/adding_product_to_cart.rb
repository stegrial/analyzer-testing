require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"

product_page = ProductPage.new
plp = ProductListPage.new
header_navigation = HeaderNavigation.new


describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Amazon  - adding product to cart' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('amazon')['page'] do |url|
          page.visit url
        end

        step "User clicks on ", "dress" do |value|
          header_navigation.set_data_in_search(value)
        end

        step "User clicks on search button " do
          header_navigation.click_search_btn
        end

        step "User clicks on the desired search result" do
          plp.click_product_from_search_result
        end

        step "User clicks on the appropriate button to click size btn" do
          product_page.click_to_select_size_btn
        end

        step "User clicks on the appropriate button to select size" do
          product_page.should_see_size_btn
        end

        step "User clicks add to cart button" do
          product_page.click_for_add_to_cart
        end

        sleep 3
      end
    end

  end
end
