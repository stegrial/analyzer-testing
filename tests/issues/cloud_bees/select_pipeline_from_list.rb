require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
pipelines_page = CloudBeesPipelines.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'AT-39 Cloud Bees - selecting pipeline from list' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin does login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field credentials['username']
        login_page.fill_pass_field credentials['pass']
        login_page.click_sign_in_button
      end

      step "User clicks on hamburger bth" do
        global_page.click_hamburger_menu
      end

      step "User clicks on pipelines link" do
        global_page.click_pipelines
      end

      step "User clicks on pipeline to select" do
        pipelines_page.choose_pipeline_ta866_from_list
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin does login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "User clicks on humburg bth" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end

      step "User clicks on pipelines link" do
        check_element_path :css, CloudBeesGlobal::PIPELINES_SECTION_TA, CloudBeesGlobal::PIPELINES_SECTION_IL
        global_page.click_pipelines
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBeesPipelines::CHOOSE_PIPELINE_TA866_TA, CloudBeesPipelines::CHOOSE_PIPELINE_TA866_IL
        pipelines_page.choose_pipeline_ta866_from_list
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin does login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_EP, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_EP, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end

      step "User clicks on pipelines link" do
        check_element_path :xpath, CloudBeesGlobal::PIPELINES_SECTION_EP, CloudBeesGlobal::PIPELINES_SECTION_IL
        global_page.click_pipelines :ep
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBeesPipelines::CHOOSE_PIPELINE_TA866_EP, CloudBeesPipelines::CHOOSE_PIPELINE_TA866_IL
        pipelines_page.choose_pipeline_ta866_from_list :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do

      step "User goes to the main page and authorized into it", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin does login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "User clicks on humburg bth" do
        global_page.click_hamburger_menu :il
      end

      step "User clicks on pipelines link" do
        global_page.click_pipelines :il
      end

      step "User clicks on pipeline to select" do
        pipelines_page.choose_pipeline_ta866_from_list
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do

      step "User goes to the main page and authorized into it", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin does login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "User clicks on humburg bth" do
        global_page.click_hamburger_menu :il
      end

      step "User clicks on pipelines link" do
        global_page.click_pipelines :il
      end

      step "User clicks on pipeline to select" do
        pipelines_page.choose_pipeline_ta866_from_list
      end

      sleep 3
    end

  end
end