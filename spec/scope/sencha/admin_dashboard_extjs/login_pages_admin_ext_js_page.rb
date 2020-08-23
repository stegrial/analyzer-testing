require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

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

  feature 'Login Pages on Admin Dashboard Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['admin_dashboard_ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks Pages menu and Login link" do
          admin_dashboard_ext_js_page.click_pages_menu
          admin_dashboard_ext_js_page.click_login_page
        end

        step "User fill Account panel on Forms", "Igor", "Test1111"do |user_id, password|
          admin_dashboard_ext_js_page.fill_login_user_id_field(user_id)
          admin_dashboard_ext_js_page.fill_login_password_field(password)
          admin_dashboard_ext_js_page.click_login_login_btn
        end


        sleep 3
      end
    end

  end
end
