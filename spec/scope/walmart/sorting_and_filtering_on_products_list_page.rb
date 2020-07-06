require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

header_nav = HeaderNavigationPageWalmart.new
plp = ProductsListPageWalmart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Sorting and filtering on products list page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['main_page'] do |url|
          page.visit url
        end

        step "User clicks to open hamburger menu" do
          header_nav.click_hamburger_menu
        end

        step "User clicks Patio & Garden category" do
          header_nav.click_patio_garden_category
        end

        step "User clicks Patio Sets" do
          header_nav.click_patio_sets
        end

        step "User clicks sort by price range" do
          plp.click_filter_by_price_range
        end

        step "User fill min price","100" do |value|
          plp.fill_min_prise_of_sorting value
        end

        step "User fill max price","500" do |value|
          plp.fill_max_prise_of_sorting value
        end

        step "User click Go link" do
          plp.click_go_link
        end

        step "User click sort by price" do
          plp.click_sort_by_price
        end

        step "User click 'Prise: low to high'" do
          plp.click_price_low_to_high
        end

        step "User click 'CLEAR ALL' filters button" do
          plp.click_clear_all_button
        end

        step "User click Sort by Top Brands" do
          plp.click_filter_by_top_brands
        end

        step "User select brand from list" do
          plp.click_to_select_brand
        end

        sleep 3
      end
    end

  end
end
