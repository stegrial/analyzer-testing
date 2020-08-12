require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

ext_js_page = ExtJSPage.new
admin_dashboard_ext_js_page = AdminDashboardExtJSPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Admin Dashboard Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks Admin Dashboard title" do
          ext_js_page.click_admin_dashboard_title
        end

        step "User sees Dashboard menu" do
          admin_dashboard_ext_js_page.should_see_dashboard_menu
        end

        step "User clicks Hamburger menu" do
          admin_dashboard_ext_js_page.click_hamburger_menu
        end


        sleep 3
      end
    end

  end
end
