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

  feature 'View KPI Overview on Executive Dashboard Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['executive_dashboard_ext_js_page'] do |url|
          page.visit url
        end

        step "User sess title" do
          executive_dashboard_ext_js_page.should_see_my_biz_title
        end

        step "User sess kpi overview menu" do
          executive_dashboard_ext_js_page.should_see_kpi_overview_menu
        end

        step "User clicks buttons on toolbar" do
          executive_dashboard_ext_js_page.click_goals_met_button
          executive_dashboard_ext_js_page.click_sales_button
          executive_dashboard_ext_js_page.click_won_button
          executive_dashboard_ext_js_page.click_clicks_button
        end


        sleep 3
      end
    end

  end
end
