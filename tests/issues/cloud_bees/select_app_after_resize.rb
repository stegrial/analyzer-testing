require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
apps_page = CloudBeesApps.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800) # reproduce on desktop display
    #Capybara.page.driver.browser.manage.window.resize_to(1920, 1080) # reproduce on Full HD monitor
  end

  after(:each) do
    step "Remove created application", settings('cloud_bees') do |data|
      page.visit data['pipelines_page']
      page.visit data['applications_page']
      apps_page.find_application_name_field :il, data['app_name']
      apps_page.select_app_list_item :il
      apps_page.delete_application :il
      apps_page.confirm_delete_application :il
    end
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'AT-57, AT-66, TA Analyzer returns the wrong element on the page (Cloud Bees - Application list item)' do

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

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        global_page.click_applications
      end

      step "Admin clicks on the new application button" do
        apps_page.click_new_application
      end

      step "Admin clicks on the create new application button" do
        apps_page.create_new_application
      end

      step "Admin fills the application name field", settings('cloud_bees')['app_name'] do |appname|
        apps_page.fill_application_name_field appname
      end

      step "Admin clicks on the Select project drop-down" do
        apps_page.click_on_select_project
      end

      step "Admin select on the drop-down Default project" do
        apps_page.select_default_project
      end

      step "Admin confirm new application" do
        apps_page.confirm_create_new_application
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        global_page.click_applications
      end

      step "Admin find application name", settings('cloud_bees')['app_name'] do |appname|
        apps_page.find_application_name_field appname
        sleep 3 #to wait for filter to be apply
      end

      step "Admin clicks on new created application" do
        apps_page.select_app_list_item
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_TA, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications
      end

      step "Admin clicks on the new application button" do
        check_element_path :xpath, CloudBeesApps::NEW_APPLICATION_BTN_TA, CloudBeesApps::NEW_APPLICATION_BTN_IL
        apps_page.click_new_application
      end

      step "Admin clicks on the create new application button" do
        check_element_path :xpath, CloudBeesApps::CREATE_NEW_APPLICATION_TA, CloudBeesApps::CREATE_NEW_APPLICATION_IL
        apps_page.create_new_application
      end

      step "Admin fills the application name field", settings('cloud_bees')['app_name'] do |appname|
        check_element_path :xpath, CloudBeesApps::APPLICATION_NAME_TA, CloudBeesApps::APPLICATION_NAME_IL
        apps_page.fill_application_name_field appname
      end

      step "Admin clicks on the Select project drop-down" do
        check_element_path :xpath, CloudBeesApps::SELECT_PROJECT_TA, CloudBeesApps::SELECT_PROJECT_IL
        apps_page.click_on_select_project
      end

      step "Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesApps::SELECT_DEFAULT_PROJECT_TA, CloudBeesApps::SELECT_DEFAULT_PROJECT_IL
        apps_page.select_default_project
      end

      step "Admin confirm new application" do
        check_element_path :xpath, CloudBeesApps::CONFIRM_NEW_APPLICATION_TA, CloudBeesApps::CONFIRM_NEW_APPLICATION_IL
        apps_page.confirm_create_new_application
      end

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_TA, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications
      end

      step "Admin resize window browser" do
        Capybara.page.driver.browser.manage.window.maximize # reproduce on desktop display
        #Capybara.page.driver.browser.manage.window.resize_to(1440, 800) # reproduce on Full HD monitor
        sleep 3 #to wait for page loaded
      end

      step "Admin find application name", settings('cloud_bees')['app_name'] do |appname|
        check_element_path :css, CloudBeesApps::FIND_APPLICATION_FIELD_TA, CloudBeesApps::FIND_APPLICATION_FIELD_IL
        apps_page.find_application_name_field appname
        sleep 3 #to wait for filter to be apply
      end

      step "Admin clicks on new created application" do
        check_element_path :css, CloudBeesApps::APPLICATION_LIST_ITEM_TA, CloudBeesApps::APPLICATION_LIST_ITEM_IL
        apps_page.select_app_list_item
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
        login_page.fill_username_field :ep, credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_EP, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field :ep, credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_EP, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
      end

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_EP, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications :ep
      end

      step "Admin clicks on the new application button" do
        check_element_path :xpath, CloudBeesApps::NEW_APPLICATION_BTN_EP, CloudBeesApps::NEW_APPLICATION_BTN_IL
        apps_page.click_new_application :ep
      end

      step "Admin clicks on the create new application button" do
        check_element_path :xpath, CloudBeesApps::CREATE_NEW_APPLICATION_EP, CloudBeesApps::CREATE_NEW_APPLICATION_IL
        apps_page.create_new_application :ep
      end

      step "Admin fills the application name field", settings('cloud_bees')['app_name'] do |appname|
        check_element_path :xpath, CloudBeesApps::APPLICATION_NAME_EP, CloudBeesApps::APPLICATION_NAME_IL
        apps_page.fill_application_name_field :ep, appname
      end

      step "Admin clicks on the Select project drop-down" do
        check_element_path :xpath, CloudBeesApps::SELECT_PROJECT_EP, CloudBeesApps::SELECT_PROJECT_IL
        apps_page.click_on_select_project :ep
      end

      step "Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesApps::SELECT_DEFAULT_PROJECT_EP, CloudBeesApps::SELECT_DEFAULT_PROJECT_IL
        apps_page.select_default_project :ep
      end

      step "Admin confirm new application" do
        check_element_path :xpath, CloudBeesApps::CONFIRM_NEW_APPLICATION_EP, CloudBeesApps::CONFIRM_NEW_APPLICATION_IL
        apps_page.confirm_create_new_application :ep
      end

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::APPS_SECTION_EP, CloudBeesGlobal::APPS_SECTION_IL
        global_page.click_applications :ep
      end

      # step "Admin resize window browser" do
      #   Capybara.page.driver.browser.manage.window.maximize
      # end

      step "Admin find application name", settings('cloud_bees')['app_name'] do |appname|
        check_element_path :css, CloudBeesApps::FIND_APPLICATION_FIELD_EP, CloudBeesApps::FIND_APPLICATION_FIELD_IL
        apps_page.find_application_name_field :ep, appname
        sleep 3 #to wait for filter to be apply
      end

      step "Admin clicks on new created application" do
        check_element_path :css, CloudBeesApps::APPLICATION_LIST_ITEM_EP, CloudBeesApps::APPLICATION_LIST_ITEM_IL
        apps_page.select_app_list_item :ep
      end

      sleep 3
    end

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu :il
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        global_page.click_applications :il
      end

      step "Admin clicks on the new application button" do
        apps_page.click_new_application :il
      end

      step "Admin clicks on the create new application button" do
        apps_page.create_new_application :il
      end

      step "Admin fills the application name field", settings('cloud_bees')['app_name'] do |appname|
        apps_page.fill_application_name_field :il, appname
      end

      step "Admin clicks on the Select project drop-down" do
        apps_page.click_on_select_project :il
      end

      step "Admin select on the drop-down Default project" do
        apps_page.select_default_project :il
      end

      step "Admin confirm new application" do
        apps_page.confirm_create_new_application :il
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu :il
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        global_page.click_applications :il
      end

      step "Admin find application name", settings('cloud_bees')['app_name'] do |appname|
        apps_page.find_application_name_field :il, appname
      end

      step "Admin clicks on new created application" do
        apps_page.select_app_list_item
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu :il
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        global_page.click_applications :il
      end

      step "Admin clicks on the new application button" do
        apps_page.click_new_application :il
      end

      step "Admin clicks on the create new application button" do
        apps_page.create_new_application :il
      end

      step "Admin fills the application name field", settings('cloud_bees')['app_name'] do |appname|
        apps_page.fill_application_name_field :il, appname
      end

      step "Admin clicks on the Select project drop-down" do
        apps_page.click_on_select_project :il
      end

      step "Admin select on the drop-down Default project" do
        apps_page.select_default_project :il
      end

      step "Admin confirm new application" do
        apps_page.confirm_create_new_application :il
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu :il
      end

      step "Admin chooses the Applications section in the Hamburger menu" do
        global_page.click_applications :il
      end

      step "Admin resize window browser" do
        Capybara.page.driver.browser.manage.window.maximize # reproduce on desktop display
        #Capybara.page.driver.browser.manage.window.resize_to(1440, 800) # reproduce on Full HD monitor
      end

      step "Admin find application name", settings('cloud_bees')['app_name'] do |appname|
        apps_page.find_application_name_field :il, appname
        sleep 3 #to wait for filter to be apply
      end

      step "Admin clicks on new created application" do
        apps_page.select_app_list_item
      end

      sleep 3
    end

  end
end