require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/venus'

it = Venus.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-698, TA returns the wrong element (Venus - Clicking on the View Detail for second item in the list)' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Search button" do
        it.click_search_button
      end

      step "User enters value to search", 'white' do |value|
        it.enter_search_value value
      end

      step "User clicks Find button" do
        it.click_find_button
      end

      step "User clicks View Detail for second item in the list" do
        it.click_view_detail_second
      end


      sleep 3
    end

    scenario 'Searching IL', il_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        it.click_account_button :il
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        it.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on the Search button" do
        check_element_path :xpath, Venus::SEARCH_BUTTON_TA, Venus::SEARCH_BUTTON_IL
        it.click_search_button
      end

      step "User enters value to search", 'white' do |value|
        check_element_path :xpath, Venus::SEARCH_FIELD_TA, Venus::SEARCH_FIELD_IL
        it.enter_search_value value
      end

      step "User clicks Find button" do
        check_element_path :xpath, Venus::FIND_BUTTON_TA, Venus::FIND_BUTTON_IL
        it.click_find_button
      end

      step "User clicks View Detail for second item in the list" do
        check_element_path :xpath, Venus::VIEW_DETAIL_SECOND_TA, Venus::VIEW_DETAIL_SECOND_IL
        it.click_view_detail_second
      end


      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        it.click_account_button :il
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        it.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on the Search button" do
        check_element_path :xpath, Venus::SEARCH_BUTTON_EP, Venus::SEARCH_BUTTON_IL
        it.click_search_button :ep
      end

      step "User enters value to search", 'white' do |value| # New issue TA-921
        check_element_path :xpath, Venus::SEARCH_FIELD_EP, Venus::SEARCH_FIELD_IL
        it.enter_search_value :ep, value
      end

      step "User clicks Find button" do
        check_element_path :xpath, Venus::FIND_BUTTON_EP, Venus::FIND_BUTTON_IL
        it.click_find_button :ep
      end

      step "User clicks View Detail for second item in the list" do
        check_element_path :xpath, Venus::VIEW_DETAIL_SECOND_EP, Venus::VIEW_DETAIL_SECOND_IL
        it.click_view_detail_second :ep
      end


      sleep 3
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Search button" do
        it.click_search_button :il
      end

      step "User enters value to search", 'white' do |value|
        it.enter_search_value value
      end
=begin can't reproduce: TA-921 (new issue)
      step "User clicks Find button" do
        it.click_find_button :il
      end

      step "User clicks View Detail for second item in the list" do
        it.click_view_detail_second
      end
=end
      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('venus')['home_page'] do |url|
        page.visit url
      end

      step "User clicks on the Account button" do
        it.click_account_button :il
      end

      step "User fills the Email field", settings('venus')['email'] do |email|
        it.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('venus')['pass'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on the Search button" do
        it.click_search_button :il
      end

      step "User enters value to search", 'white' do |value|
        # sleep 120
        it.enter_search_value value
      end
=begin can't reproduce: TA-921 (new issue)
      step "User clicks Find button" do
        it.click_find_button :il
      end

      step "User clicks View Detail for second item in the list" do
        it.click_view_detail_second
      end
=end


      sleep 3
    end


  end
end
