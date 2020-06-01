require_relative '../page_extension'

class Login < PageExtension

  EMAIL_FIELD_TA = "planetblue:login:email_field"
  EMAIL_FIELD_IL = "#customer_login input[type='email']"

  PASSWORD_FIELD_TA = "planetblue:login:password_field"
  PASSWORD_FIELD_IL = "#customer_login input[type='password']"

  SIGN_IN_BUTTON_TA = "planetblue:login:sign_in_button"
  SIGN_IN_BUTTON_IL = "#customer_login [type='submit']"

  def fill_email_field(key = nil, value)
    find_element(key, il_type: :css, tl: EMAIL_FIELD_TA, il: EMAIL_FIELD_IL, check_path: $check_path).fill_in with: value
  end

  def fill_password_field(key = nil, value)
    find_element(key, il_type: :css, tl: PASSWORD_FIELD_TA, il: PASSWORD_FIELD_IL, check_path: $check_path).fill_in with: value
  end

  def click_sign_in_button(key = nil)
    find_element(key, il_type: :css, tl: SIGN_IN_BUTTON_TA, il: SIGN_IN_BUTTON_IL, check_path: $check_path).click
  end

end