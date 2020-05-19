require 'spec_helper'
require_relative '../page_extension'

class OrderDetails

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  ORDER_HEADER_TITLE_TA = "planetblue:order_details:header"
  ORDER_HEADER_TITLE_IL = ".account-menu__title"

  TOGGLE_ORDER_BUTTON_TA = "planetblue:order_details:toggle_order_button"
  TOGGLE_ORDER_BUTTON_IL = "button.order-summary-toggle"

  PAYMENT_LOGIN_LINK_TA = "planetblue:order_details:payment_login_link"
  PAYMENT_LOGIN_LINK_IL = "a[data-trekkie-id='have_an_account_login_link']"

  PAYMENT_EMAIL_FIELD_TA = "planetblue:order_details:payment_email_field"
  PAYMENT_EMAIL_FIELD_IL = "input[data-trekkie-id='email_field']"

  PAYMENT_NEWS_CHECKBOX_TA = "planetblue:order_details:payment_news_checkbox"
  PAYMENT_NEWS_CHECKBOX_IL = "input[data-trekkie-id='buyer_accepts_marketing_field']"

  PAY_BUTTON_TA = "planetblue:order_details:continue_button"
  PAY_BUTTON_IL = "#btnPay"

  INPUT_FIELD_WITH_LINK_TA = "planetblue:order_details:input_field_with_link"
  INPUT_FIELD_WITH_LINK_IL = "input.giftreggie-permalink.form-control"

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

  def click_toggle_order_button(key = nil)
    find_element_path(key, :css, TOGGLE_ORDER_BUTTON_TA, TOGGLE_ORDER_BUTTON_IL).click
  end

  def find_payment_login_link(key = nil)
    find_element_path key, :css, PAYMENT_LOGIN_LINK_TA, PAYMENT_LOGIN_LINK_IL
  end

  def find_payment_email_field(key = nil)
    find_element_path key, :css, PAYMENT_EMAIL_FIELD_TA, PAYMENT_EMAIL_FIELD_IL
  end

  def find_payment_news_checkbox(key = nil)
    find_element_path key, :css, PAYMENT_NEWS_CHECKBOX_TA, PAYMENT_NEWS_CHECKBOX_IL
  end

  def order_field(key, name)
    locator_by key, "#BillingAddressFormContainer [placeholder='#{name}']",
               "planetblue:order_details:order_field:#{ta_name(name)}:field"
  end

  def find_order_field(key = nil, name)
    within_frame 'Intrnl_CO_Container' do
      find_element_path key, :css, order_field(:ta, name), order_field(:il, name)
    end
  end

  def find_pay_button(key = nil)
    within_frame 'Intrnl_CO_Container' do
      find_element_path(key, :css, PAY_BUTTON_TA, PAY_BUTTON_IL)
    end
  end

  def find_order_header(key = nil)
    find_element_path(key, :css, ORDER_HEADER_TITLE_TA, ORDER_HEADER_TITLE_IL).click
  end

end