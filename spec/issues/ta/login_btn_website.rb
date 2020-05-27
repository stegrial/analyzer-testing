require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/ta_pages/*.rb"

include ElementSearchValidation

nav_page = MainNaviPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 1200)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'TA-1026, TA Analyzer can not find the element (div), TA website - Login button on the Home page' do

    # Initial locators with Recording
    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('ta')['website_home'] do |url|
          page.visit url
        end

        step "User clicks on the Login button" do
          nav_page.click_login_btn_on_nav_panel
        end

        sleep 3
      end
    end
  end
end
