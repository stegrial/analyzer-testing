require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/cloud_bees'

it = CloudBees.new

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

      step "User set login in input" , settings('cloud_bees')['username'] do |login|
        it.set_login(login)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |password|
        it.set_password(password)
      end

      step "User clicks on login bth" do
        it.click_login_btn
      end

      step "User clicks on humburg bth" do
        it.click_humburg_btn
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

      step "User set login in input" , settings('cloud_bees')['username'] do |login|
        check_element_path :xpath, CloudBees::LOGIN_TA, CloudBees::LOGIN_IL
        it.set_login(login)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |password|
        check_element_path :xpath, CloudBees::PASSWORD_TA, CloudBees::PASSWORD_IL
        it.set_password(password)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, CloudBees::LOGIN_BTN_TA, CloudBees::LOGIN_BTN_IL
        it.click_login_btn
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, CloudBees::HUMBURG_BTN_TA, CloudBees::HUMBURG_BTN_IL
        it.click_humburg_btn
      end

      step "User clicks on pipelines link" do
        check_element_path :xpath, CloudBees::PIPELINES_TA, CloudBees::PIPELINES_IL
        it.click_pipelines
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBees::CHOOSE_PIPELINE_TA, CloudBees::CHOOSE_PIPELINE_IL
        it.choose_pipeline_from_list
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |login|
        check_element_path :xpath, CloudBees::LOGIN_EP, CloudBees::LOGIN_IL
        it.set_login(:ep, login)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |password|
        check_element_path :xpath, CloudBees::PASSWORD_EP, CloudBees::PASSWORD_IL
        it.set_password(:ep,password)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, CloudBees::LOGIN_BTN_EP, CloudBees::LOGIN_BTN_IL
        it.click_login_btn :ep
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, CloudBees::HUMBURG_BTN_EP, CloudBees::HUMBURG_BTN_IL
        it.click_humburg_btn :ep
      end

      step "User clicks on pipelines link" do
        check_element_path :xpath, CloudBees::PIPELINES_EP, CloudBees::PIPELINES_IL
        it.click_pipelines :ep
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, CloudBees::CHOOSE_PIPELINE_EP, CloudBees::CHOOSE_PIPELINE_IL
        it.choose_pipeline_from_list :ep
      end
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do

      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('cloud_bees')['username'] do |login|
        it.set_login(:il, login)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |password|
        it.set_password(:il,password)
      end

      step "User clicks on login bth" do
        it.click_login_btn :il
      end

      step "User clicks on humburg bth" do
        it.click_humburg_btn :il
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

      step "User set login in input" , settings('cloud_bees')['username'] do |login|
        it.set_login(:il, login)
      end

      step "User set pass in input" , settings('cloud_bees')['pass'] do |password|
        it.set_password(:il,password)
      end

      step "User clicks on login bth" do
        it.click_login_btn :il
      end

      step "User clicks on humburg bth" do
        it.click_humburg_btn :il
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