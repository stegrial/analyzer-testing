require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/annieselke_mobile'

it =  AnnieselkeMobile.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-927 Annie Selke - gender issue' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      it.close_modal

      step "humburger menu " do
        it.click_humburger_menu :il
      end

      step "User clicks on login button" do
        sleep 3
        it.login_btn :il
      end

      step "User set email" do
        it.set_email :il
      end

      step "User set password" do
        it.set_pass :il
      end

      step "User clicks on login button" do
        it.click_login_btn :il
      end

      step "User clicks on humburger menu" do
        it.click_humburger_menu :il
      end

      step "User clicks on My Account link" do
        it.click_my_acc_btn :il
      end

      # sleep 5

      step "User clicks on personal info button" do
        it.click_personal_info_btn :il
      end

      step "User clicks to select gender", 'Mr' do |gender|
        it.select_gender(gender)
      end

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      it.close_modal

      step "humburger menu " do
        # check_element_path :xpath, AnnieselkeMobile::HUMBURGER_MENU_TA, AnnieselkeMobile::HUMBURGER_MENU_IL
        it.click_humburger_menu :il
      end

      step "User clicks on login button" do
        # check_element_path :xpath, AnnieselkeMobile::LOGIN_BTN_TA, AnnieselkeMobile::LOGIN_BTN_IL
        sleep 3
        it.login_btn :il
      end

      step "User set email" do
        # check_element_path :xpath, AnnieselkeMobile::EMAIL_TA, AnnieselkeMobile::EMAIL_IL
        it.set_email :il
      end
      #
      step "User set password" do
        # check_element_path :xpath, AnnieselkeMobile::PASS_TA, AnnieselkeMobile::PASS_IL
        it.set_pass :il
      end

      step "User clicks on login button" do
        # check_element_path :xpath, AnnieselkeMobile::LOGIN_TA, AnnieselkeMobile::LOGIN_IL
        it.click_login_btn :il
      end

      step "User clicks on humburger menu" do
        # check_element_path :xpath, AnnieselkeMobile::HUMBURGER_MENU_TA, AnnieselkeMobile::HUMBURGER_MENU_IL
        it.click_humburger_menu :il
      end

      step "User clicks on My Account link" do
        # check_element_path :xpath, AnnieselkeMobile::MY_ACCOUNT_TA, AnnieselkeMobile::MY_ACCOUNT_IL
        it.click_my_acc_btn :il
      end

      sleep 3

      step "User clicks on personal info button" do
        # check_element_path :xpath, AnnieselkeMobile::PERSONAL_DETEILS_TA, AnnieselkeMobile::PERSONAL_DETEILS_IL
        it.click_personal_info_btn :il
      end

      step "User clicks to select gender", "Mr" do |gender|
        # check_element_path :xpath,  AnnieselkeMobile::GENDER_TA, AnnieselkeMobile::GENDER_IL
        it.select_gender(gender)
      end
    end
  end
end