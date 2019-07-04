require 'spec_helper'
require_relative '../../pages/annieselke_mobile.rb'
require_relative '../../helpers/special_methods'

include AnnieSelkeMobile

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature 'TA-911 Element not found when the Dom tree is changed (the Login link)' do

  # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "humburger menu " do
        click_humburger_menu
      end

      step "User clicks on login button" do
        login_btn
      end

      step "User set email" do
        set_email
      end

      step "User set password" do
        set_pass
      end

      step "User clicks on login button" do
        click_login_btn
      end

      step "User clicks on humburger menu" do
        click_humburger_menu
      end

      step "User clicks on My Account link" do
        click_my_acc_btn
      end

      sleep 5

      step "User clicks on personal info button" do
        click_personal_info_btn
      end

      step "User clicks to select gender" do
        select_gender
      end

      step "User clicks to select gender" do
        click_save_btn
      end
      sleep 5

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "humburger menu " do
        click_humburger_menu
        check_element_path @humburger_menu_ta, @humburger_menu_il
      end

      step "User clicks on login button" do
        login_btn
        check_element_path @login_btn_ta, @login_btn_il
      end

      # sleep 500

      step "User set email" do
        set_email
        check_element_path @email_ta, @email_il
      end
      #
      step "User set password" do
        set_pass
        check_element_path @pass_ta, @pass_il
      end

      step "User clicks on login button" do
        click_login_btn
        check_element_path @login_ta, @login_il
      end

      step "User clicks on humburger menu" do
        click_humburger_menu
        check_element_path @humburger_menu_ta, @humburger_menu_il
      end

      step "User clicks on My Account link" do
        click_my_acc_btn
        check_element_path @myAccount_ta, @myAccount_il
      end

      sleep 5

      step "User clicks on personal info button" do
        click_personal_info_btn
        check_element_path @personal_deteils_ta, @personal_deteils_il
      end

      step "User clicks to select gender" do
        select_gender
        check_element_path @gender_ta, @gender_il
      end

      step "User clicks to select gender" do
        click_save_btn
        check_element_path @save_btn_ta, @save_btn_il
      end
      sleep 5


    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "humburger menu " do
        ep_click_humburger_menu
      end

      step "User clicks on login button" do
        ep_login_btn
      end

      step "User set email" do
        ep_set_email
      end

      step "User set password" do
        ep_set_pass
      end

      step "User clicks on login button" do
        ep_click_login_btn
      end

      step "User clicks on humburger menu" do
        ep_click_humburger_menu
      end

      step "User clicks on My Account link" do
        ep_click_my_acc_btn
      end

      sleep 5

      step "User clicks on personal info button" do
        ep_click_personal_info_btn
      end

      step "User clicks to select gender" do
        ep_select_gender
      end

      step "User clicks to select gender" do
        ep_click_save_btn
      end
      sleep 5
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "humburger menu " do
        click_humburger_menu
      end

      step "User clicks on login button" do
        login_btn
      end

      step "User set email" do
        set_email
      end

      step "User set password" do
        set_pass
      end

      step "User clicks on login button" do
        click_login_btn
      end

      step "User clicks on humburger menu" do
        click_humburger_menu
      end

      step "User clicks on My Account link" do
        click_my_acc_btn
      end

      sleep 5

      step "User clicks on personal info button" do
        click_personal_info_btn
      end

      step "User clicks to select gender" do
        select_gender
      end

      step "User clicks to select gender" do
        click_save_btn
      end
      sleep 5
    end

    scenario 'Searching debug', search_debug: true do

      step "User goes to the page", settings('annieselke')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "humburger menu " do
        click_humburger_menu
      end

      step "User clicks on login button" do
        login_btn
      end

      step "User set email" do
        set_email
      end

      step "User set password" do
        set_pass
      end

      step "User clicks on login button" do
        click_login_btn
      end

      step "User clicks on humburger menu" do
        click_humburger_menu
      end

      step "User clicks on My Account link" do
        click_my_acc_btn
      end

      sleep 5

      step "User clicks on personal info button" do
        click_personal_info_btn
      end

      step "User clicks to select gender" do
        select_gender
      end

      step "User clicks to select gender" do
        click_save_btn
      end
      sleep 5
    end
  end
end