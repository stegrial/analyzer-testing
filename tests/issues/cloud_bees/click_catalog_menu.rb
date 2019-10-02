require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
catalogs_page = CloudBeesCatalogs.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)

  end
  after(:each) do
    step "Remove created catalog", settings('cloud_bees') do |data|
      page.visit data['catalogs_page']
      sleep 3
      catalogs_page.click_all_catalogs :il
      catalogs_page.click_to_select_created_catalog :il, 'new_name_catalog'
      catalogs_page.select_created_catalog :il
      catalogs_page.click_editor_catalog :il
      catalogs_page.click_catalog_menu :il
      catalogs_page.click_delete_catalog
      catalogs_page.click_ok_btn_for_accept_delete :il

    end
  end

  after(:all) do
    delete_saved_elements
    Capybara.current_session.driver.quit
  end

  feature 'AT-82, CloudBees - clicking on catalog hamburger menu button' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field credentials['username']
        login_page.fill_pass_field credentials['pass']
        login_page.click_sign_in_button
      end

      step "User goes to the page", settings('cloud_bees')['catalogs_page'] do |url|
        page.visit url
      end

      step "User clicks to create new catalog" do
        catalogs_page.click_to_create_new_catalog
      end

      step "User clicks to create new button" do
        catalogs_page.click_to_create_new_btn
      end

      step "User set name new catalog", 'new_name_catalog' do |value|
        catalogs_page.set_catalog_name value
      end

      step "User clicks to open project dropdown of new catalog" do
        catalogs_page.click_to_open_proj_drpodown
      end

      step "User select default project from list" do
        catalogs_page.select_proj_from_list
      end

      step "User clicks ok button in modal" do
        catalogs_page.click_ok_in_modal_btn
      end

      step "User clicks on catalog hamburger menu button" do
        catalogs_page.click_catalog_menu
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field   credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field   credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "User goes to the page", settings('cloud_bees')['catalogs_page'] do |url|
        page.visit url
      end

      step "User clicks to create new catalog" do
        check_element_path :css, CloudBeesCatalogs::CREATE_NEW_CATALOG_TA, CloudBeesCatalogs::CREATE_NEW_CATALOG_IL
        catalogs_page.click_to_create_new_catalog
      end

      step "User clicks to create new button" do
        check_element_path :css, CloudBeesCatalogs::CREATE_NEW_BUTTON_TA, CloudBeesCatalogs::CREATE_NEW_BUTTON_IL
        catalogs_page.click_to_create_new_btn
      end

      step "User set name new catalog", 'new_name_catalog' do |value|
        check_element_path :css, CloudBeesCatalogs::CATALOGS_NAME_FLD_TA, CloudBeesCatalogs::CATALOGS_NAME_FLD_IL
        catalogs_page.set_catalog_name  value
      end

      step "User clicks to open project dropdown of new catalog" do
        check_element_path :css, CloudBeesCatalogs::PROJECT_DROPDOWN_TA, CloudBeesCatalogs::PROJECT_DROPDOWN_IL
        catalogs_page.click_to_open_proj_drpodown
      end

      step "User select default project from list" do
        check_element_path :xpath, CloudBeesCatalogs::DEFAULT_PROJECT_TA, CloudBeesCatalogs::DEFAULT_PROJECT_IL
        catalogs_page.select_proj_from_list
      end

      step "User clicks ok button in modal" do
        check_element_path :css, CloudBeesCatalogs::OK_IN_MODAL_BTN_TA, CloudBeesCatalogs::OK_IN_MODAL_BTN_IL
        catalogs_page.click_ok_in_modal_btn
      end

      step "User clicks on catalog hamburger menu button" do
        check_element_path :css, CloudBeesCatalogs::CATALOG_HAMBURGER_MENU_TA, CloudBeesCatalogs::CATALOG_HAMBURGER_MENU_IL
        catalogs_page.click_catalog_menu
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field :ep,  credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_EP, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field :ep, credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_EP, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
      end

      step "User goes to the page", settings('cloud_bees')['catalogs_page'] do |url|
        page.visit url
      end

      step "User clicks to create new catalog" do
        check_element_path :css, CloudBeesCatalogs::CREATE_NEW_CATALOG_EP, CloudBeesCatalogs::CREATE_NEW_CATALOG_IL
        catalogs_page.click_to_create_new_catalog :ep
      end

      step "User clicks to create new button" do
        check_element_path :css, CloudBeesCatalogs::CREATE_NEW_BUTTON_EP, CloudBeesCatalogs::CREATE_NEW_BUTTON_IL
        catalogs_page.click_to_create_new_btn :ep
      end

      step "User set name new catalog", 'new_name_catalog' do |value|
        check_element_path :css, CloudBeesCatalogs::CATALOGS_NAME_FLD_EP, CloudBeesCatalogs::CATALOGS_NAME_FLD_IL
        catalogs_page.set_catalog_name :ep, value
      end

      step "User clicks to open project dropdown of new catalog" do
        check_element_path :css, CloudBeesCatalogs::PROJECT_DROPDOWN_EP, CloudBeesCatalogs::PROJECT_DROPDOWN_IL
        catalogs_page.click_to_open_proj_drpodown :ep
      end

      step "User select default project from list" do
        check_element_path :xpath, CloudBeesCatalogs::DEFAULT_PROJECT_EP, CloudBeesCatalogs::DEFAULT_PROJECT_IL
        catalogs_page.select_proj_from_list :ep
      end

      step "User clicks ok button in modal" do
        check_element_path :css, CloudBeesCatalogs::OK_IN_MODAL_BTN_EP, CloudBeesCatalogs::OK_IN_MODAL_BTN_IL
        catalogs_page.click_ok_in_modal_btn :ep
      end

      step "User clicks on catalog hamburger menu button" do
        check_element_path :css, CloudBeesCatalogs::CATALOG_HAMBURGER_MENU_EP, CloudBeesCatalogs::CATALOG_HAMBURGER_MENU_IL
        catalogs_page.click_catalog_menu :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il,credentials['username']
        login_page.fill_pass_field :il,credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "User goes to the page", settings('cloud_bees')['catalogs_page'] do |url|
        page.visit url
      end

      step "User clicks to create new catalog" do
        catalogs_page.click_to_create_new_catalog :il
      end

      step "User clicks to create new button" do
        catalogs_page.click_to_create_new_btn :il
      end

      step "User set name new catalog", 'new_name_catalog' do |value|
        catalogs_page.set_catalog_name :il, value
      end

      step "User clicks to open project dropdown of new catalog" do
        catalogs_page.click_to_open_proj_drpodown :il
      end

      step "User select default project from list" do
        catalogs_page.select_proj_from_list :il
      end

      step "User clicks ok button in modal" do
        catalogs_page.click_ok_in_modal_btn :il
      end

      step "User clicks on catalog hamburger menu button" do
        catalogs_page.click_catalog_menu
      end
      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field  :il, credentials['username']
        login_page.fill_pass_field  :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "User goes to the page", settings('cloud_bees')['catalogs_page'] do |url|
        page.visit url
      end

      step "User clicks to create new catalog" do
        catalogs_page.click_to_create_new_catalog :il
      end

      step "User clicks to create new button" do
        catalogs_page.click_to_create_new_btn :il
      end

      step "User set name new catalog", 'new_name_catalog' do |value|
        catalogs_page.set_catalog_name :il, value
      end

      step "User clicks to open project dropdown of new catalog" do
        catalogs_page.click_to_open_proj_drpodown :il
      end

      step "User select default project from list" do
        catalogs_page.select_proj_from_list :il
      end

      step "User clicks ok button in modal" do
        catalogs_page.click_ok_in_modal_btn :il
      end

      step "User clicks on catalog hamburger menu button" do
        catalogs_page.click_catalog_menu
      end

      sleep 3
    end

  end
end