require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/flipkart/*.rb"


header_nav = HeaderNavigationFlipkart.new
flight_page = FlightPageFlipkart.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by Flight Page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('flipkart')['flight_page'] do |url|
          page.visit url
        end

        step "Need to press escape" do
          header_nav.escape
        end

        step "User click Round Trip radiobutton" do
          flight_page.click_round_trip
        end

        step "User fill From input", "Mumbai" do |value|
          flight_page.fill_from_input value
        end

        step "User click From Mumbai from dropdown" do
          flight_page.click_Mumbai_from_dropdown
        end

        step "User fill From input", "Odesa" do |value|
          flight_page.fill_to_input value
        end

        step "User click From Odesa from dropdown" do
          flight_page.click_Odesa_from_dropdown
        end

        step "User click Depart On input" do
          flight_page.click_depart_on
        end

        step "User sees Depart On current Month and Year" do
          flight_page.should_see_depart_current_month_year
        end

        step "User click Return On input" do
          flight_page.click_return_on
        end

        step "User sees Return On Date" do
          flight_page.click_return_on_date
        end

        step "User click Travellers" do
          flight_page.click_travellers
        end

        step "User sees Adults" do
          flight_page.should_see_adults
        end

        step "User click + button for adding one adult person" do
          flight_page.click_plus_adult_person
        end

        step "User click Premium Cabin Class" do
          flight_page.click_premium_class
        end

        step "User click Done button" do
          flight_page.click_done_btn
        end

        step "User click Search button" do
          flight_page.click_search_btn
        end

        sleep 3
      end
    end

  end
end
