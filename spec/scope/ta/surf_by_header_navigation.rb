require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/ta_pages/*.rb"

include ElementSearchValidation

header_navigation = HeaderNavigation.new
doc_page = DocPage.new
product_page = ProductPage.new
use_cases_page = UseCasesPage.new
home_page = HomePage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 1200)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by header navigation' do

    # Initial locators with Recording
    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('ta')['home_page'] do |url|
          page.visit url
        end

        step "User hover product dropdown link" do
          header_navigation.hover_product_dropdown
        end

        step "User click how it works link" do
          header_navigation.click_how_it_works_link
        end

        step "User sees how it works text" do
          product_page.should_see_how_it_works_text
        end

        step "User hover product dropdown link" do
          header_navigation.hover_product_dropdown :il
        end

        step "User click capability link" do
          header_navigation.click_capability_link
        end

        step "User sees supported right now text" do
          product_page.should_see_supported_right_now
        end

        step "User hover use cases dropdown link" do
          header_navigation.hover_use_cases_link
        end

        step "User click write tests faster" do
          header_navigation.click_write_tests_faster
        end

        step "User sees faster tests text" do
          use_cases_page.should_see_faster_tests_h2
        end

        step "User hover use cases dropdown link" do
          header_navigation.hover_use_cases_link :il
        end

        step "User click cover more technologies link" do
          header_navigation.click_cover_more_technologies
        end

        step "User sees ta smart locators text" do
          use_cases_page.should_see_ta_smart_locators_text
        end

        step "User click header logo " do
          header_navigation.click_header_logo
        end

        step "User sees main text on home page" do
          home_page.should_see_main_text
        end

        step "User hover use cases dropdown link" do
          header_navigation.hover_use_cases_link :il
        end

        step "User click maintain_less link" do
          header_navigation.click_maintain_less
        end

        step "User sees minimize tests maintenance text" do
          use_cases_page.should_see_minimize_tests_maintenance
        end

        step "User click home button" do
          header_navigation.click_home_btn
        end

        step "User sees main text on home page" do
          home_page.should_see_main_text :il
          end

        step "User click documentation button" do
          header_navigation.click_documentation_link
        end

        step "User sees install client text" do
          doc_page.should_see_install_client
        end
      end
    end
  end
end
