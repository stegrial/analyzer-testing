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

  feature 'View Email on Admin Dashboard Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['admin_dashboard_ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks Email menu" do
          admin_dashboard_ext_js_page.click_email_menu
        end

        step "User clicks Compose link on Email menu" do
          admin_dashboard_ext_js_page.click_compose_link
          admin_dashboard_ext_js_page.click_discard_button
        end

        step "User sees links on Email menu" do
          admin_dashboard_ext_js_page.should_see_inbox_link
          admin_dashboard_ext_js_page.should_see_sent_mail_link
        end

        step "User sees links on Friends menu" do
          admin_dashboard_ext_js_page.should_see_torres_tran_link
          admin_dashboard_ext_js_page.should_see_hines_moon_link
          admin_dashboard_ext_js_page.should_see_molina_wilkerson_link
        end

        step "User clicks on six person Petty Caldwell" do
          admin_dashboard_ext_js_page.click_six_person
          admin_dashboard_ext_js_page.click_six_person_petty_caldwell
        end

        step "User sees toolbar" do
          admin_dashboard_ext_js_page.should_see_trash_link
          admin_dashboard_ext_js_page.should_see_exclamation_circle_link
          admin_dashboard_ext_js_page.should_see_print_link
        end

        step "User sees toolbar for send email" do
          admin_dashboard_ext_js_page.should_see_edit_bold_link
          admin_dashboard_ext_js_page.should_see_edit_italic_link
          admin_dashboard_ext_js_page.should_see_edit_underline_link
        end


        sleep 3
      end
    end

  end
end
