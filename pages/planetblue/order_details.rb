require_relative '../page_extension'

class OrderDetails < PageExtension

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

  def should_see_payment_button(key = nil, payment_type)
    element = find_element key, il_type: :css, tl: payment_button(:ta, payment_type),
                 il: payment_button(:il, payment_type), check_path: $check_path
    expect(element).to be_visible
  end

  def click_toggle_order_button(key = nil)
    find_element(key, il_type: :css, tl: TOGGLE_ORDER_BUTTON_TA, il: TOGGLE_ORDER_BUTTON_IL,
                 check_path: $check_path).click
  end

  def should_see_payment_login_link(key = nil)
    element = find_element key, il_type: :css, tl: PAYMENT_LOGIN_LINK_TA,
                 il: PAYMENT_LOGIN_LINK_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def should_see_payment_email_field(key = nil)
    element = find_element key, il_type: :css, tl: PAYMENT_EMAIL_FIELD_TA,
                           il: PAYMENT_EMAIL_FIELD_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def should_see_payment_news_checkbox(key = nil)
    element = find_element key, il_type: :css, tl: PAYMENT_NEWS_CHECKBOX_TA,
                           il: PAYMENT_NEWS_CHECKBOX_IL, check_path: $check_path
    expect(element).to be_visible
  end

  def order_field(key, name)
    locator_by key, "#BillingAddressFormContainer [placeholder='#{name}']",
               "planetblue:order_details:order_field:#{ta_name(name)}:field"
  end

  def should_see_order_field(key = nil, name)
    within_frame 'Intrnl_CO_Container' do
      element = find_element key, il_type: :css, tl: order_field(:ta, name),
                             il: order_field(:il, name), check_path: $check_path
      expect(element).to be_visible
    end
  end

  def should_see_pay_button(key = nil)
    within_frame 'Intrnl_CO_Container' do
      element = find_element(key, il_type: :css, tl: PAY_BUTTON_TA,
                             il: PAY_BUTTON_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

end