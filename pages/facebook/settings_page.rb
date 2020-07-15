require_relative '../page_extension'

class SettingsPageFacebook < PageExtension


  EDIT_NAME_IL = "(//span[contains(@class, 'fbSettingsListItemEditText')])[1]"
  EDIT_NAME_TA = "facebook:setting_page:edit_name_btn"

  NAME_FIELD_IL = "//input[@name='primary_first_name']"
  NAME_FIELD_TA = "facebook:setting_page:name_field"

  CANCEL_NAME_EDIT_IL = "//button[contains(@class, 'cancel')]"
  CANCEL_NAME_EDIT_TA = "facebook:setting_page:cancel_name_edit"

  EDIT_CONTACT_IL= "(//span[contains(@class, 'fbSettingsListItemEditText')])[3]"
  EDIT_CONTACT_TA= "facebook:setting_page:edit_contact"

  USER_EMAIL_IL = "//span[contains(text(), 'eshapovalov298@gmail.com')]"
  USER_EMAIL_TA = "facebook:setting_page:user_email"

  CLOSE_CONTACT_BTN_IL = "//label[contains(@class, 'cancel')]"
  CLOSE_CONTACT_BTN_TA = "facebook:setting_page:close_contact_btn"

  MEMORIALIZATION_SETTINGS_IL= "(//span[contains(@class, 'fbSettingsListItemEditText')])[5]"
  MEMORIALIZATION_SETTINGS_TA= "facebook:setting_page:memorialization_settings"

  YOUR_LEGACY_CONTACT_IL = "//div[contains(text(), 'Your Legacy Contact')]"
  YOUR_LEGACY_CONTACT_TA = "facebook:setting_page:your_legacy_contact_text"

  CLOSE_MEMORIALIZATION_BTN_IL = "//label[contains(@class, 'cancel')]"
  CLOSE_MEMORIALIZATION_BTN_TA = "facebook:setting_page:close_memorialization_settings"

  def click_edit_name_button(key = nil)
    find_element(key, il_type: :xpath, tl: EDIT_NAME_TA, il: EDIT_NAME_IL, check_path: $check_path).click
  end

  def should_see_name_field(key = nil)
    element = find_element(key, il_type: :xpath, tl: NAME_FIELD_TA, il: NAME_FIELD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_cancel_name_edit_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CANCEL_NAME_EDIT_TA, il: CANCEL_NAME_EDIT_IL, check_path: $check_path).click
  end

  def click_edit_contact_btn(key = nil)
    find_element(key, il_type: :xpath, tl: EDIT_CONTACT_TA, il: EDIT_CONTACT_IL, check_path: $check_path).click
  end

  def should_see_user_email(key = nil)
    element = find_element(key, il_type: :xpath, tl: USER_EMAIL_TA, il: USER_EMAIL_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_close_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_CONTACT_BTN_TA, il: CLOSE_CONTACT_BTN_IL, check_path: $check_path).click
  end

  def click_memorialization_settings(key = nil)
    find_element(key, il_type: :xpath, tl: MEMORIALIZATION_SETTINGS_TA, il: MEMORIALIZATION_SETTINGS_IL, check_path: $check_path).click
  end

  def should_see_your_legacy_contact(key = nil)
    element = find_element(key, il_type: :xpath, tl: YOUR_LEGACY_CONTACT_TA, il: YOUR_LEGACY_CONTACT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_close_memorialization_settings(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_MEMORIALIZATION_BTN_TA, il: CLOSE_MEMORIALIZATION_BTN_IL, check_path: $check_path).click
  end

end