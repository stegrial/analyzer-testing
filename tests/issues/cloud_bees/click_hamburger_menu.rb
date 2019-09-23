require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"
require 'securerandom'


global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new

# This tests runs when the vpn is ON
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end


  after(:all) do
    Capybara.current_session.driver.quit
  end
  feature 'AT-83 CloudBees - Click hamburger menu ' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field  credentials['username']
        login_page.fill_pass_field  credentials['pass']
        login_page.click_sign_in_button
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end
    end


    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "User clicks on humburg bth" do
        check_element_path :css  , CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do


      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field :ep, credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_EP, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field :ep, credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_EP, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
      end

      step "User clicks on humburg bth" do
        check_element_path :css  , CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end
    end

    scenario 'Recording Debug', rec_debug: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end
    end

    scenario 'Searching Debug', search_debug: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end
    end
  end
end