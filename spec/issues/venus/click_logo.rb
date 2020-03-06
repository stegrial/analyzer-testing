require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/venus_pages/*.rb"

include ElementSearchValidation

navigation_page = VenusNavigation.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature 'AT-113, TA returns the wrong element (Venus - Logo button)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", 'https://www.venus.com/about.aspx' do |url|
        page.visit url
      end

      step "User clicks on the Logo button" do
        navigation_page.click_venus_logo
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", 'https://www.venus.com/clothing.aspx' do |url|
        page.visit url
      end

      step "User clicks on the Logo button" do
        check_element_path :xpath, VenusNavigation::VENUS_LOGO_TA, VenusNavigation::VENUS_LOGO_IL
        navigation_page.click_venus_logo
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", 'https://www.venus.com/clothing.aspx' do |url|
        page.visit url
      end

      step "User clicks on the Logo button" do
        check_element_path :xpath, VenusNavigation::VENUS_LOGO_EP, VenusNavigation::VENUS_LOGO_IL
        navigation_page.click_venus_logo :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", 'https://www.venus.com/about.aspx' do |url|
        page.visit url
      end

      step "User clicks on the Logo button" do
        navigation_page.click_venus_logo
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", 'https://www.venus.com/clothing.aspx' do |url|
        page.visit url
      end

      step "User clicks on the Logo button" do
        navigation_page.click_venus_logo
      end

      sleep 3
    end


  end
end
