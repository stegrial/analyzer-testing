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

  feature 'Creating and Deleting pipeline' do

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
        global_page.click_hamburger_menu :il # step is duplicated below
      end

      step "Admin chooses the Pipelines section in the Hamburger menu" do
        global_page.click_pipelines :il # step is duplicated below
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

      step "Admin confirm new pipeline" do
        pipelines_page.confirm_create_new_pipeline
      end

      step "Admin clicks 'Add +' for adding task in Stage 1" do
        pipelines_page.click_new_task
      end

      step "Admin fills the task name field", "task_test_name" do |taskname|
        pipelines_page.fill_task_name_field taskname
      end

      step "Admin clicks on the Select Task Type button in the Stage 1" do
        pipelines_page.select_task_type
      end

      step "Admin clicks on the Manual Task Type in popover" do
        pipelines_page.manual_task_type
      end

      step "Admin clicks on the Done icon for ending creating new task in Stage 1" do
        pipelines_page.confirm_new_task
      end

      step "Admin clicks on the Hamburger menu button" do
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Pipelines section in the Hamburger menu" do
        global_page.click_pipelines
      end

      step "Admin fills the pipeline name field", settings('cloud_bees')['pipeline_name'] do |pipename|
        pipelines_page.find_pipeline_name_field pipename
      end

      step "Admin clicks on new created pipeline" do
        pipelines_page.select_pipeline_from_list
      end

      step "Admin clicks on delete button" do
        pipelines_page.delete_pipeline
      end

      step "Admin clicks on the OK button" do
        pipelines_page.confirm_delete_pipeline
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

      step "Admin clicks on the Select project drop-down" do
        check_element_path :xpath, CloudBeesPipelines::SELECT_PROJECT_TA, CloudBeesPipelines::SELECT_PROJECT_IL
        pipelines_page.click_on_select_project
      end

      step "Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesPipelines::SELECT_DEFAULT_PROJECT_TA, CloudBeesPipelines::SELECT_DEFAULT_PROJECT_IL
        pipelines_page.select_default_project
      end

      step "Admin confirm new pipeline" do
        check_element_path :xpath, CloudBeesPipelines::CONFIRM_NEW_PIPELINE_TA, CloudBeesPipelines::CONFIRM_NEW_PIPELINE_IL
        pipelines_page.confirm_create_new_pipeline
      end

      step "Admin clicks 'Add +' for adding task in Stage 1" do
        check_element_path :xpath, CloudBeesPipelines::NEW_TASK_BTN_TA, CloudBeesPipelines::NEW_TASK_BTN_IL
        pipelines_page.click_new_task
      end

      step "Admin fills the task name field", "task_test_name" do |taskname|
        check_element_path :xpath, CloudBeesPipelines::TASK_NAME_TA, CloudBeesPipelines::TASK_NAME_IL
        pipelines_page.fill_task_name_field taskname
      end

      step "Admin clicks on the Select Task Type button in the Stage 1" do
        check_element_path :xpath, CloudBeesPipelines::SELECT_TASK_TYPE_TA, CloudBeesPipelines::SELECT_TASK_TYPE_IL
        pipelines_page.select_task_type
      end

      step "Admin clicks on the Manual Task Type in popover" do
        check_element_path :xpath, CloudBeesPipelines::MANUAL_TASK_TYPE_TA, CloudBeesPipelines::MANUAL_TASK_TYPE_IL
        pipelines_page.manual_task_type
      end

      step "Admin clicks on the Done icon for ending creating new task in Stage 1" do
        check_element_path :xpath, CloudBeesPipelines::CONFIRM_NEW_TASK_TA, CloudBeesPipelines::CONFIRM_NEW_TASK_IL
        pipelines_page.confirm_new_task
      end

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_TA, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu
      end

      step "Admin chooses the Pipelines section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::PIPELINES_SECTION_TA, CloudBeesGlobal::PIPELINES_SECTION_IL
        global_page.click_pipelines
      end

      step "Admin fills the pipeline name field", settings('cloud_bees')['pipeline_name'] do |pipename|
        check_element_path :xpath, CloudBeesPipelines::FIND_PIPELINE_FIELD_TA, CloudBeesPipelines::FIND_PIPELINE_FIELD_IL
        pipelines_page.find_pipeline_name_field pipename
      end

      step "Admin clicks on new created pipeline" do
        check_element_path :css, CloudBeesPipelines::PIPELINE_LIST_ITEM_TA, CloudBeesPipelines::PIPELINE_LIST_ITEM_IL
        pipelines_page.select_pipeline_from_list
      end

      step "Admin clicks on delete button" do
        check_element_path :xpath, CloudBeesPipelines::DELETE_PIPELINE_TA, CloudBeesPipelines::DELETE_PIPELINE_IL
        pipelines_page.delete_pipeline
      end

      step "Admin clicks on the OK button" do
        check_element_path :xpath, CloudBeesPipelines::CONFIRM_DELETE_PIPELINE_TA, CloudBeesPipelines::CONFIRM_DELETE_PIPELINE_IL
        pipelines_page.confirm_delete_pipeline
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

      step "Admin clicks on the Select project drop-down" do
        check_element_path :xpath, CloudBeesPipelines::SELECT_PROJECT_EP, CloudBeesPipelines::SELECT_PROJECT_IL
        pipelines_page.click_on_select_project :ep
      end

      step "Admin select on the drop-down Default project" do
        check_element_path :xpath, CloudBeesPipelines::SELECT_DEFAULT_PROJECT_EP, CloudBeesPipelines::SELECT_DEFAULT_PROJECT_IL
        pipelines_page.select_default_project :ep
      end

      step "Admin confirm new pipeline" do
        check_element_path :xpath, CloudBeesPipelines::CONFIRM_NEW_PIPELINE_EP, CloudBeesPipelines::CONFIRM_NEW_PIPELINE_IL
        pipelines_page.confirm_create_new_pipeline :ep
      end

      step "Admin clicks 'Add +' for adding task in Stage 1" do
        check_element_path :xpath, CloudBeesPipelines::NEW_TASK_BTN_EP, CloudBeesPipelines::NEW_TASK_BTN_IL
        pipelines_page.click_new_task :ep
      end

      step "Admin fills the task name field", "task_test_name" do |taskname|
        check_element_path :xpath, CloudBeesPipelines::TASK_NAME_EP, CloudBeesPipelines::TASK_NAME_IL
        pipelines_page.fill_task_name_field :ep, taskname
      end

      step "Admin clicks on the Select Task Type button in the Stage 1" do
        check_element_path :xpath, CloudBeesPipelines::SELECT_TASK_TYPE_EP, CloudBeesPipelines::SELECT_TASK_TYPE_IL
        pipelines_page.select_task_type :ep
      end

      step "Admin clicks on the Manual Task Type in popover" do
        check_element_path :xpath, CloudBeesPipelines::MANUAL_TASK_TYPE_EP, CloudBeesPipelines::MANUAL_TASK_TYPE_IL
        pipelines_page.manual_task_type :ep
      end

      step "Admin clicks on the Done icon for ending creating new task in Stage 1" do
        check_element_path :xpath, CloudBeesPipelines::CONFIRM_NEW_TASK_EP, CloudBeesPipelines::CONFIRM_NEW_TASK_IL
        pipelines_page.confirm_new_task :ep
      end

      step "Admin clicks on the Hamburger menu button" do
        check_element_path :css, CloudBeesGlobal::HAM_MENU_BTN_EP, CloudBeesGlobal::HAM_MENU_BTN_IL
        global_page.click_hamburger_menu :ep
      end

      step "Admin chooses the Pipelines section in the Hamburger menu" do
        check_element_path :css, CloudBeesGlobal::PIPELINES_SECTION_EP, CloudBeesGlobal::PIPELINES_SECTION_IL
        global_page.click_pipelines :ep
      end

      step "Admin fills the pipeline name field", settings('cloud_bees')['pipeline_name'] do |pipename|
        check_element_path :xpath, CloudBeesPipelines::FIND_PIPELINE_FIELD_EP, CloudBeesPipelines::FIND_PIPELINE_FIELD_IL
        pipelines_page.find_pipeline_name_field :ep, pipename
      end

      step "Admin clicks on new created pipeline" do
        check_element_path :css, CloudBeesPipelines::PIPELINE_LIST_ITEM_EP, CloudBeesPipelines::PIPELINE_LIST_ITEM_IL
        pipelines_page.select_pipeline_from_list :ep
      end

      step "Admin clicks on delete button" do
        check_element_path :xpath, CloudBeesPipelines::DELETE_PIPELINE_EP, CloudBeesPipelines::DELETE_PIPELINE_IL
        pipelines_page.delete_pipeline :ep
      end

      step "Admin clicks on the OK button" do
        check_element_path :xpath, CloudBeesPipelines::CONFIRM_DELETE_PIPELINE_EP, CloudBeesPipelines::CONFIRM_DELETE_PIPELINE_IL
        pipelines_page.confirm_delete_pipeline :ep
      end

      sleep 3
    end


  end
end