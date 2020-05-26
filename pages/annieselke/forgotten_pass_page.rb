require_relative '../page_extension'

class ForgottenPassPage < PageExtension

  SEND_EMAIL_BTN_IL = "//button[@class='primary password-request-submit-button']"
  SEND_EMAIL_BTN_TA = "annieselke:forgotten_pass_page:send_email_btn"

  RETURN_LOGIN_BTN_IL = "//a[@class='primary button']"
  RETURN_LOGIN_BTN_TA = "annieselke:forgotten_pass_page:return_login_btn"

  def click_send_email_btn(key=nil)
    find_element(key, il_type: :xpath, tl: SEND_EMAIL_BTN_TA, il: SEND_EMAIL_BTN_IL, check_path: $check_path).click
  end

  def click_return_login_btn(key=nil)
    find_element(key, il_type: :xpath, tl: RETURN_LOGIN_BTN_TA, il: RETURN_LOGIN_BTN_IL, check_path: $check_path).click
  end
end
