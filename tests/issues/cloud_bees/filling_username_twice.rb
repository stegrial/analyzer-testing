require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'AT-46, TA Analyzer can not find an element when the element got the value attribute (filling the same field twice)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      # 4.times do # to check each time overwriting element signatures
        step "User fills the Username field", 'admin' do |username|
          login_page.fill_username_field username
        end
      # end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      2.times do
        step "User fills the Username field", 'admin' do |username|
          check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
          login_page.fill_username_field username
        end

        step "User fills the Username field", 'user' do |username|
          check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
          login_page.fill_username_field username
        end
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      2.times do
        step "User fills the Username field", 'admin' do |username|
          check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
          login_page.fill_username_field :ep, username
        end

        step "User fills the Username field", 'user' do |username|
          check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
          login_page.fill_username_field :ep, username
        end
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", 'admin' do |username|
        login_page.fill_username_field username
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User fills the Username field", 'admin' do |username|
        login_page.fill_username_field :il, username
      end

      step "User fills the Username field", 'user' do |username|
        login_page.fill_username_field username
      end

      sleep 3
    end


  end
end
