require_relative '../page_extension'

class GiftCardPage < PageExtension


  GIFT_CARDS_PAGE_IL = "//span[contains(text(),'New and noteworthy in Gift Cards')]"
  GIFT_CARDS_PAGE_TA = "amazon:gift_card_page:gift_cards_page"

  BIRTHDAY_IL = "//span[contains(text(),'Birthdays') and @class='nav-a-content']"
  BIRTHDAY_TA = "amazon:gift_card_page:birthdays"

  BIRTHDAY_EGIFT_CARDS_IL= "//p[contains(text(), 'Birthday eGift cards delivered instantly')]"
  BIRTHDAY_EGIFT_CARDS_TA= "amazon:gift_card_page:birthday_egift_cards_text"

  ANIMATED_EMAIL_IL = "//h2[text()='Animated email and text message delivery']"
  ANIMATED_EMAIL_TA = "amazon:gift_card_page:animated_email"

  SECOND_ANIMATED_EMAIL_IL = "//div[contains(@cel_widget_id, 'acsux-widgets_content-grid_merchandised-search-3_row8-col2')]"
  SECOND_ANIMATED_EMAIL_TA = "amazon:gift_card_page:second_animated_email"

  GIFT_CARD_DESIGN_IL = "//h4[contains(text(), '1. Gift card design')]"
  GIFT_CARD_DESIGN_TA = "amazon:gift_card_page:gift_card_design"

  ANIMATED_BTN_IL = "#gc-customization-type-button-Animated"
  ANIMATED_BTN_TA = "amazon:gift_card_page:animated_btn"

  AMOUNT_100_IL = "#gc-mini-picker-amount-4"
  AMOUNT_100_TA = "amazon:gift_card_page:amount_100"

  DELIVERY_TEXT_MESSAGE_BTN_IL = "#gc-delivery-mechanism-button-MobileSMS-announce"
  DELIVERY_TEXT_MESSAGE_BTN_TA = "amazon:gift_card_page:delivery_text_msg_btn"

  MOBILE_NUMBER_IL = "#gc-order-form-recipients-sms-input"
  MOBILE_NUMBER_TA = "amazon:gift_card_page:mobile_number"

  NAME_IL = "#gc-order-form-sms-senderName"
  NAME_TA = "amazon:gift_card_page:name_input"

  MESSAGE_IL = "#gc-order-form-sms-message"
  MESSAGE_TA = "amazon:gift_card_page:message_input"

  ADD_GIFT_TO_CARD_IL = "#gc-buy-box-atc"
  ADD_GIFT_TO_CARD_TA = "amazon:gift_card_page:add_gift_to_card"


  def should_see_gift_cards_page(key = nil)
    element = find_element(key, il_type: :xpath, tl: GIFT_CARDS_PAGE_TA, il: GIFT_CARDS_PAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_birthdays_btn(key = nil)
    find_element(key, il_type: :xpath, tl: BIRTHDAY_TA, il: BIRTHDAY_IL, check_path: $check_path).click
  end

  def should_see_birthday_egift_card(key = nil)
    element = find_element(key, il_type: :xpath, tl: BIRTHDAY_EGIFT_CARDS_TA, il: BIRTHDAY_EGIFT_CARDS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_animated_email(key = nil)
    element = find_element(key, il_type: :xpath, tl: ANIMATED_EMAIL_TA, il: ANIMATED_EMAIL_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_second_animated_email(key = nil)
    find_element(key, il_type: :xpath, tl: SECOND_ANIMATED_EMAIL_TA, il: SECOND_ANIMATED_EMAIL_IL, check_path: $check_path).click
  end

  def should_see_gift_card_design(key = nil)
    element = find_element(key, il_type: :xpath, tl: GIFT_CARD_DESIGN_TA, il: GIFT_CARD_DESIGN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_animated_btn(key = nil)
    find_element(key, il_type: :css, tl: ANIMATED_BTN_TA, il: ANIMATED_BTN_IL, check_path: $check_path).click
  end

  def click_amount_100_btn(key = nil)
    find_element(key, il_type: :css, tl: AMOUNT_100_TA, il: AMOUNT_100_IL, check_path: $check_path).click
    end

  def click_delivery_text_msg_btn(key = nil)
    find_element(key, il_type: :css, tl: DELIVERY_TEXT_MESSAGE_BTN_TA, il: DELIVERY_TEXT_MESSAGE_BTN_IL, check_path: $check_path).click
  end

  def fill_mobile_number(key = nil, value)
    find_element(key, il_type: :css, tl: MOBILE_NUMBER_TA, il: MOBILE_NUMBER_IL, check_path: $check_path).set(value)
    end

  def fill_name_input(key = nil, value)
    find_element(key, il_type: :css, tl: NAME_TA, il: NAME_IL, check_path: $check_path).set(value)
    end

  def fill_message_input(key = nil, value)
    find_element(key, il_type: :css, tl: MESSAGE_TA, il: MESSAGE_IL, check_path: $check_path).set(value)
  end

  def fill_add_gift_to_card(key = nil)
    find_element(key, il_type: :css, tl: ADD_GIFT_TO_CARD_TA, il: ADD_GIFT_TO_CARD_IL, check_path: $check_path).set(value)
  end

end
