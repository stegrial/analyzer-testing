require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/ta_pages/*.rb"

doc_page = DocPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Surf by documentation page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('ta')['doc_page'] do |url|
          page.visit url
        end

        step "User fill search field", "api key" do |value|
          doc_page.fill_search_input value
        end

        step "User clicks Setting Api Key search result" do
          doc_page.click_setting_api_key
        end

        step "User sees TA commands page" do
          doc_page.should_see_ta_commands_page
        end

        step "User click clear button in search field" do
          doc_page.click_clear_btn
        end

        step "User click next button" do
          doc_page.click_next_btn
        end

        step "User sees installing TA client h2" do
          doc_page.should_see_installing_client
        end

        step "User click previous button" do
          doc_page.click_previous_btn
        end

        step "User sees TA commands page" do
          doc_page.should_see_ta_commands_page :il #step is duplicated below
        end

        step "User click previous button" do
          doc_page.check_sidebar_visible
        end

        step "User click sidebar_toggle button" do
          doc_page.click_sidebar_toggle
        end

        step "User check sidebar is hidden" do
          doc_page.check_sidebar_hidden
        end

        sleep 3
      end
    end

  end
end
