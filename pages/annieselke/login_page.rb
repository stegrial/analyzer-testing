require_relative '../page_extension'

class LoginPage < PageExtension

  EMAIL_FIELD_IL = "//input[@class='text']"
  EMAIL_FIELD_TA = "annieselke:login_page:email_input"
  
  PASS_FIELD_IL = "//input[@class='text password']"
  PASS_FIELD_TA = "annieselke:login_page:pass_input"

  FIRST_NAME_IL = "//input[@id='register.firstName']"
  FIRST_NAME_TA = "annieselke:login_page:first_name"

  LAST_NAME_IL = "//input[@id='register.lastName']"
  LAST_NAME_TA = "annieselke:login_page:last_name"

  EMAIL_IL = "//input[@id='register.email']"
  EMAIL_TA = "annieselke:login_page:email_register"

  PASS_IL = "//input[@id='password']"
  PASS_TA = "annieselke:login_page:pass_register"

  CONFIRM_PASS_IL = "//input[@id='register.checkPwd']"
  CONFIRM_PASS_TA = "annieselke:login_page:confirm_pass"

  LOGIN_BTN_IL = "//button[@class='primary actionSet']"
  LOGIN_BTN_TA = "annieselke:login_page:pass_input"

  FORGOTTEN_PASS_LINK_IL = "//a[@class='password-forgotten']"
  FORGOTTEN_PASS_LINK_TA ="annieselke:login_page:forgotten_pass_link"

  CREATE_NEW_ACCOUNT_ARROW_IL = "//h3[text()='Create an Account']"
  CREATE_NEW_ACCOUNT_ARROW_TA = "annieselke:login_page:create_new_account_arrow"

  DROPDOWN_ARROW_IL = "//select[@name='titleCode']"
  DROPDOWN_ARROW_TA = "annieselke:login_page:dropdown_arrow"

  REGISTER_BTN_IL = "//button[text()='Register']"
  REGISTER_BTN_TA = "annieselke:login_page:register_btn"


  def search_item(key, name)
    locator_by key,
               "//select[@name='titleCode']/option[@value='#{name}']",
               "annieselke:login_page:#{ta_name(name)}"
  end

  def fill_email_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: EMAIL_FIELD_TA, il: EMAIL_FIELD_IL, check_path: $check_path).set(value)
  end

  def fill_pass_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: PASS_FIELD_TA, il: PASS_FIELD_IL, check_path: $check_path).set(value)
  end

  def click_login_btn(key = nil)
    find_element(key, il_type: :xpath, tl: LOGIN_BTN_TA, il: LOGIN_BTN_IL, check_path: $check_path).click
  end

  def click_forgot_pass_link(key=nil)
    find_element(key, il_type: :xpath, tl: FORGOTTEN_PASS_LINK_TA, il: FORGOTTEN_PASS_LINK_IL, check_path: $check_path).click
  end

  def click_create_new_account_arrow (key=nil)
    find_element(key, il_type: :xpath, tl: CREATE_NEW_ACCOUNT_ARROW_TA, il: CREATE_NEW_ACCOUNT_ARROW_IL, check_path: $check_path).click
  end

  def click_dropdown_arrow (key=nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_ARROW_TA, il: DROPDOWN_ARROW_IL, check_path: $check_path).click
  end

  def select_dropdown(key=nil, name)
    find_element(key, il_type: :xpath, tl: search_item(:ta, name), il: search_item(:il, name), check_path: $check_path).click
  end

  def fill_first_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: FIRST_NAME_TA, il: FIRST_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_last_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: LAST_NAME_TA, il: LAST_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_email_name(key = nil, value)
    find_element(key, il_type: :xpath, tl: EMAIL_TA, il: EMAIL_IL, check_path: $check_path).set(value)
  end

  def fill_pass(key = nil, value)
    find_element(key, il_type: :xpath, tl: PASS_TA, il: PASS_IL, check_path: $check_path).set(value)
  end

  def confirm_pass(key = nil, value)
    find_element(key, il_type: :xpath, tl: CONFIRM_PASS_TA, il: CONFIRM_PASS_IL, check_path: $check_path).set(value)
  end

  def click_register_button(key=nil)
    find_element(key, il_type: :xpath, tl: REGISTER_BTN_TA, il: REGISTER_BTN_IL, check_path: $check_path).click
  end

end
