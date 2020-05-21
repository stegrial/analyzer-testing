require_relative '../page_extension'

class AccessibilityInterfacePage < PageExtension

  ACCESSIBILITY_INTERFACE_IL = "//div[contains(@aria-label, 'Accessibility Interface')]"
  ACCESSIBILITY_INTERFACE_TA = "annieselke:accessibility_interface_page:accessibility_interface"

  LANGUAGE_IL = "//a[contains(@class, 'acsb-option-language')]"
  LANGUAGE_TA = "annieselke:accessibility_interface_page:language"

  CLOSE_LANGUAGE_LIST_IL = "//span[@data-acsb-popup-close='acsb-language-popup']"
  CLOSE_LANGUAGE_LIST_TA = "annieselke:accessibility_interface_page:close_language_list"

  HIDE_INTERFACE_IL = "//a[contains(@data-acsb-tooltip, 'Hide')]"
  HIDE_INTERFACE_TA = "annieselke:accessibility_interface_page:hide_interface"

  CANCEL_BTN_IL = "//div[@class='acsb-buttons']/*[contains(text(), 'Cancel')]"
  CANCEL_BTN_TA = "annieselke:accessibility_interface_page:hide_interface"

  CHANGE_INTERFACE_POSITION_IL = "//a[contains(@aria-label, 'Change Accessibility Interface Position')]"
  CHANGE_INTERFACE_POSITION_TA = "annieselke:accessibility_interface_page:change_interface_position"

  STOP_ANIMATIONS_IL = "//div[contains(@data-acsb-tooltip, 'Stop Animations')]"
  STOP_ANIMATIONS_TA = "annieselke:accessibility_interface_page:stop_animations"

  READABLE_FONT_IL = "//div[contains(@class, 'acsb-action-box-readableFont')]"
  READABLE_FONT_TA = "annieselke:accessibility_interface_page:readable_font"

  INVERT_CONTRAST_IL = "//div[contains(@class, 'acsb-action-box-invertContrast')]"
  INVERT_CONTRAST_TA = "annieselke:accessibility_interface_page:invert_contrast"

  FEEDBACK_IL = "//li[contains(@aria-label, 'Feedback')]"
  FEEDBACK_TA = "annieselke:accessibility_interface_page:feedback"

  FULL_NAME_IL = "//input[contains(@id, 'acsbForm_tmp[name]')]"
  FULL_NAME_TA = "annieselke:accessibility_interface_page:full_name"

  EMAIL_ADDRESS_IL = "//input[contains(@id, 'acsbForm_tmp[email]')]"
  EMAIL_ADDRESS_TA = "annieselke:accessibility_interface_page:email_address"

  PHONE_NUMBER_IL = "//input[contains(@id, 'acsbForm_tmp[phone]')]"
  PHONE_NUMBER_TA = "annieselke:accessibility_interface_page:phone_number"

  YOUR_FEEDBACK_IL = "//textarea[contains(@id, 'acsbForm_tmp[message]')]"
  YOUR_FEEDBACK_TA = "annieselke:accessibility_interface_page:your_feedback"

  SEND_FEEDBACK_BTN_IL = "//button[contains(@class, 'acsb-button-colorized')]"
  SEND_FEEDBACK_BTN_TA = "annieselke:accessibility_interface_page:send_feedback"

  CHECKBOX_AGREE_IL = "//input[contains(@id, 'acsbForm_tmp[agreement]')]"
  CHECKBOX_AGREE_TA = "annieselke:accessibility_interface_page:agreement"

  def click_accessibility_interface(key = nil)
    find_element(key, il_type: :xpath, tl: ACCESSIBILITY_INTERFACE_TA, il: ACCESSIBILITY_INTERFACE_IL, check_path: $check_path).click
  end

  def click_language(key = nil)
    find_element(key, il_type: :xpath, tl: LANGUAGE_TA, il: LANGUAGE_IL, check_path: $check_path).click
  end

  def click_close_language_list(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_LANGUAGE_LIST_TA, il: CLOSE_LANGUAGE_LIST_IL, check_path: $check_path).click
  end

  def click_hide_interface(key = nil)
    find_element(key, il_type: :xpath, tl: HIDE_INTERFACE_TA, il: HIDE_INTERFACE_IL, check_path: $check_path).click
  end

  def click_cancel_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CANCEL_BTN_TA, il: CANCEL_BTN_IL, check_path: $check_path).click
  end

  def click_interface_position(key = nil)
    find_element(key, il_type: :xpath, tl: CHANGE_INTERFACE_POSITION_TA, il: CHANGE_INTERFACE_POSITION_IL, check_path: $check_path).click
  end

  def click_stop_animations(key = nil)
    find_element(key, il_type: :xpath, tl: STOP_ANIMATIONS_TA, il: STOP_ANIMATIONS_IL, check_path: $check_path).click
  end

  def click_readable_font(key = nil)
    find_element(key, il_type: :xpath, tl: READABLE_FONT_TA, il: READABLE_FONT_IL, check_path: $check_path).click
  end

  def click_invert_contrast(key = nil)
    find_element(key, il_type: :xpath, tl: INVERT_CONTRAST_TA, il: INVERT_CONTRAST_IL, check_path: $check_path).click
  end

  def click_feedback(key = nil)
    find_element(key, il_type: :xpath, tl: FEEDBACK_TA, il: FEEDBACK_IL, check_path: $check_path).click
  end

  def fill_full_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: FULL_NAME_TA, il: FULL_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_email_address(key = nil, value)
    find_element(key, il_type: :xpath, tl: EMAIL_ADDRESS_TA, il: EMAIL_ADDRESS_IL, check_path: $check_path).set(value)
  end

  def fill_phone_number(key = nil, value)
    find_element(key, il_type: :xpath, tl: PHONE_NUMBER_TA, il: PHONE_NUMBER_IL, check_path: $check_path).set(value)
  end

  def fill_your_feedback(key = nil, value)
    find_element(key, il_type: :xpath, tl: YOUR_FEEDBACK_TA, il: YOUR_FEEDBACK_IL, check_path: $check_path).set(value)
  end

  def click_agreement_checkbox(key = nil)
    find_element(key, il_type: :xpath, tl: CHECKBOX_AGREE_TA, il: CHECKBOX_AGREE_IL, check_path: $check_path).click
  end

  def click_send_feedback(key = nil)
    find_element(key, il_type: :xpath, tl: SEND_FEEDBACK_BTN_TA, il: SEND_FEEDBACK_BTN_IL, check_path: $check_path).click
  end

end

