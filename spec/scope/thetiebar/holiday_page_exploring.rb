require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/thetiebar/*.rb"

holidays_page = TheTiebarHolidaysPage.new
footer_page = TheTiebarFooterPage.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Holidays page exploring' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
        step "User goes to the page", settings('thetiebar')['holiday_ties_page'] do |url|
          page.visit url
        end

        step "User clicks boys christmas ties icon redirected on page" do
          holidays_page.click_boys_christmas_ties_icon
          holidays_page.should_see_boys_christmas_h1
        end

        step "User clicks holiday ties link in footer" do
          footer_page.click_holiday_ties :il # step is duplicated below
        end

        step "User clicks thanksgiving ties icon redirected on page" do
          holidays_page.click_thanksgiving_ties_icon
          holidays_page.should_see_thanksgiving_h1
        end

        step "User clicks holiday ties link in footer" do
          footer_page.click_holiday_ties :il # step is duplicated below
        end

        step "User clicks boys easter ties icon redirected on page" do
          holidays_page.click_boys_easter_ties_icon
          holidays_page.should_see_boys_easter_h1
        end

        step "User clicks holiday ties link in footer" do
          footer_page.click_holiday_ties
        end

        step "User clicks nautical ties icon redirected on page" do
          holidays_page.click_nautical_ties_icon
          holidays_page.should_see_nautical_h1
        end

        sleep 3
      end
    end

  end
end
