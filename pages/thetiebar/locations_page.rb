require 'spec_helper'
require_relative '../../helpers/special_methods'


class TheTiebarLocation

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage


  BOOK_APPOINTMENT_IL = "//a[contains(@title, 'Boston store')]"
  BOOK_APPOINTMENT_TA = "thetiebar:location_page:book_appointment_in_Boston"
  BOOK_APPOINTMENT_EP = "EP:thetiebar:location_page:book_appointment_in_Boston"

  DAY_APPOINTMENT_IL = "(//a[contains(@class, 'ui-state-default')])[20]"
  DAY_APPOINTMENT_TA = "thetiebar:location_page:day_appointment"
  DAY_APPOINTMENT_EP = "EP:thetiebar:location_page:day_appointment"

  TIME_APPOINTMENT_IL = "(//label[contains(@class, 'select-list__item  ')])[2]"
  TIME_APPOINTMENT_TA = "thetiebar:location_page:time_appointment"
  TIME_APPOINTMENT_EP = "EP:thetiebar:location_page:time_appointment"

  NEXT_BUTTON_IL = "//button[contains(@class, 'btn-success')]"
  NEXT_BUTTON_TA = "thetiebar:location_page:next_btn_appointment"
  NEXT_BUTTON_EP = "EP:thetiebar:location_page:next_btn_appointment"

  BOOK_BUTTON_IL = "//button[contains(@class, 'btn-success')]"
  BOOK_BUTTON_TA = "thetiebar:location_page:book_btn_appointment"
  BOOK_BUTTON_EP = "EP:thetiebar:location_page:book_btn_appointment"

  FIRST_NAME_IL = "(//input[contains(@id, 'FirstName')])"
  FIRST_NAME_TA = "thetiebar:location_page:first_name"
  FIRST_NAME_EP = "EP:thetiebar:location_page:first_name"

  LAST_NAME_IL = "(//input[contains(@id, 'LastName')])"
  LAST_NAME_TA = "thetiebar:location_page:last_name"
  LAST_NAME_EP = "EP:thetiebar:location_page:last_name"

  EMAIL_IL = "(//input[contains(@id, 'Email')])"
  EMAIL_TA = "thetiebar:location_page:email"
  EMAIL_EP = "EP:thetiebar:location_page:email"

  MOBILE_PHONE_IL = "(//input[@id='Mobile'])"
  MOBILE_PHONE_TA = "thetiebar:location_page:mobile"
  MOBILE_PHONE_EP = "EP:thetiebar:location_page:mobile"

  SOME_DETAILS_IL = "//textarea[contains(@id, 'BookingQuestionResponse')]"
  SOME_DETAILS_TA = "thetiebar:location_page:details"
  SOME_DETAILS_EP = "EP:thetiebar:location_page:details"

  PENDING_BOOK_IL = "//p[contains(text(),'Your booking is pending.')]"
  PENDING_BOOK_TA = "thetiebar:location_page:pending_booking"
  PENDING_BOOK_EP = "EP:thetiebar:location_page:pending_booking"


  def click_book_appointment_boston(key = nil)
    post_processing key do
      return find(ta(BOOK_APPOINTMENT_EP)).click if key == :ep
      return find(:xpath, BOOK_APPOINTMENT_IL).click if key == :il
      find(:xpath, ta(BOOK_APPOINTMENT_TA, BOOK_APPOINTMENT_IL)).click
    end
  end

  def click_day_appointment(key = nil)
    post_processing key do
      within_frame(1) do
        return find(ta(DAY_APPOINTMENT_EP)).click if key == :ep
        return find(:xpath, DAY_APPOINTMENT_IL).click if key == :il
        find(:xpath, ta(DAY_APPOINTMENT_TA, DAY_APPOINTMENT_IL)).click
      end
    end
  end

  def click_time_appointment(key = nil)
    post_processing key do
      within_frame(1) do
        return find(ta(TIME_APPOINTMENT_EP)).click if key == :ep
        return find(:xpath, TIME_APPOINTMENT_IL).click if key == :il
        find(:xpath, ta(TIME_APPOINTMENT_TA, TIME_APPOINTMENT_IL)).click
      end
    end
  end

  def click_next_btn_appointment(key = nil)
    post_processing key do
      within_frame(1) do
        return find(ta(NEXT_BUTTON_EP)).click if key == :ep
        return find(:xpath, NEXT_BUTTON_IL).click if key == :il
        find(:xpath, ta(NEXT_BUTTON_TA, NEXT_BUTTON_IL)).click
      end
    end
  end

  def click_book_btn_appointment(key = nil)
    post_processing key do
      within_frame(1) do
        return find(ta(BOOK_BUTTON_EP)).click if key == :ep
        return find(:xpath, BOOK_BUTTON_IL).click if key == :il
        find(:xpath, ta(BOOK_BUTTON_TA, BOOK_BUTTON_IL)).click
      end
    end
  end

  def fill_first_name(key = nil, value)
    post_processing key do
      within_frame(1) do
        return find(ta(FIRST_NAME_EP)).set(value) if key == :ep
        return find(:xpath, FIRST_NAME_IL).set(value) if key == :il
        find(:xpath, ta(FIRST_NAME_TA, FIRST_NAME_IL)).set(value)
      end
    end
  end

  def fill_last_name(key = nil, value)
    post_processing key do
      within_frame(1) do
        return find(ta(LAST_NAME_EP)).set(value) if key == :ep
        return find(:xpath, LAST_NAME_IL).set(value) if key == :il
        find(:xpath, ta(LAST_NAME_TA, LAST_NAME_IL)).set(value)
      end
    end
  end

  def fill_email(key = nil, value)
    post_processing key do
      within_frame(1) do
        return find(ta(EMAIL_EP)).set(value) if key == :ep
        return find(:xpath, EMAIL_IL).set(value) if key == :il
        find(:xpath, ta(EMAIL_TA, EMAIL_IL)).set(value)
      end
    end
  end

  def fill_mobile(key = nil, value)
    post_processing key do
      within_frame(1) do
        return find(ta(MOBILE_PHONE_EP)).set(value) if key == :ep
        return find(:xpath, MOBILE_PHONE_IL).set(value) if key == :il
        find(:xpath, ta(MOBILE_PHONE_TA, MOBILE_PHONE_IL)).set(value)
      end
    end
  end

  def fill_details(key = nil, value)
    post_processing key do
      within_frame(1) do
        return find(ta(SOME_DETAILS_EP)).set(value) if key == :ep
        return find(:xpath, SOME_DETAILS_IL).set(value) if key == :il
        find(:xpath, ta(SOME_DETAILS_TA, SOME_DETAILS_IL)).set(value)
      end
    end
  end

  def should_see_pending_booking(key = nil)
    post_processing key do
      within_frame(1) do
        return assert_selector(ta(PENDING_BOOK_EP)) if key == :ep
        return assert_selector(:xpath, PENDING_BOOK_IL) if key == :il
        assert_selector(:xpath, ta(PENDING_BOOK_TA, PENDING_BOOK_IL))
      end
    end
  end

end