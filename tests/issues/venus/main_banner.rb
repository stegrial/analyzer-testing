require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/venus'

it = Venus.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-699 TA returns the wrong element (Venus - Clicking by the third banner on the main page)' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the third banner" do
        it.click_third_banner
      end

      step "User clicks on the Venus logo" do
        it.click_venus_logo
      end

      sleep 3
    end

    scenario 'Searching IL', il_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the third banner" do
        check_element_path :xpath, Venus::THIRD_BANNER_TA, Venus::THIRD_BANNER_IL
        it.click_third_banner
      end

      step "User clicks on the Venus logo" do
        check_element_path :xpath, Venus::VENUS_LOGO_TA, Venus::VENUS_LOGO_IL
        it.click_venus_logo
      end

      step "User clicks on the third banner" do
        check_element_path :xpath, Venus::THIRD_BANNER_TA, Venus::THIRD_BANNER_IL
        it.click_third_banner
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the third banner" do
        check_element_path :xpath, Venus::THIRD_BANNER_EP, Venus::THIRD_BANNER_IL
        it.click_third_banner :ep
      end

      step "User clicks on the Venus logo" do
        check_element_path :xpath, Venus::VENUS_LOGO_EP, Venus::VENUS_LOGO_IL
        it.click_venus_logo :ep
      end

      step "User clicks on the third banner" do
        check_element_path :xpath, Venus::THIRD_BANNER_EP, Venus::THIRD_BANNER_IL
        it.click_third_banner :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the third banner" do
        it.click_third_banner
      end

      step "User clicks on the Venus logo" do
        it.click_venus_logo :il
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the third banner" do
        it.click_third_banner :il
      end

      step "User clicks on the Venus logo" do
        it.click_venus_logo :il
      end

      step "User clicks on the third banner" do
        it.click_third_banner
      end

      sleep 3
    end


  end
end
