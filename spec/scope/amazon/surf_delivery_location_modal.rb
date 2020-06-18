require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/amazon/*.rb"

header_navigation = HeaderNavigation.new
location_modal = DeliveryLocationModal.new


describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf delivery location modal' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do

        step "User goes to the page", settings('amazon')['page'] do |url|
          page.visit url
        end

        step "User clicks on delivery location button" do
          header_navigation.click_delivery_location_btn
        end

        step "User sees choose location text" do
          location_modal.should_see_choose_location_text
        end

        step "User sees 'Sign in to see your addresses' button" do
          location_modal.should_see_signin_addresses_btn
        end

        step "User fill zip code input", "10001" do |value|
          location_modal.fill_zip_code_input value
        end

        step "User sees apply button" do
          location_modal.should_see_apply_btn
        end

        step "User clicks country  dropdown" do
          location_modal.click_country_dropdown
        end

        step "User clicks Vietnam from list" do
          location_modal.select_vietnam_from_list
        end

        step "User clicks done button" do
          location_modal.click_done_btn
        end

        step "User sees delivery Vietnam button" do
          header_navigation.should_see_delivery_vietnam
        end

        sleep 3
      end
    end

  end
end
