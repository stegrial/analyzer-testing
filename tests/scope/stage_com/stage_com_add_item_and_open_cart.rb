require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/stage_com'

it = Stagecom.new

# This tests runs when the vpn is ON

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Stagecom - adding item and open cart' do

  # Initial locators with Recording

    scenario 'Recording IL', ili_run: true do

      step "User goes to the page", settings('stage_com')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        it.click_humburger_menu
      end

      step "User clicks on signin link" do
        it.click_signin_link
      end
      close_modal

      step "User set  account email" , settings('stage_com')['email'] do |email|
        it.click_account_email email
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stage_com')['pass'] do |password|
        it.click_pass password
      end

      step "User clicks on signin btn" do
        it.click_signin_btn
      end

      # User clicks on close button for close modal
      close_modal_rewards

      step "User clicks on logo" do
        it.click_logo
      end
      step "User clicks on minicart" do
        it.click_minicart
      end
      sleep 5

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('stage_com')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        check_element_path :xpath, Stagecom::HUMBURGER_MENU_TA, Stagecom::HUMBURGER_MENU_IL
        it.click_humburger_menu
      end

      step "User clicks on signin link" do
        check_element_path :xpath, Stagecom::SIGNIN_LINK_TA, Stagecom::SIGNIN_LINK_IL
        it.click_signin_link
      end
      close_modal

      step "User set  account email" , settings('stage_com')['email'] do |email|
        check_element_path :xpath, Stagecom::ACCOUNT_EMAIL_TA, Stagecom::ACCOUNT_EMAIL_IL
        it.click_account_email email
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stage_com')['pass'] do |password|
        check_element_path :xpath, Stagecom::PASS_TA, Stagecom::PASS_IL
        it.click_pass password
      end

      step "User clicks on signin btn" do
        check_element_path :xpath, Stagecom::SIGNIN_BTN_TA, Stagecom::SIGNIN_BTN_IL
        it.click_signin_btn
      end

      # User clicks on close button for close modal
      close_modal_rewards

      step "User clicks on logo" do
        check_element_path :xpath, Stagecom::LOGO_TA, Stagecom::LOGO_IL
        it.click_logo
      end
      step "User clicks on minicart" do
        check_element_path :xpath, Stagecom::MINICART_TA, Stagecom::MINICART_IL
        it.click_minicart
      end
      sleep 5

    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('stage_com')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        check_element_path :xpath, Stagecom::HUMBURGER_MENU_TA, Stagecom::HUMBURGER_MENU_IL
        it.click_humburger_menu :ep
      end

      step "User clicks on signin link" do
        check_element_path :xpath, Stagecom::SIGNIN_LINK_TA, Stagecom::SIGNIN_LINK_IL
        it.click_signin_link :ep
      end
      close_modal

      step "User set  account email" , settings('stage_com')['email'] do |email|
        check_element_path :xpath, Stagecom::ACCOUNT_EMAIL_TA, Stagecom::ACCOUNT_EMAIL_IL
        it.click_account_email email, :ep
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stage_com')['pass'] do |password|
        check_element_path :xpath, Stagecom::PASS_TA, Stagecom::PASS_IL
        it.click_pass password, :ep
      end

      step "User clicks on signin btn" do
        check_element_path :xpath, Stagecom::SIGNIN_BTN_TA, Stagecom::SIGNIN_BTN_IL
        it.click_signin_btn :ep
      end

      # User clicks on close button for close modal
      close_modal_rewards

      step "User clicks on logo" do
        check_element_path :xpath, Stagecom::LOGO_TA, Stagecom::LOGO_IL
        it.click_logo :ep
      end
      step "User clicks on minicart" do
        check_element_path :xpath, Stagecom::MINICART_TA, Stagecom::MINICART_IL
        it.click_minicart :ep
      end
      sleep 5

    end

  end
end
