require 'spec_helper'
require_relative '../page_extension'

class VenusLogin < PageExtension

  EMAIL_FIELD_IL = "ctl00_Body1_loginemail"
  EMAIL_FIELD_TA = 'venus:login_page:email_field'

  PASS_FIELD_IL = "ctl00_Body1_loginpassword"
  PASS_FIELD_TA = 'venus:login_page:pass_field'

  SIGN_IN_BTN_IL = 'ctl00_Body1_loginbutton'
  SIGN_IN_BTN_TA = 'venus:login_page:sign_in_btn'

  CREATE_ACCOUNT_BTN_IL = "//a[text()='Create Account']"
  CREATE_ACCOUNT_BTN_TA = 'venus:login_page:create_account_btn'


  def fill_email_field(key = nil, email)
    find_element(key, il_type: :id, tl: EMAIL_FIELD_TA, il: EMAIL_FIELD_IL, check_path: $check_path).fill_in with: email
  end

  def fill_pass_field(key = nil, pass)
    find_element(key, il_type: :id, tl: PASS_FIELD_TA, il: PASS_FIELD_IL, check_path: $check_path).fill_in with: pass
  end

  def click_sign_in_button(key = nil)
    find_element(key, il_type: :id, tl: SIGN_IN_BTN_TA, il: SIGN_IN_BTN_IL, check_path: $check_path).click
  end

  def click_create_account_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_ACCOUNT_BTN_TA, il: CREATE_ACCOUNT_BTN_IL, check_path: $check_path).click
  end

end
