require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/ta_pages/*.rb"

ta_website = TAWebsite.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-1026, TA Analyzer can not find the element (div), TA website - Login button on the Home page' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('ta')['website_home'] do |url|
        page.visit url
      end

      step "User clicks on the Login button" do
        ta_website.click_login_btn_on_home
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('ta')['website_home'] do |url|
        page.visit url
      end

      step "User clicks on the Login button" do
        check_element_path :xpath, TAWebsite::HOME_LOGIN_BTN_TA, TAWebsite::HOME_LOGIN_BTN_IL
        ta_website.click_login_btn_on_home
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('ta')['website_home'] do |url|
        page.visit url
      end

      step "User clicks on the Login button" do
        check_element_path :xpath, TAWebsite::HOME_LOGIN_BTN_EP, TAWebsite::HOME_LOGIN_BTN_IL
        ta_website.click_login_btn_on_home :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('ta')['website_home'] do |url|
        page.visit url
      end

      step "User clicks on the Login button" do
        ta_website.click_login_btn_on_home
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('ta')['website_home'] do |url|
        page.visit url
      end

      step "User clicks on the Login button" do
        ta_website.click_login_btn_on_home
      end

      sleep 3
    end


  end
end
