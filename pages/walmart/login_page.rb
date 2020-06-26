require_relative '../page_extension'

class LoginPageWalmart < PageExtension


  EMAIL_IL = "#email"
  EMAIL_TA = "walmart:login_page:email"

  PASS_IL = "#password"
  PASS_TA = "walmart:login_page:password"

  SIGN_IN_BTN_IL = "(//button[@data-automation-id='signin-submit-btn'])[1]"
  SIGN_IN_BTN_TA = "walmart:login_page:signin_btn"

  SIGN_IN_TEXT_IL = "(//span[contains(text(), ' Sign in to your ')])"
  SIGN_IN_TEXT_TA = "walmart:login_page:signin_text"

  FORGOT_PASSWORD_IL = "//button[contains(@data-automation-id, 'forgot-password-link-btn')]"
  FORGOT_PASSWORD_TA = "walmart:login_page:forgot_password"

  KEEP_ME_SIGN_IN = "#remember-me"
  KEEP_ME_SIGN_TA = "walmart:login_page:keep_me_signin"

  HAVE_AN_ACCOUNT_IL = "(//span[contains(text(),'have an account?')])[1]"
  HAVE_AN_ACCOUNT_TA = "walmart:login_page:have_an_account"

  CREATE_ACCOUNT_BTN_IL = "//button[contains(@data-tl-id,'signin-sign-up-btn')]"
  CREATE_ACCOUNT_BTN_TA = "walmart:login_page:create_account"


  def fill_email_input(key = nil, value)
    find_element(key, il_type: :css, tl: EMAIL_TA, il: EMAIL_IL, check_path: $check_path).set(value)
  end

  def fill_password_input(key = nil, value)
    find_element(key, il_type: :css, tl: PASS_TA, il: PASS_IL, check_path: $check_path).set(value)
  end

  def click_signin_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SIGN_IN_BTN_TA, il: SIGN_IN_BTN_IL, check_path: $check_path).click
  end

  def should_see_signin_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: SIGN_IN_TEXT_TA, il: SIGN_IN_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_forgot_password(key = nil)
    element = find_element(key, il_type: :xpath, tl: FORGOT_PASSWORD_TA, il: FORGOT_PASSWORD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_keep_me_signin(key = nil)
    element = find_element(key, il_type: :css, tl: KEEP_ME_SIGN_TA, il: KEEP_ME_SIGN_IN, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_have_an_account(key = nil)
    element = find_element(key, il_type: :xpath, tl: HAVE_AN_ACCOUNT_TA, il: HAVE_AN_ACCOUNT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_create_account(key = nil)
    element = find_element(key, il_type: :xpath, tl: CREATE_ACCOUNT_BTN_TA, il: CREATE_ACCOUNT_BTN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end