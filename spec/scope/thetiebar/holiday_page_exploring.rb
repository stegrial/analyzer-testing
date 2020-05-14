require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

include ElementSearchValidation

holidays_page = TheTiebarHolidaysPage.new
footer_page = TheTiebarFooterPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Holidays page exploring' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

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

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['holiday_ties_page'] do |url|
        page.visit url
      end

      step "User clicks boys christmas ties icon redirected on page" do
        check_element_path :xpath, TheTiebarHolidaysPage::BOYS_CHRISTMAS_TIES_TA, TheTiebarHolidaysPage::BOYS_CHRISTMAS_TIES_IL
        holidays_page.click_boys_christmas_ties_icon

        check_element_path :xpath, TheTiebarHolidaysPage::BOYS_CHRISTMAS_TIES_H1_TA, TheTiebarHolidaysPage::BOYS_CHRISTMAS_TIES_H1_IL
        holidays_page.should_see_boys_christmas_h1
      end

      step "User clicks holiday ties link in footer" do
        check_element_path :xpath, TheTiebarFooterPage::HOLIDAY_TIES_TA, TheTiebarFooterPage::HOLIDAY_TIES_IL
        footer_page.click_holiday_ties
      end

      step "User clicks thanksgiving ties icon redirected on page" do
        check_element_path :xpath, TheTiebarHolidaysPage::THANKSGIVING_TIES_TA, TheTiebarHolidaysPage::THANKSGIVING_TIES_IL
        holidays_page.click_thanksgiving_ties_icon

        check_element_path :xpath, TheTiebarHolidaysPage::THANKSGIVING_TIES_H1_TA, TheTiebarHolidaysPage::THANKSGIVING_TIES_H1_IL
        holidays_page.should_see_thanksgiving_h1
      end

      step "User clicks holiday ties link in footer" do
        check_element_path :xpath, TheTiebarFooterPage::HOLIDAY_TIES_TA, TheTiebarFooterPage::HOLIDAY_TIES_IL
        footer_page.click_holiday_ties
      end

      step "User clicks boys easter ties icon redirected on page" do
        check_element_path :xpath, TheTiebarHolidaysPage::BOYS_EASTER_TIES_TA, TheTiebarHolidaysPage::BOYS_EASTER_TIES_IL
        holidays_page.click_boys_easter_ties_icon

        check_element_path :xpath, TheTiebarHolidaysPage::BOYS_EASTER_TIES_H1_TA, TheTiebarHolidaysPage::BOYS_EASTER_TIES_H1_IL
        holidays_page.should_see_boys_easter_h1
      end

      step "User clicks holiday ties link in footer" do
        check_element_path :xpath, TheTiebarFooterPage::HOLIDAY_TIES_TA, TheTiebarFooterPage::HOLIDAY_TIES_IL
        footer_page.click_holiday_ties
      end

      step "User clicks nautical ties icon redirected on page" do
        check_element_path :xpath, TheTiebarHolidaysPage::NAUTICAL_TIES_TA, TheTiebarHolidaysPage::NAUTICAL_TIES_IL
        holidays_page.click_nautical_ties_icon

        check_element_path :xpath, TheTiebarHolidaysPage::NAUTICAL_TIES_H1_TA, TheTiebarHolidaysPage::NAUTICAL_TIES_H1_IL
        holidays_page.should_see_nautical_h1
      end

      sleep 3
    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['holiday_ties_page'] do |url|
        page.visit url
      end

      step "User clicks boys christmas ties icon redirected on page" do
        check_element_path :xpath, TheTiebarHolidaysPage::BOYS_CHRISTMAS_TIES_EP, TheTiebarHolidaysPage::BOYS_CHRISTMAS_TIES_IL
        holidays_page.click_boys_christmas_ties_icon :ep
        check_element_path :xpath, TheTiebarHolidaysPage::BOYS_CHRISTMAS_TIES_H1_EP, TheTiebarHolidaysPage::BOYS_CHRISTMAS_TIES_H1_IL
        holidays_page.should_see_boys_christmas_h1 :ep
      end

      step "User clicks holiday ties link in footer" do
        check_element_path :xpath, TheTiebarFooterPage::HOLIDAY_TIES_EP, TheTiebarFooterPage::HOLIDAY_TIES_IL
        footer_page.click_holiday_ties :ep
      end

      step "User clicks thanksgiving ties icon redirected on page" do
        check_element_path :xpath, TheTiebarHolidaysPage::THANKSGIVING_TIES_EP, TheTiebarHolidaysPage::THANKSGIVING_TIES_IL
        holidays_page.click_thanksgiving_ties_icon :ep
        check_element_path :xpath, TheTiebarHolidaysPage::THANKSGIVING_TIES_H1_EP, TheTiebarHolidaysPage::THANKSGIVING_TIES_H1_IL
        holidays_page.should_see_thanksgiving_h1 :ep
      end

      step "User clicks holiday ties link in footer" do
        check_element_path :xpath, TheTiebarFooterPage::HOLIDAY_TIES_EP, TheTiebarFooterPage::HOLIDAY_TIES_IL
        footer_page.click_holiday_ties :ep
      end

      step "User clicks boys easter ties icon redirected on page" do
        check_element_path :xpath, TheTiebarHolidaysPage::BOYS_EASTER_TIES_EP, TheTiebarHolidaysPage::BOYS_EASTER_TIES_IL
        holidays_page.click_boys_easter_ties_icon :ep
        check_element_path :xpath, TheTiebarHolidaysPage::BOYS_EASTER_TIES_H1_EP, TheTiebarHolidaysPage::BOYS_EASTER_TIES_H1_IL
        holidays_page.should_see_boys_easter_h1 :ep
      end

      step "User clicks holiday ties link in footer" do
        check_element_path :xpath, TheTiebarFooterPage::HOLIDAY_TIES_EP, TheTiebarFooterPage::HOLIDAY_TIES_IL
        footer_page.click_holiday_ties :ep
      end

      step "User clicks nautical ties icon redirected on page" do
        check_element_path :xpath, TheTiebarHolidaysPage::NAUTICAL_TIES_EP, TheTiebarHolidaysPage::NAUTICAL_TIES_IL
        holidays_page.click_nautical_ties_icon :ep
        check_element_path :xpath, TheTiebarHolidaysPage::NAUTICAL_TIES_H1_EP, TheTiebarHolidaysPage::NAUTICAL_TIES_H1_IL
        holidays_page.should_see_nautical_h1 :ep
      end

    end
  end
end