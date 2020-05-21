require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

login_page = LoginPage.new
banner_page = BannerPage.new
header_page = HeaderPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Login to new account' do

    # Initial locators with Recording
    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('annieselke')['page'] do |url|
          page.visit url
          banner_page.close_banner
        end

        step "User clicks login link on home page" do
          header_page.click_login_link
        end

        step "User clicks Create New Account arrow button" do
          login_page.click_create_new_account_arrow
        end

        step "User clicks dropdown arrow", "ms" do |value|
          login_page.click_dropdown_arrow
          login_page.select_dropdown value
          banner_page.close_banner
        end

        step "User fills first name", settings('annieselke')['first_name'] do |first_name|
          login_page.fill_first_name(first_name)
        end

        step "User fills last name", settings('annieselke')['last_name'] do |last_name|
          banner_page.close_banner
          login_page.fill_last_name(last_name)
        end

        step "User fills email", settings('annieselke')['email'] do |email|
          login_page.fill_email_name(email)
        end

        step "User fills pass", settings('annieselke')['pass'] do |pass|
          login_page.fill_pass(pass)
        end

        step "User confirms pass", settings('annieselke')['email'] do |pass|
          login_page.confirm_pass(pass)
          banner_page.close_banner
        end

        step "User clicks Register  button" do
          login_page.click_register_button
        end
      end
    end
  end
end
