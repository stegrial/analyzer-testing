require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/planetblue/*.rb"

include ElementSearchValidation

menu = Menu.new
login = Login.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = { :deviceName => 'iPhone 5' }
  end


  feature 'Planet Blue - Login' do

    scenario 'Recording Locators', record: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Menu Button" do
        menu.click_menu_button
      end

      step "User clicks User Account Button" do
        menu.click_user_button
      end

      step "User fills EMAIL, PASSWORD Fields and clicks 'Login' Button",
           settings('planetblue')['email'],
           settings('planetblue')['pass'] do |email, password|
        page.execute_script "window.scrollBy(0,400)"
        login.fill_email_field email
        login.fill_password_field password
        login.click_sign_in_button
      end

    end

    scenario 'Searching Locators', search: true do

      step "User goes to the page", settings('planetblue')['page'] do |url|
        page.visit url
      end

      step "User clicks Menu Button" do
        check_element_path :css, menu.MENU_BUTTON_TA, menu.MENU_BUTTON_IL
        menu.click_menu_button :ta
      end

      step "User clicks User Account Button" do
        check_element_path :css, menu.MENU_USER_BUTTON_TA, menu.MENU_USER_BUTTON_IL
        menu.click_user_button :ta
      end

      step "User fills EMAIL, PASSWORD Fields and clicks 'Sign In' Button",
           settings('planetblue')['email'],
           settings('planetblue')['pass'] do |email, password|

        page.execute_script "window.scrollBy(0,400)"

        check_element_path :css, login.EMAIL_FIELD_TA, login.EMAIL_FIELD_IL
        check_element_path :css, login.PASSWORD_FIELD_TA, login.PASSWORD_FIELD_IL
        check_element_path :css, login.SIGN_IN_BUTTON_TA, login.SIGN_IN_BUTTON_IL

        login.fill_email_field :ta, email
        login.fill_password_field :ta, password
        login.click_sign_in_button :ta
      end

    end

  end
end