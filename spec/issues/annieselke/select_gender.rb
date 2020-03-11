require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/annieselke_mobile'

include ElementSearchValidation

it =  AnnieselkeMobile.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'AT-11 Annie Selke - gender issue' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      it.close_modal

      step "hamburger menu " do
        it.click_hamburger_menu
      end

      step "User clicks on login button" do
        sleep 3
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

      step "User clicks on hamburger menu" do
        it.click_hamburger_menu
      end

      step "User clicks on My Account link" do
        it.click_my_acc_btn
      end

      # sleep 5

      step "User clicks on personal info button" do
        it.click_personal_info_btn :il
      end

      step "User clicks to select gender", 'Mr' do |gender|
        it.select_gender(gender)
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      it.close_modal

      step "hamburger menu " do
        check_element_path :xpath, AnnieselkeMobile::HAMBURGER_MENU_TA, AnnieselkeMobile::HAMBURGER_MENU_IL
        it.click_hamburger_menu
      end

      step "User clicks on login button" do
        check_element_path :xpath, AnnieselkeMobile::LOGIN_BTN_TA, AnnieselkeMobile::LOGIN_BTN_IL
        sleep 3
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

      step "User clicks on hamburger menu" do
        check_element_path :xpath, AnnieselkeMobile::HAMBURGER_MENU_TA, AnnieselkeMobile::HAMBURGER_MENU_IL
        it.click_hamburger_menu
      end

      step "User clicks on My Account link" do
        check_element_path :xpath, AnnieselkeMobile::MY_ACCOUNT_TA, AnnieselkeMobile::MY_ACCOUNT_IL
        it.click_my_acc_btn
      end

      sleep 3

      step "User clicks on personal info button" do
        check_element_path :xpath, AnnieselkeMobile::PERSONAL_DETEILS_TA, AnnieselkeMobile::PERSONAL_DETEILS_IL
        it.click_personal_info_btn
      end

      step "User clicks to select gender", "Mr" do |gender|
        check_element_path :xpath,  AnnieselkeMobile::GENDER_TA, AnnieselkeMobile::GENDER_IL
        it.select_gender(gender)
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do


    step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      it.close_modal

      step "hamburger menu " do
        check_element_path :xpath, AnnieselkeMobile::HAMBURGER_MENU_EP, AnnieselkeMobile::HAMBURGER_MENU_IL
        it.click_hamburger_menu :ep
      end

      step "User clicks on login button" do
        check_element_path :xpath, AnnieselkeMobile::LOGIN_BTN_TA, AnnieselkeMobile::LOGIN_BTN_IL
        sleep 3
        it.login_btn :ep
      end

      step "User set email" do
        check_element_path :xpath, AnnieselkeMobile::EMAIL_TA, AnnieselkeMobile::EMAIL_IL
        it.set_email :ep
      end
      #
      step "User set password" do
        check_element_path :xpath, AnnieselkeMobile::PASS_TA, AnnieselkeMobile::PASS_IL
        it.set_pass :ep
      end

      step "User clicks on login button" do
        check_element_path :xpath, AnnieselkeMobile::LOGIN_TA, AnnieselkeMobile::LOGIN_IL
        it.click_login_btn :ep
      end

      step "User clicks on hamburger menu" do
        check_element_path :xpath, AnnieselkeMobile::HAMBURGER_MENU_TA, AnnieselkeMobile::HAMBURGER_MENU_IL
        it.click_hamburger_menu :ep
      end

      step "User clicks on My Account link" do
        check_element_path :xpath, AnnieselkeMobile::MY_ACCOUNT_TA, AnnieselkeMobile::MY_ACCOUNT_IL
        it.click_my_acc_btn :ep
      end

      sleep 3

      step "User clicks on personal info button" do
        check_element_path :xpath, AnnieselkeMobile::PERSONAL_DETEILS_TA, AnnieselkeMobile::PERSONAL_DETEILS_IL
        it.click_personal_info_btn :ep
      end

      step "User clicks to select gender", "Mr" do |gender|
        check_element_path :xpath,  AnnieselkeMobile::GENDER_TA, AnnieselkeMobile::GENDER_IL
        it.select_gender(:ep, gender)
      end
    end

    scenario 'Recording Debug', rec_debug: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      it.close_modal

      step "hamburger menu " do
        it.click_hamburger_menu :il
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

      step "User clicks on hamburger menu" do
        it.click_hamburger_menu :il
      end

      step "User clicks on My Account link" do
        it.click_my_acc_btn :il
      end

      sleep 3

      step "User clicks on personal info button" do
        it.click_personal_info_btn :il
      end

      step "User clicks to select gender", 'Mr' do |gender|
        it.select_gender(gender)
      end
    end

    scenario 'Search Debug', search_debug: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      it.close_modal

      step "hamburger menu " do
        it.click_hamburger_menu :il
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

      step "User clicks on hamburger menu" do
        it.click_hamburger_menu :il
      end

      step "User clicks on My Account link" do
        it.click_my_acc_btn :il
      end

      sleep 3

      step "User clicks on personal info button" do
        it.click_personal_info_btn :il
      end

      step "User clicks to select gender", 'Mr' do |gender|
        it.select_gender(gender)
      end
    end
  end
end