require_relative '../page_extension'

class SignInPage < PageExtension


  EMAIL_INPUT_IL = "#ap_email"
  EMAIL_INPUT_TA = "amazon:sign_in_page:email"

  CONTINUE_BTN_IL = ".a-button-inner > #continue"
  CONTINUE_BTN_TA = "amazon:sign_in_page:continue_btn"

  PASS_INPUT_IL = "#ap_password"
  PASS_INPUT_TA = "amazon:sign_in_page:password"

  SIGN_IN_BTN_IL = "#auth-signin-button"
  SIGN_IN_BTN_TA = "amazon:sign_in_page:sign_in_btn"

  EMAIL_TEXT_ROW_IL = "//label[contains(text(), 'Email')]"
  EMAIL_TEXT_ROW_TA = "amazon:sign_in_page:email_text"

  NEED_HELP_LINK_IL = "//span[contains(text(), 'Need help')]"
  NEED_HELP_LINK_TA = "amazon:sign_in_page:need_help"

  KEEP_ME_SIGN_IN_IL = "//span[contains(text(), 'Keep me signed in')]"
  KEEP_ME_SIGN_IN_TA = "amazon:sign_in_page:keep_signed_in"

  CHANGE_LINK_IL = "//a[contains(@id, 'ap_change_login_claim')]"
  CHANGE_LINK_TA = "amazon:sign_in_page:change_login"

  FORGOT_PASS_LINK_IL = "//a[contains(@id, 'auth-fpp-link-bottom')]"
  FORGOT_PASS_LINK_TA = "amazon:sign_in_page:forgot_pass"

  SIGN_IN_H1_IL = "//h1[contains(text(),'Sign-In')]"
  SIGN_IN_H1_TA = "amazon:sign_in_page:sign_in_h1"


  def fill_email_field(key = nil, value)
    find_element(key, il_type: :css, tl: EMAIL_INPUT_TA, il: EMAIL_INPUT_IL, check_path: $check_path).set(value)
  end

  def fill_password_field(key = nil, value)
    find_element(key, il_type: :css, tl: PASS_INPUT_TA, il: PASS_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_continue_btn(key = nil)
    find_element(key, il_type: :css, tl: CONTINUE_BTN_TA, il: CONTINUE_BTN_IL, check_path: $check_path).click
  end

  def click_sign_in_btn(key = nil)
    find_element(key, il_type: :css, tl: SIGN_IN_BTN_TA, il: SIGN_IN_BTN_IL, check_path: $check_path).click
  end

  def should_see_email_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: EMAIL_TEXT_ROW_TA, il: EMAIL_TEXT_ROW_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_need_help_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: NEED_HELP_LINK_TA, il: NEED_HELP_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_keep_signed_in(key = nil)
    element = find_element(key, il_type: :xpath, tl: KEEP_ME_SIGN_IN_TA, il: KEEP_ME_SIGN_IN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_change_login_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: CHANGE_LINK_TA, il: CHANGE_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_forgot_pass_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: FORGOT_PASS_LINK_TA, il: FORGOT_PASS_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_sign_in_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: SIGN_IN_H1_TA, il: SIGN_IN_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
