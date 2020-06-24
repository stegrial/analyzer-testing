require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/flipkart/*.rb"


header_nav = HeaderNavigationFlipkart.new
plp = ProductListPageFlipkart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Filtering and sorting on PLP' do

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

        step "User clicks on jeans link" do
          header_nav.click_jeans_link
        end

        step "User sees products category h1 on top of page" do
          sleep 3 # wait for page load
          plp.should_see_products_category_h1
        end

        step "User clicks to sort on low to high" do
          plp.click_sort_by_low_to_high
        end

        step "User clicks to sort on High to low" do
          plp.click_sort_by_high_to_low
        end

        step "User clicks to sort on newest first" do
          plp.click_sort_by_newest_first
        end

        step "User sees " do
          plp.should_see_price_filter
        end

        step "User select 1500 in min prise dropdown", "1500" do |value|
          plp.select_min_price_filter value
        end

        step "User select 2500 in min prise dropdown", "2500" do |value|
          plp.select_max_price_filter value
        end

        step "User fill 'Lee' in search brand input", "Lee" do |value|
          plp.fill_search_brand value
        end

        step "User click 'Lee' brand" do
          plp.click_lee_brand
        end

        step "User click Color filter" do
          plp.click_color_filter
        end

        step "User click Blue color" do
          plp.click_blue_color
        end

        sleep 3
      end
    end

  end
end

