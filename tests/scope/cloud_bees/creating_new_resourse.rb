require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
resources_page = CloudBeesResources.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)

  end

  after(:all) do
    Capybara.current_session.driver.quit
  end
  feature 'CloudBees - Creating new resource(TA-1016)' do

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

      step "User goes to the page", settings('cloud_bees')['resource_page'] do |url|
        page.visit url
      end

      step "Admin clicks Add New Resource dropdown" do
        resources_page.click_add_new_resource
      end

      step "Admin clicks create new resource button" do
        resources_page.click_create_resource_btn
      end

      step "Admin enters a new resource name", 'NewResourceName' do |name|
        sleep 5  # TA-1016
        resources_page.set_resource_name name
      end

      step "Admin set description of new resource input" do
        resources_page.set_description_of_resource
      end

      step "Admin set host of new resource input" do
        resources_page.set_host_of_resource
      end

      step "Admin set port of new resource input" do
        resources_page.set_port_of_resource
      end

      step "Admin set pools of new resource input" do
        resources_page.set_pools_of_resource
      end

      step "Admin set shell of new resource input" do
        resources_page.set_shell_of_resource
      end

      step "Admin set step limit of new resource input" do
        resources_page.set_step_limit_of_resource
      end

      step "Admin set cache dirictory of new resource input" do
        resources_page.set_cache_directory_of_resource
      end

      step "Admin set cache tags of new resource input" do
        resources_page.set_tags_of_resource
      end

      step "Admin clicks ok button " do
        resources_page.click_ok_button
      end

      # sleep 4
      step "Admin set resource name in quick search" do
        resources_page.click_quick_search
      end

      step "Admin clicks filter button " do
        resources_page.click_filter_button
      end

      step "Admin clicks to select checkbox of created resource " do
        resources_page.click_to_select_checkbox
      end

      step "Admin clicks delete button " do
        resources_page.click_to_delete_new_resource
      end



      # COUlDNT switch to frame



      step "Admin clicks ok for delete resource " do
        resources_page.click_ok_to_delete_new_resource
      end
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field  credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field  credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "User goes to the page", settings('cloud_bees')['resource_page'] do |url|
        page.visit url
      end

      step "Admin clicks Add New Resource dropdown" do
        check_element_path :xpath, CloudBeesResources::ADD_NEW_RESOURCE_TA, CloudBeesResources::ADD_NEW_RESOURCE_IL
        resources_page.click_add_new_resource
      end
      step "Admin clicks create new resource button" do
        check_element_path :xpath, CloudBeesResources::CREATE_RESOURCE_BTN_TA, CloudBeesResources::CREATE_RESOURCE_BTN_IL
        resources_page.click_create_resource_btn
      end

      step "Admin enters a new resource name", 'NewResourceName' do |name|
        sleep 5  # TA-1016
        check_element_path :xpath, CloudBeesResources::RESOURCE_NAME_TA, CloudBeesResources::RESOURCE_NAME_IL
        resources_page.set_resource_name name
      end

      step "Admin set description of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_DESCRIPTION_TA, CloudBeesResources::RESOURCE_DESCRIPTION_IL
        resources_page.set_description_of_resource
      end

      step "Admin set host of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_HOST_NAME_TA, CloudBeesResources::RESOURCE_HOST_NAME_IL
        resources_page.set_host_of_resource
      end

      step "Admin set port of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_PORT_TA, CloudBeesResources::RESOURCE_PORT_IL
        resources_page.set_port_of_resource
      end

      step "Admin set pools of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_POOLS_TA, CloudBeesResources::RESOURCE_POOLS_IL
        resources_page.set_pools_of_resource
      end

      step "Admin set shell of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_SHELL_TA, CloudBeesResources::RESOURCE_SHELL_IL
        resources_page.set_shell_of_resource
      end

      step "Admin set step limit of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_STEP_LIMIT_TA, CloudBeesResources::RESOURCE_STEP_LIMIT_IL
        resources_page.set_step_limit_of_resource
      end

      step "Admin set cache dirictory of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_CACHE_DIRECTORY_TA, CloudBeesResources::RESOURCE_CACHE_DIRECTORY_IL
        resources_page.set_cache_directory_of_resource
      end

      step "Admin set cache tags of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_TAGS_TA, CloudBeesResources::RESOURCE_TAGS_IL
        resources_page.set_tags_of_resource
      end

      step "Admin clicks ok button " do
        check_element_path :css, CloudBeesResources::RESOURCE_OK_BTN_TA, CloudBeesResources::RESOURCE_OK_BTN_IL
        resources_page.click_ok_button
      end

      step "Admin set resource name in quick search" do
        check_element_path :xpath, CloudBeesResources::QUICK_SEARCH_INPUT_TA, CloudBeesResources::QUICK_SEARCH_INPUT_IL
        resources_page.click_quick_search
      end

      step "Admin clicks filter button " do
        check_element_path :css, CloudBeesResources::FILTER_OK_BTN_TA, CloudBeesResources::FILTER_OK_BTN_IL
        resources_page.click_filter_button
      end

      step "Admin clicks to select checkbox of created resource " do
        check_element_path :xpath, CloudBeesResources::SELECT_CHECKBOX_TA, CloudBeesResources::SELECT_CHECKBOX_IL
        resources_page.click_to_select_checkbox
      end

      step "Admin clicks delete button " do
        check_element_path :xpath, CloudBeesResources::DELETE_NEW_RESOURCE_TA, CloudBeesResources::DELETE_NEW_RESOURCE_IL
        resources_page.click_to_delete_new_resource
      end

      sleep 2

      step "Admin clicks ok for delete resource " do
        check_element_path :xpath, CloudBeesResources::ACCEPT_DELETE_RESOURCE_TA, CloudBeesResources::ACCEPT_DELETE_RESOURCE_IL
        resources_page.click_ok_to_delete_new_resource
      end
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

      step "User goes to the page", settings('cloud_bees')['resource_page'] do |url|
        page.visit url
      end

      step "Admin clicks Add New Resource dropdown" do
        check_element_path :xpath, CloudBeesResources::ADD_NEW_RESOURCE_EP, CloudBeesResources::ADD_NEW_RESOURCE_IL
        resources_page.click_add_new_resource :ep
      end
      step "Admin clicks create new resource button" do
        check_element_path :xpath, CloudBeesResources::CREATE_RESOURCE_BTN_EP, CloudBeesResources::CREATE_RESOURCE_BTN_IL
        resources_page.click_create_resource_btn  :ep
      end

      step "Admin enters a new resource name", 'NewResourceName' do |name|
        sleep 5  # TA-1016
        check_element_path :xpath, CloudBeesResources::RESOURCE_NAME_EP, CloudBeesResources::RESOURCE_NAME_IL
        resources_page.set_resource_name :ep, name
      end

      step "Admin set description of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_DESCRIPTION_EP, CloudBeesResources::RESOURCE_DESCRIPTION_IL
        resources_page.set_description_of_resource :ep
      end

      step "Admin set host of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_HOST_NAME_EP, CloudBeesResources::RESOURCE_HOST_NAME_IL
        resources_page.set_host_of_resource :ep
      end

      step "Admin set port of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_PORT_EP, CloudBeesResources::RESOURCE_PORT_IL
        resources_page.set_port_of_resource  :ep
      end

      step "Admin set pools of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_POOLS_EP, CloudBeesResources::RESOURCE_POOLS_IL
        resources_page.set_pools_of_resource :ep
      end

      step "Admin set shell of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_SHELL_EP, CloudBeesResources::RESOURCE_SHELL_IL
        resources_page.set_shell_of_resource :ep
      end

      step "Admin set step limit of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_STEP_LIMIT_EP, CloudBeesResources::RESOURCE_STEP_LIMIT_IL
        resources_page.set_step_limit_of_resource :ep
      end

      step "Admin set cache dirictory of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_CACHE_DIRECTORY_EP, CloudBeesResources::RESOURCE_CACHE_DIRECTORY_IL
        resources_page.set_cache_directory_of_resource :ep
      end

      step "Admin set cache tags of new resource input" do
        check_element_path :xpath, CloudBeesResources::RESOURCE_TAGS_EP, CloudBeesResources::RESOURCE_TAGS_IL
        resources_page.set_tags_of_resource :ep
      end

      step "Admin clicks ok button " do
        check_element_path :css, CloudBeesResources::RESOURCE_OK_BTN_EP, CloudBeesResources::RESOURCE_OK_BTN_IL
        resources_page.click_ok_button :ep
      end

    end
  end
end