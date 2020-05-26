require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
pipelines_page = CloudBeesPipelines.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Creating and Deleting pipeline' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
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

        step "Admin filters the pipeline by name", settings('cloud_bees')['pipeline_name'] do |pipename|
          pipelines_page.find_pipeline_name_field pipename
          sleep 3 # need wait for the filter will be applied
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
    end

  end
end
