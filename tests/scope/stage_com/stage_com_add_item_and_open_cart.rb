require 'spec_helper'
require_relative '../../helpers/rs/special_methods'
require_relative '../../pages/united_methods'
require_relative '../../pages/stage_com'

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature '' do

  # Initial locators with Recording

    scenario 'Recording IL', ili_run: true do

      step "User goes to the page", settings('stage_com')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        click_humburger_menu
      end

      step "User clicks on signin link" do
        click_signin_link
      end
      close_modal

      step "User set  account email" , settings('stage_com')['email'] do |email|
        click_account_email email
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stage_com')['pass'] do |password|
        click_pass password
      end

      step "User clicks on signin btn" do
        click_signin_btn
      end

      # User clicks on close button for close modal
      close_modal_rewards

      step "User clicks on logo" do
        click_logo
      end
      step "User clicks on minicart" do
        click_minicart
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
        check_element_path @humburger_menu_ta, @humburger_menu_il
        click_humburger_menu
      end

      step "User clicks on signin link" do
        check_element_path @signin_link_ta, @signin_link_il
        click_signin_link
      end
      close_modal

      step "User set  account email" , settings('stage_com')['email'] do |email|
        check_element_path @account_email_ta, @account_email_il
        click_account_email email
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stage_com')['pass'] do |password|
        check_element_path @pass_ta, @pass_il
        click_pass password
      end

      step "User clicks on signin btn" do
        check_element_path @signin_btn_ta, @signin_btn_il
        click_signin_btn
      end

      # User clicks on close button for close modal
      close_modal_rewards

      step "User clicks on logo" do
        check_element_path @logo_ta, @logo_il
        click_logo
      end
      step "User clicks on minicart" do
        check_element_path @minicart_ta, @minicart_il
        click_minicart
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
        check_element_path @humburger_menu_ep, @humburger_menu_il
        click_humburger_menu :ep
      end

      step "User clicks on signin link" do
        check_element_path @signin_link_ep, @signin_link_il
        click_signin_link :ep
      end
      close_modal

      step "User set  account email" , settings('stage_com')['email'] do |email|
        check_element_path @account_email_ep, @account_email_il
        click_account_email email, :ep
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stage_com')['pass'] do |password|
        check_element_path @pass_ep, @pass_il
        click_pass password, :ep
      end

      step "User clicks on signin btn" do
        check_element_path @signin_btn_ep, @signin_btn_il
        click_signin_btn :ep
      end

      # User clicks on close button for close modal
      close_modal_rewards

      step "User clicks on logo" do
        check_element_path @logo_ep, @logo_il
        click_logo :ep
      end
      step "User clicks on minicart" do
        check_element_path @minicart_ep, @minicart_il
        click_minicart :ep
      end
      sleep 5

    end

  end
end
