require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

include ElementSearchValidation

header_page = TheTiebarHeader.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Incorrect search result product page' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User fills search query field", "T3849TR8I3RHFEKRF" do |search_query|
        header_page.fill_search_input search_query
      end

      step "User click the account button" do
        header_page.click_enter_search_result
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User fills search query field", "T3849TR8I3RHFEKRF" do |search_query|
        check_element_path :xpath, TheTiebarHeader::SEARCH_FIELD_TA, TheTiebarHeader::SEARCH_FIELD_IL
        header_page.fill_search_input search_query
      end

      step "User click the account button" do
        check_element_path :xpath, TheTiebarHeader::SEARCH_FIELD_TA, TheTiebarHeader::SEARCH_FIELD_IL
        header_page.click_enter_search_result
      end

      sleep 3
    end

    # Element Picker

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User fills search query field", "T3849TR8I3RHFEKRF" do |search_query|
        check_element_path :xpath, TheTiebarHeader::SEARCH_FIELD_EP, TheTiebarHeader::SEARCH_FIELD_IL
        header_page.fill_search_input :ep, search_query
      end

      step "User click the account button" do
        check_element_path :xpath, TheTiebarHeader::SEARCH_FIELD_EP, TheTiebarHeader::SEARCH_FIELD_IL
        header_page.click_enter_search_result :ep
      end
      sleep 3
    end

  end
end
