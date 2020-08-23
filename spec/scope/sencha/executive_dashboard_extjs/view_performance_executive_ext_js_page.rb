require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

executive_dashboard_ext_js_page = ExecutiveDashboardExtJSPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Performance on Executive Dashboard Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['executive_dashboard_ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks Performance menu" do
          executive_dashboard_ext_js_page.click_performance_menu
        end

        step "User clicks APPL dropdown" do
          executive_dashboard_ext_js_page.click_appl_dropdown
          executive_dashboard_ext_js_page.should_see_google_text
        end

        step "User clicks GOOGLE dropdown" do
          executive_dashboard_ext_js_page.click_google_dropdown
          executive_dashboard_ext_js_page.should_see_appl_text
        end

        step "User clicks Statements 4 2013 for download" do
          executive_dashboard_ext_js_page.click_statements_4_2013
        end


        sleep 3
      end
    end

  end
end
