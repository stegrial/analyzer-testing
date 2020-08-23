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

  feature 'View FAQ on Admin Dashboard Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['admin_dashboard_ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks FAQ menu" do
          admin_dashboard_ext_js_page.click_faq_menu
        end

        step "User sees General panel on FAQs" do
          admin_dashboard_ext_js_page.should_see_resolution_images
          admin_dashboard_ext_js_page.should_see_resolution_images_body

          admin_dashboard_ext_js_page.click_application_pc
          admin_dashboard_ext_js_page.should_see_application_pc_body

          admin_dashboard_ext_js_page.click_database_update
          admin_dashboard_ext_js_page.should_see_database_update_body

          admin_dashboard_ext_js_page.click_commercial_website
          admin_dashboard_ext_js_page.should_see_commercial_website_body
        end


        sleep 3
      end
    end

  end
end
