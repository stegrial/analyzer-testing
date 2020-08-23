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

        step "User clicks Company News menu" do
          executive_dashboard_ext_js_page.click_company_news_menu
        end

        step "User clicks on All Posts dropdown" do
          executive_dashboard_ext_js_page.click_all_posts_dropdown
          executive_dashboard_ext_js_page.click_news_dropdown
          executive_dashboard_ext_js_page.click_forum_dropdown
        end

        step "User clicks on Forum Icon" do
          executive_dashboard_ext_js_page.click_news_icon
          executive_dashboard_ext_js_page.click_expand_2
          executive_dashboard_ext_js_page.click_collapse_2
        end


        sleep 3
      end
    end

  end
end
