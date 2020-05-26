require_relative '../page_extension'

class TheTiebarMainPage < PageExtension

  SING_UP_INPUT_IL = "//input[@id='signUpEmail']"
  SING_UP_INPUT_TA = "thetiebar:main_page:singup_input"

  JOIN_BTN_IL = "//span[text()='Sign Up']"
  JOIN_BTN_TA = "thetiebar:main_page:join_btn"

  CONGRATS_TEXT_IL = "//p[contains(text(), 'Congrats!')]"
  CONGRATS_TEXT_TA = "thetiebar:main_page:congrats_text"

  TERMS_TO_USE_LINK_IL = "//a[contains(text(), 'Terms of Use')]"
  TERMS_TO_USE_LINK_TA = "thetiebar:main_page:terms_to_use_link"

  PRIVACY_POLICE_LINK_IL = "//a[contains(text(), 'Privacy Notice')]"
  PRIVACY_POLICE_LINK_TA = "thetiebar:main_page:privacy_police_link"

  COOKIES_CLOSE_BUTTON_IL = "//button[@aria-label='close']"
  COOKIES_CLOSE_BUTTON_TA = "thetiebar:main_page:cookies_close_btn"


  def fill_singup_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: SING_UP_INPUT_TA, il: SING_UP_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_join_btn(key = nil)
    find_element(key, il_type: :xpath, tl: JOIN_BTN_TA, il: JOIN_BTN_IL, check_path: $check_path).click
  end

  def check_congrats_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: CONGRATS_TEXT_TA, il: CONGRATS_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, CONGRATS_TEXT_IL) if key == :il
    # assert_selector(:xpath, ta(CONGRATS_TEXT_TA, CONGRATS_TEXT_IL))
  end

  def click_terms_to_use(key = nil)
    find_element(key, il_type: :xpath, tl: TERMS_TO_USE_LINK_TA, il: TERMS_TO_USE_LINK_IL, check_path: $check_path).click
  end

  def click_privacy_police(key = nil)
    find_element(key, il_type: :xpath, tl: PRIVACY_POLICE_LINK_TA, il: PRIVACY_POLICE_LINK_IL, check_path: $check_path).click
  end

  def click_close_coolies_btn(key = nil)
    find_element(key, il_type: :xpath, tl: COOKIES_CLOSE_BUTTON_TA, il: COOKIES_CLOSE_BUTTON_IL, check_path: $check_path).click
  end

end
