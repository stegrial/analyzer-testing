require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/ta_pages/*.rb"

include ElementSearchValidation

demo_page = DemoPage.new
use_cases_page = UseCasesPage.new
sign_up_page = SignUpPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 1200)

  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by use cases page' do

    # Initial locators with Recording
    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the product page", settings('ta')['use_cases_page'] do |url|
          page.visit url
        end

        step "User clicks get a trial button" do
          use_cases_page.click_get_a_trial_1
        end

        step "User sees sign up text" do
          sign_up_page.should_see_sign_up_text
        end

        step "User goes to the product page", settings('ta')['use_cases_page'] do |url|
          page.visit url
        end

        step "User clicks view details of write arrow" do
          use_cases_page.click_view_details_of_write
        end

        step "User sees faster tests text" do
          use_cases_page.should_see_faster_tests_h2
        end

        step "User clicks view details of cover arrow" do
          use_cases_page.click_view_details_of_cover
        end

        step "User sees ta smart locators text" do
          use_cases_page.should_see_ta_smart_locators_text
        end

        step "User clicks view details of minimize arrow" do
          use_cases_page.click_view_details_of_minimize
        end

        step "User sees minimize tests maintenance text" do
          use_cases_page.should_see_minimize_tests_maintenance
        end

        step "User clicks get a trial button" do
          use_cases_page.click_get_a_trial_2
        end

        step "User sees sign up text" do
          sign_up_page.should_see_sign_up_text :il
        end

        step "User goes to the product page", settings('ta')['use_cases_page'] do |url|
          page.visit url
        end

        step "User clicks request a demo button" do
          use_cases_page.click_request_a_demo_btn
        end

        step "User clicks request a demo button" do
          demo_page.should_see_live_demo_text
        end
      end
    end
  end
end
