require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/venus_pages/*.rb"

include ElementSearchValidation

sub_category_page = VenusSubCategory.new
navigation_page = VenusNavigation.new
login_page = VenusLogin.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  feature 'AT-59, TA returns the wrong element (Venus - Clicking on the View Detail for second item in the list)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Search button" do
        navigation_page.click_search_button
      end

      step "User enters value to search", 'white' do |value|
        navigation_page.enter_search_value value
      end

      step "User clicks Find button" do
        navigation_page.click_find_button
      end

      step "User clicks View Detail for second item in the list" do
        sub_category_page.click_view_detail_second
      end


      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        login_page.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        login_page.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button :il
      end

      step "User clicks on the Search button" do
        check_element_path :xpath, VenusNavigation::SEARCH_BUTTON_TA, VenusNavigation::SEARCH_BUTTON_IL
        navigation_page.click_search_button
      end

      step "User enters value to search", 'white' do |value|
        check_element_path :xpath, VenusNavigation::SEARCH_FIELD_TA, VenusNavigation::SEARCH_FIELD_IL
        navigation_page.enter_search_value value
      end

      step "User clicks Find button" do
        check_element_path :xpath, VenusNavigation::FIND_BUTTON_TA, VenusNavigation::FIND_BUTTON_IL
        navigation_page.click_find_button
      end

      step "User clicks View Detail for second item in the list" do
        check_element_path :xpath, VenusSubCategory::VIEW_DETAIL_SECOND_TA, VenusSubCategory::VIEW_DETAIL_SECOND_IL
        sub_category_page.click_view_detail_second
      end


      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        login_page.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        login_page.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button :il
      end

      step "User clicks on the Search button" do
        check_element_path :xpath, VenusNavigation::SEARCH_BUTTON_EP, VenusNavigation::SEARCH_BUTTON_IL
        navigation_page.click_search_button :ep
      end

      step "User enters value to search", 'white' do |value| # New issue TA-921
        check_element_path :xpath, VenusNavigation::SEARCH_FIELD_EP, VenusNavigation::SEARCH_FIELD_IL
        navigation_page.enter_search_value :ep, value
      end

      step "User clicks Find button" do
        check_element_path :xpath, VenusNavigation::FIND_BUTTON_EP, VenusNavigation::FIND_BUTTON_IL
        navigation_page.click_find_button :ep
      end

      step "User clicks View Detail for second item in the list" do
        check_element_path :xpath, VenusSubCategory::VIEW_DETAIL_SECOND_EP, VenusSubCategory::VIEW_DETAIL_SECOND_IL
        sub_category_page.click_view_detail_second :ep
      end


      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Search button" do
        navigation_page.click_search_button :il
      end

      step "User enters value to search", 'white' do |value|
        navigation_page.enter_search_value value
      end
=begin can't reproduce: TA-921 (new issue)
      step "User clicks Find button" do
        it.click_find_button :il
      navigation_page

      step "User clicks View Detail for second item in the list" do
        sub_category_page.click_view_detail_second
      end
=end
      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        navigation_page.click_account_button :il
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        login_page.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        login_page.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sign_in_button :il
      end

      step "User clicks on the Search button" do
        navigation_page.click_search_button :il
      end

      step "User enters value to search", 'white' do |value|
        # sleep 120
        navigation_page.enter_search_value value
      end
=begin can't reproduce: TA-921 (new issue)
      step "User clicks Find button" do
        navigation_page.click_find_button :il
      end

      step "User clicks View Detail for second item in the list" do
        sub_category_page.click_view_detail_second
      end
=end


      sleep 3
    end


  end
end
