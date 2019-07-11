require 'spec_helper'
require_relative '../../helpers/rs/special_methods'
require_relative '../../pages/united_methods'
require_relative '../../pages/annieselke_mobile'

include AnnieSelkeMobile

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
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
        check_element_path @humburger_menu_ta, @humburger_menu_il
        click_humburger_menu
      end

      step "User clicks on login button" do
        check_element_path @login_btn_ta, @login_btn_il
        login_btn
      end

      step "User set email" do
        check_element_path @email_ta, @email_il
        set_email
      end
      #
      step "User set password" do
        check_element_path @pass_ta, @pass_il
        set_pass
      end

      step "User clicks on login button" do
        check_element_path @login_ta, @login_il
        click_login_btn
      end

      step "User clicks on humburger menu" do
        check_element_path @humburger_menu_ta, @humburger_menu_il
        click_humburger_menu
      end

      step "User clicks on My Account link" do
        check_element_path @myAccount_ta, @myAccount_il
        click_my_acc_btn
      end

      sleep 5

      step "User clicks on personal info button" do
        check_element_path @personal_deteils_ta, @personal_deteils_il
        click_personal_info_btn
      end

      step "User clicks to select gender" do
        check_element_path @gender_ta, @gender_il
        select_gender
      end

      step "User clicks to select gender" do
        check_element_path @save_btn_ta, @save_btn_il
        click_save_btn
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
        check_element_path @humburger_menu_ep, @humburger_menu_il
        click_humburger_menu :ep
      end

      step "User clicks on login button" do
        check_element_path @login_btn_ep, @login_btn_il
        login_btn :ep
      end

      step "User set email" do
        check_element_path @email_ep, @email_il
        set_email :ep
      end
      #
      step "User set password" do
        check_element_path @pass_ep, @pass_il
        set_pass :ep
      end

      step "User clicks on login button" do
        check_element_path @login_ep, @login_il
        click_login_btn :ep
      end

      step "User clicks on humburger menu" do
        check_element_path @humburger_menu_ep, @humburger_menu_il
        click_humburger_menu :ep
      end

      step "User clicks on My Account link" do
        check_element_path @myAccount_ep, @myAccount_il
        click_my_acc_btn :ep
      end

      sleep 5

      step "User clicks on personal info button" do
        check_element_path @personal_deteils_ep, @personal_deteils_il
        click_personal_info_btn :ep
      end

      step "User clicks to select gender" do
        check_element_path @gender_ep, @gender_il
        select_gender :ep
      end

      step "User clicks to select gender" do
        check_element_path @save_btn_ep, @save_btn_il
        click_save_btn :ep
      end
      sleep 5
    end


  end
end
