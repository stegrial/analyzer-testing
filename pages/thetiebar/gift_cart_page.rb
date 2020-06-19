require_relative '../page_extension'

class TheTiebarGiftCartPage < PageExtension

  AMOUNT_100_IL = "//span[text()='$100']"
  AMOUNT_100_TA = "thetiebar:gifr_page:100bucks"

  CUSTOM_AMOUNT_IL = "//span[text()='Custom']"
  CUSTOM_AMOUNT_TA = "thetiebar:gifr_page:custom"

  CUSTOM_INPUT_IL = "//input[@placeholder='$']"
  CUSTOM_INPUT_TA = "thetiebar:gifr_page:custom_input"

  SENDER_NAME_IL = "//input[@id='gcSenderName']"
  SENDER_NAME_TA = "thetiebar:gifr_page:sender_name"

  RECIPIENT_NAME_IL = "//input[@id='gcRecipientName']"
  RECIPIENT_NAME_TA = "thetiebar:gifr_page:recipient_name"

  RECIPIENT_EMAIL_IL = "//input[@id='gcRecipientEmail']"
  RECIPIENT_EMAIL_TA = "thetiebar:gifr_page:recipient_email"

  GIFT_MESSAGE_IL = "//textarea[@id='giftMessage']"
  GIFT_MESSAGE_TA = "thetiebar:gifr_page:gift_message"

  ADD_E_GIFT_CART_IL = "//button[contains(@class,'addToCartCtaOuter')]"
  ADD_E_GIFT_CART_TA = "thetiebar:gifr_page:add_e_gift_card"


  def click_amount_100(key = nil)
    find_element(key, il_type: :xpath, tl: AMOUNT_100_TA, il: AMOUNT_100_IL, check_path: $check_path).click
  end

  def click_custom_amount(key = nil)
    find_element(key, il_type: :xpath, tl: CUSTOM_AMOUNT_TA, il: CUSTOM_AMOUNT_IL, check_path: $check_path).click
  end

  def fill_custom_input_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: CUSTOM_INPUT_TA, il: CUSTOM_INPUT_IL, check_path: $check_path).set(value)
  end

  def fill_sender_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: SENDER_NAME_TA, il: SENDER_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_recipient_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: RECIPIENT_NAME_TA, il: RECIPIENT_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_recipient_email(key = nil, value)
    find_element(key, il_type: :xpath, tl: RECIPIENT_EMAIL_TA, il: RECIPIENT_EMAIL_IL, check_path: $check_path).set(value)
  end

  def fill_gift_message(key = nil, value)
    find_element(key, il_type: :xpath, tl: GIFT_MESSAGE_TA, il: GIFT_MESSAGE_IL, check_path: $check_path).set(value)
  end

  def click_add_e_gift_card(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_E_GIFT_CART_TA, il: ADD_E_GIFT_CART_IL, check_path: $check_path).click
  end

end
