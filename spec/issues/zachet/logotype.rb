require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/zachet'

include ElementSearchValidation

it = Zachet.new

describe 'Preconditions' do


  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end


  feature 'AT-43, Analyzer returns the wrong element (logo) in the Header section' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('zachet')['page'] do |url|
        page.visit url
      end

      step "User clicks on the logo" do
        it.click_logotype
      end

      sleep 3
      # Capybara.current_session.driver.quit
    end


    scenario 'Searching IL', il_run: true do

      step "User resizes browser window to maximum" do
        Capybara.current_session.driver.browser.manage.window.maximize
      end

      step "User goes to the page", settings('zachet')['page'] do |url|
        page.visit url
      end

      step "User clicks on the logo" do
        check_element_path :xpath, Zachet::ZACHET_LOGO_TA, Zachet::ZACHET_LOGO_IL
        it.click_logotype
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User resizes browser window to maximum" do
        Capybara.current_session.driver.browser.manage.window.maximize
      end

      step "User goes to the page", settings('zachet')['page'] do |url|
        page.visit url
      end

      step "User clicks on the logo" do
        check_element_path :xpath, Zachet::ZACHET_LOGO_EP, Zachet::ZACHET_LOGO_IL
        it.click_logotype :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do

      step "User goes to the page", settings('zachet')['page'] do |url|
        page.visit url
      end

      step "User clicks on the logo" do
        it.click_logotype
      end

      sleep 3
      Capybara.current_session.driver.quit
    end

    scenario 'Searching debug', search_debug: true do

      step "User resizes browser window to maximum" do
        Capybara.current_session.driver.browser.manage.window.maximize
      end

      step "User goes to the page", settings('zachet')['page'] do |url|
        page.visit url
      end

      step "User clicks on the logo" do
        it.click_logotype
      end

      sleep 3
    end


  end
end