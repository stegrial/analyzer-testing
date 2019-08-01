require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/annieselke_mobile'

it =  AnnieselkeMobile.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end
  # Now it doesn't  work TA-927
  feature 'TA-927 Annie Selke - edit new account' do

  # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      it.close_modal

      step "humburger menu " do
        it.click_humburger_menu
      end

      step "User clicks on login button" do
        it.login_btn
      end

      step "User set email" do
        it.set_email
      end

      step "User set password" do
        it.set_pass
      end

      step "User clicks on login button" do
        it.click_login_btn
      end

      step "User clicks on humburger menu" do
        it.click_humburger_menu
      end

      step "User clicks on My Account link" do
        it.click_my_acc_btn
      end

      step "User clicks on personal info button" do
        sleep 5
        it.click_personal_info_btn
      end

      step "User clicks to select gender", 'Mr' do |gender|
        it.select_gender(gender)
      end

      step "User clicks to select gender" do
        it.click_save_btn
      end

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      it.close_modal

      step "humburger menu " do
        check_element_path :xpath, AnnieselkeMobile::HUMBURGER_MENU_TA, AnnieselkeMobile::HUMBURGER_MENU_IL
        it.click_humburger_menu
      end

      step "User clicks on login button" do
        check_element_path :xpath, AnnieselkeMobile::LOGIN_BTN_TA, AnnieselkeMobile::LOGIN_BTN_IL
        it.login_btn
      end

      step "User set email" do
        check_element_path :xpath, AnnieselkeMobile::EMAIL_TA, AnnieselkeMobile::EMAIL_IL
        it.set_email
      end
      #
      step "User set password" do
        check_element_path :xpath, AnnieselkeMobile::PASS_TA, AnnieselkeMobile::PASS_IL
        it.set_pass
      end

      step "User clicks on login button" do
        check_element_path :xpath, AnnieselkeMobile::LOGIN_TA, AnnieselkeMobile::LOGIN_IL
        it.click_login_btn
      end

      step "User clicks on humburger menu" do
        check_element_path :xpath, AnnieselkeMobile::HUMBURGER_MENU_TA, AnnieselkeMobile::HUMBURGER_MENU_IL
        it.click_humburger_menu
      end

      step "User clicks on My Account link" do
        check_element_path :xpath, AnnieselkeMobile::MY_ACCOUNT_TA, AnnieselkeMobile::MY_ACCOUNT_IL
        it.click_my_acc_btn
      end

      step "User clicks on personal info button" do
        check_element_path :xpath, AnnieselkeMobile::PERSONAL_DETEILS_TA, AnnieselkeMobile::PERSONAL_DETEILS_IL
        it.click_personal_info_btn
      end

      step "User clicks to select gender", "Mrs" do |gender|
       sleep 3
       check_element_path :xpath,  AnnieselkeMobile::GENDER_TA, AnnieselkeMobile::GENDER_IL
        it.select_gender(gender)
      end

      step "User clicks to select gender" do
        check_element_path :xpath, AnnieselkeMobile::SAVE_BTN_TA, AnnieselkeMobile::SAVE_BTN_IL
        it.click_save_btn
      end

    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      it.close_modal

      step "humburger menu " do
        check_element_path :xpath, AnnieselkeMobile::HUMBURGER_MENU_EP, AnnieselkeMobile::HUMBURGER_MENU_IL
        it.click_humburger_menu :ep
      end

      step "User clicks on login button" do
        check_element_path :xpath,AnnieselkeMobile::LOGIN_BTN_EP, AnnieselkeMobile::LOGIN_BTN_IL
        it.login_btn :ep
      end

      step "User set email" do
        check_element_path :xpath, AnnieselkeMobile::EMAIL_EP, AnnieselkeMobile::EMAIL_IL
        it.set_email :ep
      end
      #
      step "User set password" do
        check_element_path :xpath, AnnieselkeMobile::PASS_EP, AnnieselkeMobile::PASS_IL
        it.set_pass :ep
      end

      step "User clicks on login button" do
        check_element_path :xpath, AnnieselkeMobile::LOGIN_EP, AnnieselkeMobile::LOGIN_IL
        it.click_login_btn :ep
      end

      step "User clicks on humburger menu" do
        check_element_path :xpath, AnnieselkeMobile::HUMBURGER_MENU_EP, AnnieselkeMobile::HUMBURGER_MENU_IL
        it.click_humburger_menu :ep
      end

      step "User clicks on My Account link" do
        check_element_path :xpath, AnnieselkeMobile::MY_ACCOUNT_EP, AnnieselkeMobile::MY_ACCOUNT_IL
        it.click_my_acc_btn :ep
      end

      step "User clicks on personal info button" do
        check_element_path :xpath, AnnieselkeMobile::PERSONAL_DETEILS_EP, AnnieselkeMobile::PERSONAL_DETEILS_IL
        it.click_personal_info_btn :ep
      end

      step "User clicks to select gender", "Mr" do |gender|
        check_element_path :xpath, AnnieselkeMobile::GENDER_EP, AnnieselkeMobile::GENDER_IL
        it.select_gender(gender)
      end

      step "User clicks to select gender" do
        check_element_path :xpath, AnnieselkeMobile::SAVE_BTN_EP, AnnieselkeMobile::SAVE_BTN_IL
        it.click_save_btn :ep
      end
      sleep 5
    end

  end
end
