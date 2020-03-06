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

  feature 'Store location page' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['location_page'] do |url|
        page.visit url
      end

      step "User clickbook appointment link" do
        locations_page.click_book_appointment_boston
      end

      step "User select day of appointment" do
        locations_page.click_day_appointment
      end

      step "User select time of appointment" do
        locations_page.click_time_appointment
      end

      step "User next button" do
        locations_page.click_next_btn_appointment
      end

      step "User fill first name", 'testFirstName' do |firstName|
        locations_page.fill_first_name firstName
      end

      step "User fill last name", 'testLastName' do |lastName|
        locations_page.fill_last_name lastName
      end

      step "User fill email", 'testEmail@gmail.com' do |email|
        locations_page.fill_email email
      end

      step "User fill mobile number", '943859433453' do |mobile|
        locations_page.fill_mobile mobile
      end

      step "User fill details textarea", 'test booking' do |details|
        locations_page.fill_details details
      end

      step "User next button" do
        locations_page.click_book_btn_appointment
      end

      step "User clicks on previous history button" do
        locations_page.should_see_pending_booking
      end
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['location_page'] do |url|
        page.visit url
      end

      step "User clickbook appointment link" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::BOOK_APPOINTMENT_TA, TheTiebarLocation::BOOK_APPOINTMENT_IL }
        locations_page.click_book_appointment_boston
      end

      step "User select day of appointment" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::DAY_APPOINTMENT_TA, TheTiebarLocation::DAY_APPOINTMENT_IL }
        locations_page.click_day_appointment
      end

      step "User select time of appointment" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::TIME_APPOINTMENT_TA, TheTiebarLocation::TIME_APPOINTMENT_IL }
        locations_page.click_time_appointment
      end

      step "User next button" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::NEXT_BUTTON_TA, TheTiebarLocation::NEXT_BUTTON_IL }
        locations_page.click_next_btn_appointment
      end

      step "User fill first name", 'testFirstName' do |firstName|
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::FIRST_NAME_TA, TheTiebarLocation::FIRST_NAME_IL }
        locations_page.fill_first_name firstName
      end

      step "User fill last name", 'testLastName' do |lastName|
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::LAST_NAME_TA, TheTiebarLocation::LAST_NAME_IL }
        locations_page.fill_last_name lastName
      end

      step "User fill email", 'testEmail@gmail.com' do |email|
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::EMAIL_TA, TheTiebarLocation::EMAIL_IL }
        locations_page.fill_email email
      end

      step "User fill mobile number", '943859433453' do |mobile|
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::MOBILE_PHONE_TA, TheTiebarLocation::MOBILE_PHONE_IL }
        locations_page.fill_mobile mobile
      end

      step "User fill details textarea", 'test booking' do |details|
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::SOME_DETAILS_TA, TheTiebarLocation::SOME_DETAILS_IL }
        locations_page.fill_details details
      end

      step "User next button" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::BOOK_BUTTON_TA, TheTiebarLocation::BOOK_BUTTON_IL }
        locations_page.click_book_btn_appointment
      end

      step "User clicks on previous history button" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::PENDING_BOOK_TA, TheTiebarLocation::PENDING_BOOK_IL }
        locations_page.should_see_pending_booking
      end

    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['location_page'] do |url|
        page.visit url
      end

      step "User clickbook appointment link" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::BOOK_APPOINTMENT_EP, TheTiebarLocation::BOOK_APPOINTMENT_IL }
        locations_page.click_book_appointment_boston :ep
      end

      step "User select day of appointment" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::DAY_APPOINTMENT_EP, TheTiebarLocation::DAY_APPOINTMENT_IL }
        locations_page.click_day_appointment :ep
      end

      step "User select time of appointment" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::TIME_APPOINTMENT_EP, TheTiebarLocation::TIME_APPOINTMENT_IL }
        locations_page.click_time_appointment :ep
      end

      step "User next button" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::NEXT_BUTTON_EP, TheTiebarLocation::NEXT_BUTTON_IL }
        locations_page.click_next_btn_appointment :ep
      end

      step "User fill first name", 'testFirstName' do |firstName|
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::FIRST_NAME_EP, TheTiebarLocation::FIRST_NAME_IL }
        locations_page.fill_first_name :ep, firstName
      end

      step "User fill last name", 'testLastName' do |lastName|
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::LAST_NAME_EP, TheTiebarLocation::LAST_NAME_IL }
        locations_page.fill_last_name :ep, lastName
      end

      step "User fill email", 'testEmail@gmail.com' do |email|
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::EMAIL_EP, TheTiebarLocation::EMAIL_IL }
        locations_page.fill_email :ep, email
      end

      step "User fill mobile number", '943859433453' do |mobile|
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::MOBILE_PHONE_EP, TheTiebarLocation::MOBILE_PHONE_IL }
        locations_page.fill_mobile :ep, mobile
      end

      step "User fill details textarea", 'test booking' do |details|
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::SOME_DETAILS_EP, TheTiebarLocation::SOME_DETAILS_IL }
        locations_page.fill_details :ep, details
      end

      step "User next button" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::BOOK_BUTTON_EP, TheTiebarLocation::BOOK_BUTTON_IL }
        locations_page.click_book_btn_appointment :ep
      end

      step "User clicks on previous history button" do
        within_frame(1) { check_element_path :xpath, TheTiebarLocation::PENDING_BOOK_EP, TheTiebarLocation::PENDING_BOOK_IL }
        locations_page.should_see_pending_booking :ep
      end
    end
  end
end