require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

login_page = CloudBeesLogin.new
resources_page = CloudBeesResources.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'AT-81, CloudBees - Click creat new resource' do

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

      step "User goes to the page", settings('cloud_bees')['resource_page'] do |url|
        page.visit url
      end

      step "Admin clicks Add New Resource dropdown" do
        sleep 3 # to wait iframe
        resources_page.click_add_new_resource
      end

      step "Admin clicks create new resource button" do
        resources_page.click_create_resource_btn
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin does login", settings('cloud_bees') do |credentials|
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
        sleep 3 # to wait iframe
        within_frame(0) { check_element_path  :xpath, CloudBeesResources::ADD_NEW_RESOURCE_TA, CloudBeesResources::ADD_NEW_RESOURCE_IL }
        resources_page.click_add_new_resource
      end

      step "Admin clicks create new resource button" do
        within_frame(0) { check_element_path :xpath, CloudBeesResources::CREATE_RESOURCE_BTN_TA, CloudBeesResources::CREATE_RESOURCE_BTN_IL }
        resources_page.click_create_resource_btn
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
        sleep 3 # to wait iframe
        within_frame(0) { check_element_path :xpath, CloudBeesResources::ADD_NEW_RESOURCE_EP, CloudBeesResources::ADD_NEW_RESOURCE_IL }
        resources_page.click_add_new_resource :ep
      end

      step "Admin clicks create new resource button" do
        within_frame(0) { check_element_path :xpath, CloudBeesResources::CREATE_RESOURCE_BTN_EP, CloudBeesResources::CREATE_RESOURCE_BTN_IL }
        resources_page.click_create_resource_btn :ep
      end

      sleep 3
    end

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin does login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end

      step "User goes to the page", settings('cloud_bees')['resource_page'] do |url|
        page.visit url
      end

      step "Admin clicks Add New Resource dropdown" do
        sleep 3 # to wait iframe
        resources_page.click_add_new_resource :il
      end
      step "Admin clicks create new resource button" do
        resources_page.click_create_resource_btn
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin does login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field :il, credentials['username']
        login_page.fill_pass_field :il, credentials['pass']
        login_page.click_sign_in_button :il
      end
      step "User goes to the page", settings('cloud_bees')['resource_page'] do |url|
        page.visit url
      end

      step "Admin clicks Add New Resource dropdown" do
        sleep 3 # to wait iframe
        resources_page.click_add_new_resource :il
      end

      step "Admin clicks create new resource button" do
        resources_page.click_create_resource_btn
      end

      sleep 3
    end
  end
end