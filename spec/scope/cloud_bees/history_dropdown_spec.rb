require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

global_page = CloudBeesGlobal.new
login_page = CloudBeesLogin.new
change_history_modal = CloudBeesChangeHistory.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Change History modal' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
          page.visit url
        end

        step "Admin do login", settings('cloud_bees') do |credentials|
          login_page.fill_username_field credentials['username']
          login_page.fill_pass_field credentials['pass']
          login_page.click_sign_in_button
        end

        step "Admin clicks on the Hamburger menu button" do
          global_page.click_hamburger_menu
        end

        step "Admin chooses the Change History section in the Hamburger menu" do
          global_page.click_change_history
        end

        step "Admin chooses the second item in table Change History" do
          change_history_modal.click_second_item_in_table
        end

        step "Admin clicks on dropdown Last Changes" do
          change_history_modal.click_dropdown_last_changes
        end

        step "Admin clicks on Past 24 hours" do
          change_history_modal.click_past_24_hours
        end

        step "Admin clicks on dropdown Past 24 hours" do
          change_history_modal.click_dropdown_past_24_hours
        end

        step "Admin clicks in dropdown Between" do
          change_history_modal.click_between_btn
        end

        step "Admin fills the hours time", '12' do |hours_time|
          change_history_modal.fill_hours_time hours_time
        end

        step "Admin fills the minutes time", '00' do |minutes_time|
          change_history_modal.fill_minutes_time minutes_time
        end

        step "Admin confirm time, click OK button" do
          change_history_modal.confirm_time
        end

        step "Admin fills the and hours time", '13' do |hours_time|
          change_history_modal.fill_and_hours_time hours_time
        end

        step "Admin fills the and minutes time", '00' do |minutes_time|
          change_history_modal.fill_and_minutes_time minutes_time
        end

        step "Admin confirm time, click OK button" do
          change_history_modal.and_confirm_time
        end

        step "Admin clicks search button" do
          change_history_modal.click_search_btn
        end

        step "Admin clicks on dropdown Last changes" do
          change_history_modal.click_last_changes_dropdown
        end

        step "Admin select in dropdown Past 3 days" do
          change_history_modal.click_past_3_days
        end

        step "Admin clicks on dropdown All" do
          change_history_modal.click_all_dropdown
        end

        step "Admin clicks on item All Object" do
          change_history_modal.click_all_object
        end

        step "Admin choose on item Application" do
          change_history_modal.click_application
        end

        step "Admin choose on item Component" do
          change_history_modal.click_component
        end

        step "Admin clicks on search field" do
          change_history_modal.click_on_search_field
        end

        sleep 3
      end
    end

  end
end
