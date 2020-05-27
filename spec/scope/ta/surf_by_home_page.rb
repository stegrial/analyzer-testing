require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/ta_pages/*.rb"

include ElementSearchValidation

header_navigation = HeaderNavigation.new
demo_page = DemoPage.new
product_page = ProductPage.new
use_cases_page = UseCasesPage.new
home_page = HomePage.new
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

  feature 'Surf by home page' do

    # Initial locators with Recording
    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('ta')['home_page'] do |url|
          page.visit url
        end

        step "User clicks get a trial button" do
          home_page.click_get_a_trial
        end

        step "User sees sign up text" do
          sign_up_page.should_see_sign_up_text
        end

        step "User clicks back to main button" do
          sign_up_page.click_back_to_main_btn
        end

        step "User clicks learn more button" do
          home_page.click_learn_more_btn
        end

        step "User sees main text of use cases page" do
          use_cases_page.should_see_main_text
        end

        step "User clicks home btn for come back on home page" do
          header_navigation.click_home_btn
        end

        step "User clicks write faster button" do
          home_page.click_write_faster_btn
        end

        step "User sees main faster tests h2" do
          use_cases_page.should_see_faster_tests_h2
        end

        step "User clicks home btn for come back on home page" do
          header_navigation.click_home_btn :il
        end

        step "User clicks cover more button" do
          home_page.click_cover_more_btn
        end

        step "User sees ta smart locators text" do
          use_cases_page.should_see_ta_smart_locators_text
        end

        step "User clicks home btn for come back on home page" do
          header_navigation.click_home_btn :il
        end

        step "User clicks minimize maintenance button" do
          home_page.click_minimize_maintenance_btn
        end

        step "User sees minimize tests maintenance" do
          use_cases_page.should_see_minimize_tests_maintenance
        end

        step "User clicks home btn for come back on home page" do
          header_navigation.click_home_btn :il
        end

        step "User clicks try the solution" do
          home_page.click_try_the_solution_btn
        end

        step "User sees sign up text" do
          sign_up_page.should_see_sign_up_text :il
        end

        step "User clicks back to main button" do
          sign_up_page.click_back_to_main_btn :il
        end

        step "User clicks learn more TA works button" do
          home_page.click_learn_more_ta_works_btn
        end

        step "User sees main text of use cases page" do
          product_page.should_see_how_it_works_text
        end

        step "User clicks home btn for come back on home page" do
          header_navigation.click_home_btn :il
          end

        step "User clicks request a demo button" do
          home_page.click_request_a_demo_btn
        end

        step "User clicks request a demo button" do
          demo_page.should_see_live_demo_text
        end
      end
    end
  end
end
