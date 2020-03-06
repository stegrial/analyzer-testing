require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
pipelines_page = CloudBeesPipelines.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'AT-6, Two scenarios: Wrong element found and NOT_FOUND response (Cloud Bees - Select default project)' do

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

      step "Admin chooses the Pipelines section in the Hamburger menu" do
        global_page.click_pipelines
      end

      step "Admin clicks on the new pipeline button" do
        pipelines_page.click_new_pipeline
      end

      step "Admin clicks on the create new pipeline button" do
        pipelines_page.create_new_pipeline
      end

      step "Admin fills the pipeline name field", settings('cloud_bees')['pipeline_name'] do |pipename|
        pipelines_page.fill_pipeline_name_field pipename
      end

      step "Admin clicks on the Select project drop-down" do
        pipelines_page.click_on_select_project
      end

      step "Admin select on the drop-down Default project" do
        pipelines_page.select_default_project
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

      step "Admin chooses the Pipelines section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::PIPELINES_SECTION_TA, CloudBeesGlobal::PIPELINES_SECTION_IL
        global_page.click_pipelines
      end

      step "Admin clicks on the new pipeline button" do
        check_element_path :xpath, CloudBeesPipelines::NEW_PIPELINE_BTN_TA, CloudBeesPipelines::NEW_PIPELINE_BTN_IL
        pipelines_page.click_new_pipeline
      end

      step "Admin clicks on the create new pipeline button" do
        check_element_path :xpath, CloudBeesPipelines::CREATE_NEW_PIPELINE_TA, CloudBeesPipelines::CREATE_NEW_PIPELINE_IL
        pipelines_page.create_new_pipeline
      end

      step "Admin fills the pipeline name field", settings('cloud_bees')['pipeline_name'] do |pipename|
        check_element_path :xpath, CloudBeesPipelines::PIPELINE_NAME_TA, CloudBeesPipelines::PIPELINE_NAME_IL
        pipelines_page.fill_pipeline_name_field pipename
      end

      step "AT-6, Admin does not see the Default project from Select dropdown list" do
        pipelines_page.check_no_default_project
      end

      step "Admin clicks on the Select project dropdown" do
        check_element_path :xpath, CloudBeesPipelines::SELECT_PROJECT_TA, CloudBeesPipelines::SELECT_PROJECT_IL
        pipelines_page.click_on_select_project

        sleep 2 # to wait for the dropdown is opened
      end

      step " AT-, Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesPipelines::SELECT_DEFAULT_PROJECT_TA, CloudBeesPipelines::SELECT_DEFAULT_PROJECT_IL
        pipelines_page.select_default_project
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP, Wrong element found when need element is not present on the page', ep: true do
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

      step "Admin chooses the Pipelines section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::PIPELINES_SECTION_EP, CloudBeesGlobal::PIPELINES_SECTION_IL
        global_page.click_pipelines :ep
      end

      step "Admin clicks on the new pipeline button" do
        check_element_path :xpath, CloudBeesPipelines::NEW_PIPELINE_BTN_EP, CloudBeesPipelines::NEW_PIPELINE_BTN_IL
        pipelines_page.click_new_pipeline :ep
      end

      step "Admin clicks on the create new pipeline button" do
        check_element_path :xpath, CloudBeesPipelines::CREATE_NEW_PIPELINE_EP, CloudBeesPipelines::CREATE_NEW_PIPELINE_IL
        pipelines_page.create_new_pipeline :ep
      end

      step "Admin fills the pipeline name field", settings('cloud_bees')['pipeline_name'] do |pipename|
        check_element_path :xpath, CloudBeesPipelines::PIPELINE_NAME_EP, CloudBeesPipelines::PIPELINE_NAME_IL
        pipelines_page.fill_pipeline_name_field :ep, pipename
      end

      step "AT-6, Admin does not see the Default project from Select dropdown list" do
        pipelines_page.check_no_default_project :ep
      end

      step "Admin clicks on the Select project dropdown" do
        check_element_path :xpath, CloudBeesPipelines::SELECT_PROJECT_EP, CloudBeesPipelines::SELECT_PROJECT_IL
        pipelines_page.click_on_select_project :ep

        sleep 2 # to wait for the dropdown is opened
      end

      step "AT-, Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesPipelines::SELECT_DEFAULT_PROJECT_EP, CloudBeesPipelines::SELECT_DEFAULT_PROJECT_IL
        pipelines_page.select_default_project :ep
      end

      sleep 3
    end

    # Debug

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

      step "Admin chooses the Pipelines section in the Hamburger menu" do
        global_page.click_pipelines :il
      end

      step "Admin clicks on the new pipeline button" do
        pipelines_page.click_new_pipeline :il
      end

      step "Admin clicks on the create new pipeline button" do
        pipelines_page.create_new_pipeline :il
      end

      step "Admin fills the pipeline name field", settings('cloud_bees')['pipeline_name'] do |pipename|
        pipelines_page.fill_pipeline_name_field :il, pipename
      end

      step "Admin clicks on the Select project drop-down" do
        pipelines_page.click_on_select_project :il
      end

      step "Admin select on the drop-down Default project" do
        pipelines_page.select_default_project
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

      step "Admin chooses the Pipelines section in the Hamburger menu" do
        global_page.click_pipelines :il
      end

      step "Admin clicks on the new pipeline button" do
        pipelines_page.click_new_pipeline :il
      end

      step "Admin clicks on the create new pipeline button" do
        pipelines_page.create_new_pipeline :il
      end

      step "Admin fills the pipeline name field", settings('cloud_bees')['pipeline_name'] do |pipename|
        pipelines_page.fill_pipeline_name_field :il, pipename
      end

      step "Admin clicks on the Select project drop-down" do
        pipelines_page.click_on_select_project :il
      end

      step "Admin select on the drop-down Default project" do
        pipelines_page.select_default_project
      end


      sleep 3
    end

  end
end