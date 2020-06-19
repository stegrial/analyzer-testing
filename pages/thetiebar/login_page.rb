require_relative '../page_extension'

class TheTiebarLoginPage < PageExtension

  USERNAME_IL = "//input[contains(@id, 'Username')]"
  USERNAME_TA = "thetiebar:login_page:Username"

  LOGIN_PASS_IL = "//input[contains(@id, 'LoginPassword')]"
  LOGIN_PASS_TA = "thetiebar:login_page:login_pass"

  SIGN_IN_IL = "//button[@id='btnSignIn']"
  SIGN_IN_TA = "thetiebar:login_page:signIn"

  CREATE_ACCOUNT_TAB_IL = "//a[contains(text(), 'Create an Account')]"
  CREATE_ACCOUNT_TAB_TA = "thetiebar:login_page:create_acc_tab"

  FIRST_NAME_IL = "//input[contains(@id, 'FirstName')]"
  FIRST_NAME_TA = "thetiebar:login_page:first_name"

  LAST_NAME_IL = "//input[contains(@id, 'LastName')]"
  LAST_NAME_TA = "thetiebar:login_page:last_name"

  EMAIL_IL = "//input[contains(@id, 'Email')]"
  EMAIL_TA = "thetiebar:login_page:email"

  PASSWORD_IL = "//input[(@id='Password')]"
  PASSWORD_TA = "thetiebar:login_page:password"

  CONFIRM_PASSWORD_IL = "//input[contains(@id, 'ConfirmPassword')]"
  CONFIRM_PASSWORD_TA = "thetiebar:login_page:confirm_password"

  OPTION_INPUT_IL = "//input[contains(@id, 'OptIn')]"
  OPTION_INPUT_TA = "thetiebar:login_page:option_checkbox"

  CREATE_ACCOUNT_BTN_IL = "//button[@id='signupButton']"
  CREATE_ACCOUNT_BTN_TA = "thetiebar:login_page:create_acc"


  def fill_username_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: USERNAME_TA, il: USERNAME_IL, check_path: $check_path).set(value)
  end

  def fill_login_password(key = nil, value)
    find_element(key, il_type: :xpath, tl: LOGIN_PASS_TA, il: LOGIN_PASS_IL, check_path: $check_path).set(value)
  end

  def click_sing_in(key = nil)
    find_element(key, il_type: :xpath, tl: SIGN_IN_TA, il: SIGN_IN_IL, check_path: $check_path).click
  end

  def click_create_acc_tab(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_ACCOUNT_TAB_TA, il: CREATE_ACCOUNT_TAB_IL, check_path: $check_path).click
  end

  def fill_first_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: FIRST_NAME_TA, il: FIRST_NAME_IL, check_path: $check_path).set(value + SecureRandom.hex(3))
  end

  def fill_last_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: LAST_NAME_TA, il: LAST_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_email(key = nil, value)
    find_element(key, il_type: :xpath, tl: EMAIL_TA, il: EMAIL_IL, check_path: $check_path).set(SecureRandom.hex(3) + value)
  end

  def fill_password(key = nil, value)
    find_element(key, il_type: :xpath, tl: PASSWORD_TA, il: PASSWORD_IL, check_path: $check_path).set(value)
  end

  def fill_confirm_password(key = nil, value)
    find_element(key, il_type: :xpath, tl: CONFIRM_PASSWORD_TA, il: CONFIRM_PASSWORD_IL, check_path: $check_path).set(value)
  end

  def click_uncheck_checkbox(key = nil)
    find_element(key, il_type: :xpath, tl: OPTION_INPUT_TA, il: OPTION_INPUT_IL, check_path: $check_path).click
  end

  def click_create_acc_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_ACCOUNT_BTN_TA, il: CREATE_ACCOUNT_BTN_IL, check_path: $check_path).click
  end

end
