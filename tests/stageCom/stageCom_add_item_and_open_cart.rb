require 'spec_helper'
require_relative '../../pages/united_methods'
require_relative '../../pages/stage_com.rb'
require_relative '../../helpers/special_methods'

include PathCheck
include StageCom
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature '' do

  # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('stageCom')['page'] do |url|
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

      step "User set  account email" , settings('stageCom')['email'] do |email|
        click_account_email email
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stageCom')['pass'] do |password|
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

      step "User goes to the page", settings('stageCom')['page'] do |url|
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

      step "User set  account email" , settings('stageCom')['email'] do |email|
        check_element_path @account_email_ta, @account_email_il
        click_account_email email
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stageCom')['pass'] do |password|
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
    #
    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('stageCom')['page'] do |url|
        page.visit url
      end

      # User clicks on close button for close modal
      close_modal

      step "User clicks on humburger menu" do
        check_element_path @humburger_menu_ep, @humburger_menu_il
        click_humburger_menu true
      end

      step "User clicks on signin link" do
        check_element_path @signin_link_ep, @signin_link_il
        click_signin_link true
      end
      close_modal

      step "User set  account email" , settings('stageCom')['email'] do |email|
        check_element_path @account_email_ep, @account_email_il
        click_account_email email, true
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stageCom')['pass'] do |password|
        check_element_path @pass_ep, @pass_il
        click_pass password, true
      end

      step "User clicks on signin btn" do
        check_element_path @signin_btn_ep, @signin_btn_il
        click_signin_btn true
      end

      # User clicks on close button for close modal
      close_modal_rewards true

      step "User clicks on logo" do
        check_element_path @logo_ep, @logo_il
        click_logo true
      end
      step "User clicks on minicart" do
        check_element_path @minicart_ep, @minicart_il
        click_minicart true
      end
      sleep 5

    end

    # Debug

    scenario 'Recording debug', rec_debug: true do


      step "User goes to the page", settings('stageCom')['page'] do |url|
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

      step "User set  account email" , settings('stageCom')['email'] do |email|
        click_account_email email
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stageCom')['pass'] do |password|
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


    end

    scenario 'Searching debug', search_debug: true do

      step "User goes to the page", settings('stageCom')['page'] do |url|
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

      step "User set  account email" , settings('stageCom')['email'] do |email|
        click_account_email email
      end
      # User clicks on close button for close modal

      step "User set paass ", settings('stageCom')['pass'] do |password|
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
  end
end
