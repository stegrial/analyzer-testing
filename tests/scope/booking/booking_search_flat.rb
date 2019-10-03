require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/booking'

it = Booking.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Booking - creating and deleting new post in mobile view' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('booking')['page'] do |url|
        page.visit url
      end
      step "User clicks to set place" do
        it.click_place
        sleep 5
      end
      step "User set place in input", "Barselona" do |value|
        it.set_place value
      end

      step "User select city from dropown" do
        it.click_to_select_city
      end

      step "User select data" do
        it.click_to_accept
      end
      step "USer clicks to search " do
        it.click_search_btn
      end
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('booking')['page'] do |url|
        page.visit url
      end
      step "User clicks to set place" do
        check_element_path :css, Booking::PLACE_INPUT_TA, Booking::PLACE_INPUT_IL
        it.click_place
        sleep 5
      end
      step "User set place in input", "Barselona" do |value|
        check_element_path :css, Booking::SEARCH_PLACE_INPUT_TA, Booking::SEARCH_PLACE_INPUT_IL
        it.set_place value
      end

      step "User select city from dropown" do
        check_element_path :xpath, Booking::SELECT_CITY_TA, Booking::SELECT_CITY_IL
        it.click_to_select_city
      end

      step "User select data" do
        check_element_path :xpath, Booking::ACCEPT_TA, Booking::ACCEPT_IL
        it.click_to_accept
      end
      step "USer clicks to search " do
        check_element_path :css, Booking::SEARCH_BTN_TA, Booking::SEARCH_BTN_IL
        it.click_search_btn
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('booking')['page'] do |url|
        page.visit url
      end
      step "User clicks to set place" do
        check_element_path :xpath, Booking::PLACE_INPUT_EP, Booking::PLACE_INPUT_IL
        it.click_place
        sleep 5
      end
      step "User set place in input", "Barselona" do |value|
        check_element_path :xpath, Booking::SEARCH_PLACE_INPUT_EP, Booking::SEARCH_PLACE_INPUT_IL
        it.set_place value
      end

      step "User select city from dropown" do
        check_element_path :xpath, Booking::SELECT_CITY_EP, Booking::SELECT_CITY_IL
        it.click_to_select_city
      end

      step "User select data" do
        check_element_path :xpath, Booking::ACCEPT_EP, Booking::ACCEPT_IL
        it.click_to_accept
      end
      step "USer clicks to search " do
        check_element_path :xpath, Booking::SEARCH_BTN_EP, Booking::SEARCH_BTN_IL
        it.click_search_btn
      end
    end
  end
end