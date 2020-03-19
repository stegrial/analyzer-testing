require 'spec_helper'
require_relative '../page_extension'

class OrderDetails

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  def payment_button(key, payment_type)
    case payment_type
      when 'Google Pay' then selector = "[data-testid='GooglePay-button']"
      when 'PayPal' then selector = "[data-testid='GooglePay-button']"
      when 'Amazon Pay' then selector = "[action='https://payments.amazon.com/checkout/signin']"
      else selector = "[data-testid='GooglePay-button']"
    end
    locator_by key, selector,"planetblue:order_details:payment_button:#{ta_name(payment_type)}"
  end

  def find_payment_button(key = nil, payment_type)
    find_element_path key, :css, payment_button(:ta, payment_type),
                      payment_button(:il, payment_type)
  end

  TOGGLE_ORDER_BUTTON_TA = "planetblue:order_details:toggle_order_button"
  TOGGLE_ORDER_BUTTON_IL = "button.order-summary-toggle"

  def click_toggle_order_button(key = nil)
    find_element_path(key, :css, TOGGLE_ORDER_BUTTON_TA, TOGGLE_ORDER_BUTTON_IL).click
  end

  PAYMENT_LOGIN_LINK_TA = "planetblue:order_details:payment_login_link"
  PAYMENT_LOGIN_LINK_IL = "a[data-trekkie-id='have_an_account_login_link']"

  def find_payment_login_link(key = nil)
    find_element_path key, :css, PAYMENT_LOGIN_LINK_TA, PAYMENT_LOGIN_LINK_IL
  end

  PAYMENT_EMAIL_FIELD_TA = "planetblue:order_details:payment_email_field"
  PAYMENT_EMAIL_FIELD_IL = "input[data-trekkie-id='email_field']"

  def find_payment_email_field(key = nil)
    find_element_path key, :css, PAYMENT_EMAIL_FIELD_TA, PAYMENT_EMAIL_FIELD_IL
  end

  PAYMENT_NEWS_CHECKBOX_TA = "planetblue:order_details:payment_news_checkbox"
  PAYMENT_NEWS_CHECKBOX_IL = "input[data-trekkie-id='buyer_accepts_marketing_field']"

  def find_payment_news_checkbox(key = nil)
    find_element_path key, :css, PAYMENT_NEWS_CHECKBOX_TA, PAYMENT_NEWS_CHECKBOX_IL
  end

  def order_field(key, name)
    locator_by key, "//input[@placeholder='#{name}']",
               "planetblue:order_details:order_field:#{ta_name(name)}:field}"
  end

  def find_order_field(key = nil, name)
    find_element_path key, :xpath, order_field(:ta, name), order_field(:il, name)
  end

  def order_alert_field(key, name)
    locator_by key, "//input[@placeholder='#{name}']//following::p[contains(@class, 'field__message--error')]",
               "planetblue:order_details:order_field:#{ta_name(name)}:alert}"
  end

  def find_order_alert_field(key = nil, name)
    find_element_path key, :xpath, order_field(:ta, name), order_field(:il, name)
  end

  CONTINUE_BUTTON_TA = "planetblue:order_details:continue_button"
  CONTINUE_BUTTON_IL = "#continue_button"

  def click_continue_button(key = nil)
    find_element_path(key, :css, CONTINUE_BUTTON_TA, CONTINUE_BUTTON_IL).click
  end

end