require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"

left_side_menu = LeftSideMenu.new
header_navigation = HeaderNavigation.new
product_list_page = ProductListPage.new


describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by hamburger menu' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('amazon')['page'] do |url|
          page.visit url
        end

        step "User clicks on hamburger menu button" do
          header_navigation.click_hamburger_menu_btn
        end

        step "User sees customer name" do
          left_side_menu.should_see_customer_name
        end

        step "User sees customer text" do
          left_side_menu.should_see_by_category_text
        end

        step "User click women fashion link" do
          left_side_menu.click_women_fashion_link
        end

        step "User click women fashion text" do
          left_side_menu.should_see_women_fashion_text
        end

        step "User click jewelry link" do
          left_side_menu.click_jewelry_link
        end

        step "User sees jewelry in result bar" do
          product_list_page.should_see_result_bar_jewelry
        end

        step "User sees jewelry selected in main search" do
          header_navigation.should_see_jewelry_in_search
        end

        sleep 3
      end
    end

  end
end
