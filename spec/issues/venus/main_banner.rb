require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/venus_pages/*.rb"

include ElementSearchValidation

home_page = VenusHome.new
navigation_page = VenusNavigation.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature 'AT-55, TA returns the wrong element (Venus - Clicking by the third banner on the main page)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the third banner" do
        home_page.click_third_banner
        sleep 2 # To see that the page is opened!
      end

      step "User clicks on the Venus logo" do
        navigation_page.click_venus_logo
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the third banner" do
        check_element_path :xpath, VenusHome::THIRD_BANNER_TA, VenusHome::THIRD_BANNER_IL
        home_page.click_third_banner
      end

      step "User clicks on the Venus logo" do
        check_element_path :xpath, VenusNavigation::VENUS_LOGO_TA, VenusNavigation::VENUS_LOGO_IL
        navigation_page.click_venus_logo
      end

      step "User clicks on the third banner" do
        check_element_path :xpath, VenusHome::THIRD_BANNER_TA, VenusHome::THIRD_BANNER_IL
        home_page.click_third_banner
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the third banner" do
        check_element_path :xpath, VenusHome::THIRD_BANNER_EP, VenusHome::THIRD_BANNER_IL
        home_page.click_third_banner :ep
      end

      step "User clicks on the Venus logo" do
        check_element_path :xpath, VenusNavigation::VENUS_LOGO_EP, VenusNavigation::VENUS_LOGO_IL
        navigation_page.click_venus_logo :ep
      end

      step "User clicks on the third banner" do
        check_element_path :xpath, VenusHome::THIRD_BANNER_EP, VenusHome::THIRD_BANNER_IL
        home_page.click_third_banner :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the third banner" do
        home_page.click_third_banner
      end

      step "User clicks on the Venus logo" do
        navigation_page.click_venus_logo :il
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the third banner" do
        home_page.click_third_banner :il
      end

      step "User clicks on the Venus logo" do
        navigation_page.click_venus_logo :il
      end

      step "User clicks on the third banner" do
        home_page.click_third_banner
      end

      sleep 3
    end


  end
end
