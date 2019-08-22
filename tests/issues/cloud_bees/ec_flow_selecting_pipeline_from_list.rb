require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/cloud_bees_pages/global'

it = CloudBeesGlobal.new

# This tests runs when the vpn is ON

describe 'Preconditions' do

    before(:all) do
      $caps_chrome['chromeOptions'].delete('mobileEmulation')
    end

    after(:all) do
      Capybara.current_session.driver.quit
    end
  feature 'TA-866 EC Flow - selecting pipeline from list' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |username|
        it.fill_username_field(username)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |pass|
        it.fill_pass_field(pass)
      end

      step "User clicks on login bth" do
        it.click_sign_in_button
      end

      step "User clicks on humburg bth" do
        it.click_hamburger_menu
      end

      step "User clicks on pipelines link" do
        it.click_pipelines
      end

      step "User clicks on pipeline to select" do
        it.choose_pipeline_from_list
      end
    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |username|
        check_element_path :xpath, CloudBeesGlobal::USERNAME_FIELD_TA, CloudBeesGlobal::USERNAME_FIELD_IL
        it.fill_username_field(username)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |pass|
        check_element_path :xpath, CloudBeesGlobal::PASSWORD_FIELD_TA, CloudBeesGlobal::PASSWORD_FIELD_IL
        it.fill_pass_field(pass)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, CloudBeesGlobal::SIGN_IN_BTN_TA, CloudBeesGlobal::SIGN_IN_BTN_IL
        it.click_sign_in_button
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        it.click_hamburger_menu
      end

      step "User clicks on pipelines link" do
        check_element_path :xpath, CloudBeesGlobal::PIPELINES_SECTION_TA, CloudBeesGlobal::PIPELINES_SECTION_IL
        it.click_pipelines
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBeesGlobal::CHOOSE_PIPELINE_TA, CloudBeesGlobal::CHOOSE_PIPELINE_IL
        it.choose_pipeline_from_list
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |username|
        check_element_path :xpath, CloudBeesGlobal::USERNAME_FIELD_EP, CloudBeesGlobal::USERNAME_FIELD_IL
        it.fill_username_field(:ep, username)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |pass|
        check_element_path :xpath, CloudBeesGlobal::PASSWORD_FIELD_EP, CloudBeesGlobal::PASSWORD_FIELD_IL
        it.fill_pass_field(:ep,pass)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, CloudBeesGlobal::SIGN_IN_BTN_EP, CloudBeesGlobal::SIGN_IN_BTN_IL
        it.click_sign_in_button :ep
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        it.click_hamburger_menu :ep
      end

      step "User clicks on pipelines link" do
        check_element_path :xpath, CloudBeesGlobal::PIPELINES_SECTION_EP, CloudBeesGlobal::PIPELINES_SECTION_IL
        it.click_pipelines :ep
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBeesGlobal::CHOOSE_PIPELINE_EP, CloudBeesGlobal::CHOOSE_PIPELINE_IL
        it.choose_pipeline_from_list :ep
      end
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |username|
        it.fill_username_field(:il, username)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |pass|
        it.fill_pass_field(:il,pass)
      end

      step "User clicks on login bth" do
        it.click_sign_in_button :il
      end

      step "User clicks on humburg bth" do
        it.click_hamburger_menu :il
      end

      step "User clicks on pipelines link" do
        it.click_pipelines :il
      end

      step "User clicks on pipeline to select" do
        it.choose_pipeline_from_list
      end
    end

    scenario 'Searching debug', search_debug: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |username|
        it.fill_username_field(:il, username)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |pass|
        it.fill_pass_field(:il,pass)
      end

      step "User clicks on login bth" do
        it.click_sign_in_button :il
      end

      step "User clicks on humburg bth" do
        it.click_hamburger_menu :il
      end

      step "User clicks on pipelines link" do
        it.click_pipelines :il
      end

      step "User clicks on pipeline to select" do
        it.choose_pipeline_from_list
      end
    end
  end
end