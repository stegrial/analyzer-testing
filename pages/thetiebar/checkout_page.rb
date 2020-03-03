require 'spec_helper'
require_relative '../../helpers/special_methods'


class TheTiebarCheckoutPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage


  GUEST_CHECKOUT_IL = "(//button[contains(@id, 'Guest')])[1]"
  GUEST_CHECKOUT_TA = "thetiebar:checkout_page:guest_checkout"
  GUEST_CHECKOUT_EP = "EP:thetiebar:checkout_page:guest_checkout"

  GUEST_EMAIL_IL = "(//input[contains(@id, 'emailFieldGuest')])[1]"
  GUEST_EMAIL_TA = "thetiebar:checkout_page:guest_mail"
  GUEST_EMAIL_EP =  "EP:thetiebar:checkout_page:guest_mail"

  CONTINUE_AS_GUEST_IL = "(//button[contains(@id, 'emailButton')])[1]"
  CONTINUE_AS_GUEST_TA = "thetiebar:checkout_page:continue_as_guest"
  CONTINUE_AS_GUEST_EP = "EP:thetiebar:checkout_page:continue_as_guest"

  FIRST_NAME_IL = "//input[contains(@id, 'firstName')]"
  FIRST_NAME_TA = "thetiebar:checkout_page:first_name"
  FIRST_NAME_EP = "EP:thetiebar:checkout_page:first_name"

  LAST_NAME_IL = "//input[contains(@id, 'lastName')]"
  LAST_NAME_TA = "thetiebar:checkout_page:last_name"
  LAST_NAME_EP = "EP:thetiebar:checkout_page:last_name"

  COMPANY_IL = "//input[contains(@id, 'company')]"
  COMPANY_TA = "thetiebar:checkout_page:company"
  COMPANY_EP = "EP:thetiebar:checkout_page:company"

  COUNTRY_FIELD_IL = "//select[contains(@id, 'countrySelect')]"
  COUNTRY_FIELD_TA = "thetiebar:checkout_page:country"
  COUNTRY_FIELD_EP = "EP:thetiebar:checkout_page:country"

  ADDRESS_FIELD_IL = "//input[contains(@id, 'shippingAddress1')]"
  ADDRESS_FIELD_TA = "thetiebar:checkout_page:address"
  ADDRESS_FIELD_EP = "EP:thetiebar:checkout_page:address"

  SELECT_ADDRESS_IL = "(//div[contains(@class, 'cb-item')])[1]"
  SELECT_ADDRESS_TA = "thetiebar:checkout_page:select_address"
  SELECT_ADDRESS_EP = "EP:thetiebar:checkout_page:select_address"

  CONTINUE_TO_PAY_BTN_IL = "//button[contains(text(), 'Continue to Pay ›')]"
  CONTINUE_TO_PAY_BTN_TA = "thetiebar:checkout_page:continue_to_pay_btn"
  CONTINUE_TO_PAY_BTN_EP = "EP:thetiebar:checkout_page:continue_to_pay_btn"

  USE_ENTERED_ADDRESS_IL = "(//input[contains(@id, 'entered-address')])[1]"
  USE_ENTERED_ADDRESS_TA = "thetiebar:checkout_page:use_address"
  USE_ENTERED_ADDRESS_EP = "EP:thetiebar:checkout_page:use_address"

  CONTINUE_BTN_IL = "//button[text()='Continue']"
  CONTINUE_BTN_TA = "thetiebar:checkout_page:continue_btn"
  CONTINUE_BTN_EP = "EP:thetiebar:checkout_page:continue_btn"

  CREDIT_CARD_IL = "(//input[contains(@id, 'cardNumber')])[1]"
  CREDIT_CARD_TA = "thetiebar:checkout_page:credit_card"
  CREDIT_CARD_EP = "EP:thetiebar:checkout_page:credit_card"

  EXP_MONTH_IL = "(//input[contains(@id, 'expirationMonth')])[1]"
  EXP_MONTH_TA = "thetiebar:checkout_page:exp_month"
  EXP_MONTH_EP = "EP:thetiebar:checkout_page:exp_month"

  EXP_YEAR_IL = "(//input[contains(@id, 'expirationYear')])[1]"
  EXP_YEAR_TA = "thetiebar:checkout_page:exp_year"
  EXP_YEAR_EP = "EP:thetiebar:checkout_page:exp_year"

  BILLING_ZIP_IL = "(//input[contains(@id, 'billingZip')])[1]"
  BILLING_ZIP_TA = "thetiebar:checkout_page:billing_zip"
  BILLING_ZIP_EP = "EP:thetiebar:checkout_page:billing_zip"

  CVC_CVV_IL = "(//input[contains(@id, 'cvv')])[1]"
  CVC_CVV_TA = "thetiebar:checkout_page:cvc_cvv"
  CVC_CVV_EP = "EP:thetiebar:checkout_page:cvc_cvv"

  CONTINUE_TO_REVIEW_BTN_IL = "//button[text()='Continue to Review ›']"
  CONTINUE_TO_REVIEW_BTN_TA = "thetiebar:checkout_page:continue_btn"
  CONTINUE_TO_REVIEW_BTN_EP = "EP:thetiebar:checkout_page:continue_btn"

  PLACE_ORDER_BTN_IL = "//div[text()='Place Order']"
  PLACE_ORDER_BTN_TA = "thetiebar:checkout_page:place_order_btn"
  PLACE_ORDER_BTN_EP = "EP:thetiebar:checkout_page:place_order_btn"

  def fill_first_name(key = nil, value)
    post_processing key do
      return find(ta(FIRST_NAME_EP)).set(value) if key == :ep
      return find(:xpath, FIRST_NAME_IL).set(value) if key == :il
      find(:xpath, ta(FIRST_NAME_TA, FIRST_NAME_IL)).set(value)
    end
  end

  def fill_last_name(key = nil, value)
    post_processing key do
      return find(ta(LAST_NAME_EP)).set(value) if key == :ep
      return find(:xpath, LAST_NAME_IL).set(value) if key == :il
      find(:xpath, ta(LAST_NAME_TA, LAST_NAME_IL)).set(value)
    end
  end

  def fill_company(key = nil, value)
    post_processing key do
      return find(ta(COMPANY_EP)).set(value) if key == :ep
      return find(:xpath, COMPANY_IL).set(value) if key == :il
      find(:xpath, ta(COMPANY_TA, COMPANY_IL)).set(value)
    end
  end

  def fill_country_field(key = nil, value)
    post_processing key do
      return find(ta(COUNTRY_FIELD_EP)).select(value) if key == :ep
      return find(:xpath, COUNTRY_FIELD_IL).select(value) if key == :il
      find(:xpath, ta(COUNTRY_FIELD_TA, COUNTRY_FIELD_IL)).select(value)
    end
  end

  def fill_address_field(key = nil, value)
    post_processing key do
      return find(ta(ADDRESS_FIELD_EP)).set(value) if key == :ep
      return find(:xpath, ADDRESS_FIELD_IL).set(value) if key == :il
      find(:xpath, ta(ADDRESS_FIELD_TA, ADDRESS_FIELD_IL)).set(value)
    end
  end

  def click_select_address_field(key = nil)
    post_processing key do
      return find(ta(SELECT_ADDRESS_EP)).click if key == :ep
      return find(:xpath, SELECT_ADDRESS_IL).click if key == :il
      find(:xpath, ta(SELECT_ADDRESS_TA, SELECT_ADDRESS_IL)).click
    end
  end

  def click_continue_to_pay_btn(key = nil)
    post_processing key do
      return find(ta(CONTINUE_TO_PAY_BTN_EP)).click if key == :ep
      return find(:xpath, CONTINUE_TO_PAY_BTN_IL).click if key == :il
      find(:xpath, ta(CONTINUE_TO_PAY_BTN_TA, CONTINUE_TO_PAY_BTN_IL)).click
    end
  end

  def click_use_entered_address(key = nil)
    post_processing key do
      return find(ta(USE_ENTERED_ADDRESS_EP)).click if key == :ep
      return find(:xpath, USE_ENTERED_ADDRESS_IL).click if key == :il
      find(:xpath, ta(USE_ENTERED_ADDRESS_TA, USE_ENTERED_ADDRESS_IL)).click
    end
  end

  def click_continue_btn(key = nil)
    post_processing key do
      return find(ta(CONTINUE_BTN_EP)).click if key == :ep
      return find(:xpath, CONTINUE_BTN_IL).click if key == :il
      find(:xpath, ta(CONTINUE_BTN_TA, CONTINUE_BTN_IL)).click
    end
  end

  def fill_credit_card_field(key = nil, value)
    post_processing key do
      return find(ta(CREDIT_CARD_EP)).set(value) if key == :ep
      return find(:xpath, CREDIT_CARD_IL).set(value) if key == :il
      find(:xpath, ta(CREDIT_CARD_TA, CREDIT_CARD_IL)).set(value)
    end
  end

  def fill_exp_month_field(key = nil, value)
    post_processing key do
      return find(ta(EXP_MONTH_EP)).set(value) if key == :ep
      return find(:xpath, EXP_MONTH_IL).set(value) if key == :il
      find(:xpath, ta(EXP_MONTH_TA, EXP_MONTH_IL)).set(value)
    end
  end

  def fill_exp_year_field(key = nil, value)
    post_processing key do
      return find(ta(EXP_YEAR_EP)).set(value) if key == :ep
      return find(:xpath, EXP_YEAR_IL).set(value) if key == :il
      find(:xpath, ta(EXP_YEAR_TA, EXP_YEAR_IL)).set(value)
    end
  end

  def fill_billing_zip_field(key = nil, value)
    post_processing key do
      return find(ta(BILLING_ZIP_EP)).set(value) if key == :ep
      return find(:xpath, BILLING_ZIP_IL).set(value) if key == :il
      find(:xpath, ta(BILLING_ZIP_TA, BILLING_ZIP_IL)).set(value)
    end
  end

  def fill_cvc_cvv_field(key = nil, value)
    post_processing key do
      return find(ta(CVC_CVV_EP)).set(value) if key == :ep
      return find(:xpath, CVC_CVV_IL).set(value) if key == :il
      find(:xpath, ta(CVC_CVV_TA, CVC_CVV_IL)).set(value)
    end
  end

  def click_continue_to_review(key = nil)
    post_processing key do
      return find(ta(CONTINUE_TO_REVIEW_BTN_EP)).click if key == :ep
      return find(:xpath, CONTINUE_TO_REVIEW_BTN_IL).click if key == :il
      find(:xpath, ta(CONTINUE_TO_REVIEW_BTN_TA, CONTINUE_TO_REVIEW_BTN_IL)).click
    end
  end

  def click_place_to_order(key = nil)
    post_processing key do
      return find(ta(PLACE_ORDER_BTN_EP)).click if key == :ep
      return find(:xpath, PLACE_ORDER_BTN_IL).click if key == :il
      find(:xpath, ta(PLACE_ORDER_BTN_TA, PLACE_ORDER_BTN_IL)).click
    end
  end

  def click_guest_checkout(key = nil)
    post_processing key do
      return find(ta(GUEST_CHECKOUT_EP)).click if key == :ep
      return find(:xpath, GUEST_CHECKOUT_IL).click if key == :il
      find(:xpath, ta(GUEST_CHECKOUT_TA, GUEST_CHECKOUT_IL)).click
    end
  end

  def fill_guest_email(key = nil, value)
    post_processing key do
      return find(ta(GUEST_EMAIL_EP)).set(value) if key == :ep
      return find(:xpath, GUEST_EMAIL_IL).set(value) if key == :il
      find(:xpath, ta(GUEST_EMAIL_TA, GUEST_EMAIL_IL)).set(value)
    end
  end

  def click_continue_as_guest(key = nil)
    post_processing key do
      return find(ta(CONTINUE_AS_GUEST_EP)).click if key == :ep
      return find(:xpath, CONTINUE_AS_GUEST_IL).click if key == :il
      find(:xpath, ta(CONTINUE_AS_GUEST_TA, CONTINUE_AS_GUEST_IL)).click
    end
  end

end