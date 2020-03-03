require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/zinc_labs'

include ElementSearchValidation

sign_in_page = ZincLabs.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  feature 'Page is changed' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", 'http://localhost:8000/zinc_labs_html/first_state.htm' do |url|
        page.visit url
      end

      step "User clicks Sign In with Google button" do
        sign_in_page.click_sign_in_google
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", 'http://localhost:8000/zinc_labs_html/second_state.htm' do |url|
        page.visit url
      end

      step "User clicks Sign In with Google button" do
        check_element_path :xpath, ZincLabs::SIGN_IN_GOOGLE_TA, ZincLabs::SIGN_IN_GOOGLE_IL
        sign_in_page.click_sign_in_google
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", 'http://localhost:8000/zinc_labs_html/second_state.htm' do |url|
        page.visit url
      end

      step "User clicks Sign In with Google button" do
        check_element_path :xpath, ZincLabs::SIGN_IN_GOOGLE_EP, ZincLabs::SIGN_IN_GOOGLE_IL
        sign_in_page.click_sign_in_google :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', record_debug: true do
      step "User goes to the page", 'https://games.zinclearninglabs.com/users/sign_in' do |url|
        page.visit url
      end

      sleep 5

      step "User clicks Sign In with Google button" do
        sign_in_page.click_sign_in_google
      end

      sleep 30
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", 'http://localhost:8000/zinc_labs_html/second_state.htm' do |url|
        page.visit url
      end

      step "User clicks Sign In with Google button" do
        sign_in_page.click_sign_in_google
      end

      sleep 3
    end

  end
end

