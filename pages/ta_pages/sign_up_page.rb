require_relative '../page_extension'

class SignUpPage < PageExtension


  SIGN_UP_H1_IL = "//h1[text()='Sign up']"
  SIGN_UP_H1_TA = "ta:sign_up_page:sign_up_text"

  SIGN_UP_EMAIL_IL = "//input[@name='email']"
  SIGN_UP_EMAIL_TA = "ta:sign_up_page:email"

  BACK_TO_MAIN_BTN_IL = "//a[@class='back-btn']"
  BACK_TO_MAIN_BTN_TA = "ta:sign_up_page:back_to_main_btn"

  SIGN_UP_BTN_IL = "//button[@class='btn login-btn']"
  SIGN_UP_BTN_TA = "ta:sign_up_page:sign_up_btn"

  ERROR_MESSAGE_IL = "//div[@class='error-message-container error']"
  ERROR_MESSAGE_TA = "ta:sign_up_page:error_message"


  def fill_sign_up_email_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: SIGN_UP_EMAIL_TA, il: SIGN_UP_EMAIL_IL, check_path: $check_path).set(value)
  end

  def click_back_to_main_btn(key = nil)
    find_element(key, il_type: :xpath, tl: BACK_TO_MAIN_BTN_TA, il: BACK_TO_MAIN_BTN_IL, check_path: $check_path).click
  end

  def should_see_sign_up_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: SIGN_UP_H1_TA, il: SIGN_UP_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_sign_up_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SIGN_UP_BTN_TA, il: SIGN_UP_BTN_IL, check_path: $check_path).click
  end

  def should_see_error_message(key = nil)
    element = find_element(key, il_type: :xpath, tl: ERROR_MESSAGE_TA, il: ERROR_MESSAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end