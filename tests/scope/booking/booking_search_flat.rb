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
  sleep 5

    end
  end
end