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

  feature 'View Profile on Admin Dashboard Ext JS page' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('sencha')['admin_dashboard_ext_js_page'] do |url|
          page.visit url
        end

        step "User clicks Profile menu" do
          admin_dashboard_ext_js_page.click_profile_menu
        end

        step "User filed Your mind and clicks Share button", "Igor Igor Igor Igor" do |your_mind|
          admin_dashboard_ext_js_page.fill_your_mind_field(your_mind)
          admin_dashboard_ext_js_page.click_share_btn
        end

        step "User sees toolbar" do
          admin_dashboard_ext_js_page.should_see_video_link
          admin_dashboard_ext_js_page.should_see_camera_link
          admin_dashboard_ext_js_page.should_see_file_link
        end

        step "User sees social network links" do
          admin_dashboard_ext_js_page.should_see_facebook_link
          admin_dashboard_ext_js_page.should_see_twitter_link
          admin_dashboard_ext_js_page.should_see_google_plus_link
          admin_dashboard_ext_js_page.should_see_email_social_link
          admin_dashboard_ext_js_page.should_see_follow_btn
        end


        sleep 3
      end
    end

  end
end
