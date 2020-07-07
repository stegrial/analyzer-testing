require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/walmart/*.rb"

weekly_page = WeeklyPageWalmart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by weekly page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('walmart')['weekly_page'] do |url|
          page.visit url
        end

        step "User sees Name of Store" do
          weekly_page.should_see_store_name_city
        end

        step "User click 'Find Another Store' button" do
          weekly_page.click_find_another_store_btn
        end

        step "User fill zip code field", "10001" do |value|
          weekly_page.fill_zipcode_field value
        end

        step "User click Set Location" do
          weekly_page.click_set_location_btn
        end

        step "User sees Current Location" do
          weekly_page.should_see_current_location
        end

        step "User sees Near Stores" do
          weekly_page.should_see_near_stores
        end

        step "User click Filters button" do
          weekly_page.click_filters_btn
        end

        step "User sees 'Max distance in miles'" do
          weekly_page.should_see_max_distance
        end

        step "User click  Cake button in services" do
          weekly_page.click_cake_service_btn
        end

        step "User click Back button" do
          weekly_page.click_back_btn
        end

        sleep 3
      end
    end

  end
end
