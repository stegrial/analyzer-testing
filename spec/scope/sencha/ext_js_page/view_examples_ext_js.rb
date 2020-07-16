require 'spec_helper'
require_relative '../../../../helpers/special_methods'
required_relative_all "/pages/sencha/*.rb"

examples_page = ExamplesPage.new
ext_js_page = ExtJSPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 900)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'View Examples of Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['examples_page'] do |url|
          page.visit url
        end

        step "User clicks 'View Examples' button of Ext JS" do
          examples_page.click_ext_js_view_examples
        end

        step "User sees 'Sample Applications' header" do
          ext_js_page.should_see_sample_applications_header
        end

        step "User sees 'Sample Applications' titles" do
          ext_js_page.should_see_admin_dashboard_title
          ext_js_page.should_see_executive_dashboard_title
          ext_js_page.should_see_employee_directory_title
        end

        step "User sees 'Combination Examples' header" do
          ext_js_page.should_see_combinations_examples_header
        end

        step "User sees 'Combination Examples' titles" do
          ext_js_page.should_see_kitchen_modern_title
          ext_js_page.should_see_kitchen_classic_title
          ext_js_page.should_see_ext_js_calendar_title
          ext_js_page.should_see_ticket_app_title
          ext_js_page.should_see_portal_demo_title
          ext_js_page.should_see_simple_task_title
          ext_js_page.should_see_responsive_design_demo_title
          ext_js_page.should_see_image_viewer_title
          ext_js_page.should_see_theme_viewer_title
          ext_js_page.should_see_right_to_left_title
          ext_js_page.should_see_web_desktop_title
          ext_js_page.should_see_accessibility_demo_title
        end


        sleep 3
      end
    end

  end
end
