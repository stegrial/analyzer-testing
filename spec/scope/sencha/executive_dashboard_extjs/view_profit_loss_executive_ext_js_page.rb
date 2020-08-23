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

  feature 'View Profit & Loss on Executive Dashboard Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['executive_dashboard_ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks Performance menu" do
          executive_dashboard_ext_js_page.click_profit_loss_menu
        end

        step "User clicks Quarter dropdown" do
          executive_dashboard_ext_js_page.click_quarter_dropdown
          executive_dashboard_ext_js_page.click_quarter_1_2010
        end

        step "User move to Region dropdown" do
          executive_dashboard_ext_js_page.hover_region_dropdown
          executive_dashboard_ext_js_page.click_region_asia
        end

        step "User clicks Cost Of Revenue and Discontinued Operations position" do
          executive_dashboard_ext_js_page.click_cost_of_revenue
          executive_dashboard_ext_js_page.click_discontinued_operations
        end


        sleep 3
      end
    end

  end
end
