require_relative '../page_extension'

class LogInPage < PageExtension


  LOGIN_H1_IL = "//h1[@class='login-title']"
  LOGIN_H1_TA = "ta:login_page:login_title"

  USERNAME_INPUT_IL = "//input[@name='username']"
  USERNAME_INPUT_TA = "ta:login_page:username"

  PASS_INPUT_IL = "//input[@name='password']"
  PASS_INPUT_TA = "ta:login_page:pass"

  LOGIN_BTN_IL = "//button[@class='btn login-btn']"
  LOGIN_BTN_TA = "ta:login_page:login_btn"

  ERROR_MESSAGE_IL = "//div[@class='error-message-container error']/p"
  ERROR_MESSAGE_TA = "ta:login_page:error_message"

  FORGOT_PASS_IL = "//a[@href='forgot']"
  FORGOT_PASS_TA = "ta:login_page:forgot_pass"

  RESET_EMAIL_IL = "//input[@name='email']"
  RESET_EMAIL_TA = "ta:login_page:reset_email"

  RESET_BTN_IL = "//button[text()='Reset']"
  RESET_BTN_TA = "ta:login_page:reset_btn"

  ERROR_RESET_MSG_IL = "//p[text()='Email address you entered was not found.']"
  ERROR_RESET_MSG_TA = "ta:login_page:error_reset"

  SIGN_IN_BTN_IL = "//a[@href='signin']"
  SIGN_IN_BTN_TA = "ta:login_page:signin_btn"

  SIGN_UP_BTN_IL = "//a[@href='signup']"
  SIGN_UP_BTN_TA = "ta:login_page:signup_btn"


  def should_see_login_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: LOGIN_H1_TA, il: LOGIN_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_username_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: USERNAME_INPUT_TA, il: USERNAME_INPUT_IL, check_path: $check_path).set(value)
  end

  def fill_pass_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: PASS_INPUT_TA, il: PASS_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_login_btn(key = nil)
    find_element(key, il_type: :xpath, tl: LOGIN_BTN_TA, il: LOGIN_BTN_IL, check_path: $check_path).click
  end

  def should_see_error_message(key = nil)
    element = find_element(key, il_type: :xpath, tl: ERROR_MESSAGE_TA, il: ERROR_MESSAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_forgot_pass(key = nil)
    find_element(key, il_type: :xpath, tl: FORGOT_PASS_TA, il: FORGOT_PASS_IL, check_path: $check_path).click
  end

  def fill_reset_email(key = nil, value)
    find_element(key, il_type: :xpath, tl: RESET_EMAIL_TA, il: RESET_EMAIL_IL, check_path: $check_path).set(value)
  end

  def click_reset_btn(key = nil)
    find_element(key, il_type: :xpath, tl: RESET_BTN_TA, il: RESET_BTN_IL, check_path: $check_path).click
  end

  def should_see_error_reset_message(key = nil)
    element = find_element(key, il_type: :xpath, tl: ERROR_RESET_MSG_TA, il: ERROR_RESET_MSG_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_sign_in_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SIGN_IN_BTN_TA, il: SIGN_IN_BTN_IL, check_path: $check_path).click
  end

  def click_sign_up_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SIGN_UP_BTN_TA, il: SIGN_UP_BTN_IL, check_path: $check_path).click
  end

end
