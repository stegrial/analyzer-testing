require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/ec_flow'

it = Ecflow.new

# This tests runs when the vpn is ON

describe 'Preconditions' do

  feature 'TA-866 EC Flow - selecting pipeline from list' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('ec_flow')['page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('ec_flow')['login'] do |login|
        it.set_login(login)
      end

      step "User set pass in input" , settings('ec_flow')['password'] do |password|
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

      step "User goes to the page", settings('ec_flow')['page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('ec_flow')['login'] do |login|
        check_element_path :xpath, Ecflow::LOGIN_TA, Ecflow::LOGIN_IL
        it.set_login(login)
      end

      step "User set pass in input" , settings('ec_flow')['password'] do |password|
        check_element_path :xpath, Ecflow::PASSWORD_TA, Ecflow::PASSWORD_IL
        it.set_password(password)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, Ecflow::LOGIN_BTN_TA, Ecflow::LOGIN_BTN_IL
        it.click_login_btn
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, Ecflow::HUMBURG_BTN_TA, Ecflow::HUMBURG_BTN_IL
        it.click_humburg_btn
      end

      step "User clicks on pipelines link" do
        check_element_path :xpath, Ecflow::PIPELINES_TA, Ecflow::PIPELINES_IL
        it.click_pipelines
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, Ecflow::CHOOSE_PIPELINE_TA, Ecflow::CHOOSE_PIPELINE_IL
        it.choose_pipeline_from_list
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('ec_flow')['page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('ec_flow')['login'] do |login|
        check_element_path :xpath, Ecflow::LOGIN_EP, Ecflow::LOGIN_IL
        it.set_login(:ep, login)
      end

      step "User set pass in input" , settings('ec_flow')['password'] do |password|
        check_element_path :xpath, Ecflow::PASSWORD_EP, Ecflow::PASSWORD_IL
        it.set_password(:ep,password)
      end

      step "User clicks on login bth" do
        check_element_path :xpath, Ecflow::LOGIN_BTN_EP, Ecflow::LOGIN_BTN_IL
        it.click_login_btn :ep
      end

      step "User clicks on humburg bth" do
        check_element_path :xpath, Ecflow::HUMBURG_BTN_EP, Ecflow::HUMBURG_BTN_IL
        it.click_humburg_btn :ep
      end

      step "User clicks on pipelines link" do
        check_element_path :xpath, Ecflow::PIPELINES_EP, Ecflow::PIPELINES_IL
        it.click_pipelines :ep
      end

      step "User clicks on pipeline to select" do
        check_element_path :xpath, Ecflow::CHOOSE_PIPELINE_EP, Ecflow::CHOOSE_PIPELINE_IL
        it.choose_pipeline_from_list :ep
      end
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do

      step "User goes to the page", settings('ec_flow')['page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('ec_flow')['login'] do |login|
        it.set_login(:il, login)
      end

      step "User set pass in input" , settings('ec_flow')['password'] do |password|
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

      step "User goes to the page", settings('ec_flow')['page'] do |url|
        page.visit url
      end

      step "User set login in input" , settings('ec_flow')['login'] do |login|
        it.set_login(:il, login)
      end

      step "User set pass in input" , settings('ec_flow')['password'] do |password|
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