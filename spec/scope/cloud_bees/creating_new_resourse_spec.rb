require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
resources_page = CloudBeesResources.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Creating new resource' do

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

        step "User goes to the page", settings('cloud_bees')['resource_page'] do |url|
          page.visit url
        end

        step "Admin clicks Add New Resource dropdown" do
          sleep 3 # to wait for iframe to be loaded
          resources_page.click_add_new_resource
        end

        step "Admin clicks create new resource button" do
          resources_page.click_create_resource_btn
        end

        step "Admin enters a new resource name", 'NewResourceName' do |name|
          resources_page.set_resource_name name
        end

        step "Admin set description of new resource input", '123' do |value|
          resources_page.set_description_of_resource value
        end

        step "Admin set host of new resource input", '123' do |value|
          resources_page.set_host_of_resource value
        end

        step "Admin set port of new resource input", '123' do |value|
          resources_page.set_port_of_resource value
        end

        step "Admin set pools of new resource input", '123' do |value|
          resources_page.set_pools_of_resource value
        end

        step "Admin set shell of new resource input", '123' do |value|
          resources_page.set_shell_of_resource value
        end

        step "Admin set step limit of new resource input", '123' do |value|
          resources_page.set_step_limit_of_resource value
        end

        step "Admin set cache directory of new resource input", '123' do |value|
          resources_page.set_cache_directory_of_resource value
        end

        step "Admin set cache tags of new resource input", '123' do |value|
          resources_page.set_tags_of_resource value
        end

        step "Admin clicks ok button" do
          resources_page.click_ok_button
        end

        step "Admin set  resource name in quick search", 'NewResourceName' do |value|
          resources_page.click_quick_search value
        end

        step "Admin clicks filter button " do
          resources_page.click_filter_button
          sleep 2 # to wait for the filter to be applied
        end

        step "Admin clicks to select checkbox of created resource " do
          resources_page.click_to_select_checkbox
        end

        step "Admin clicks delete button " do
          resources_page.click_to_delete_new_resource
        end

        step "Admin clicks ok for delete resource " do
          resources_page.click_ok_to_delete_new_resource
        end

        sleep 3
      end
    end

  end
end
