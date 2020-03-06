require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/thetiebar/*.rb"

include ElementSearchValidation

locations_page = TheTiebarLocation.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'AT-170 Store location page - click book appointment (boston city)' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['location_page'] do |url|
        page.visit url
      end

      step "User click book appointment link" do
        sleep 2
        locations_page.click_book_appointment_boston
      end

    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['location_page'] do |url|
        page.visit url
      end

      step "User click book appointment link" do
        sleep 5
        check_element_path :xpath, TheTiebarLocation::BOOK_APPOINTMENT_TA, TheTiebarLocation::BOOK_APPOINTMENT_IL
        locations_page.click_book_appointment_boston
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['location_page'] do |url|
        page.visit url
      end

      step "User click book appointment link" do
         check_element_path :xpath, TheTiebarLocation::BOOK_APPOINTMENT_EP, TheTiebarLocation::BOOK_APPOINTMENT_IL
        locations_page.click_book_appointment_boston :ep
      end

    end
  end
end