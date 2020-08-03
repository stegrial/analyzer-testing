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

  feature 'View Dashboard on Admin Dashboard Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['admin_dashboard_ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks Mobile switch link" do
          admin_dashboard_ext_js_page.click_mobile_switch_menu
          admin_dashboard_ext_js_page.click_switch_mobile_no
        end

        step "User sees Search link" do
          admin_dashboard_ext_js_page.should_see_search_link
        end

        step "User sees Email link" do
          admin_dashboard_ext_js_page.should_see_email_link
        end

        step "User sees FAQ link" do
          admin_dashboard_ext_js_page.should_see_faq_link
        end

        step "User sees Profile link" do
          admin_dashboard_ext_js_page.should_see_profile_link
        end

        step "User clicks first item from TODO list" do
          admin_dashboard_ext_js_page.click_first_todo_item
        end

        step "User fills the New Task field", "new task from Igor" do |new_task|
          admin_dashboard_ext_js_page.fill_new_task_field(new_task)
          admin_dashboard_ext_js_page.click_add_new_task
        end


        sleep 3
      end
    end

  end
end
