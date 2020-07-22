require_relative '../page_extension'

class HeaderNaviPageFacebook < PageExtension


  EMAIL_IL = "//input[@name='email']"
  EMAIL_TA = "facebook:header_nav:email"

  PASS_IL = "//input[@name='pass']"
  PASS_TA = "facebook:header_nav:pass"

  LOGIN_BTN_IL = "#loginbutton"
  LOGIN_BTN_TA = "facebook:header_nav:login_btn"

  PROFILE_NAME_IL = "//a[@title='Profile']//*[text()='Mark']"
  PROFILE_NAME_TA = "facebook:header_nav:profile_name"

  ACCOUNT_SETTING_IL = "#userNavigationLabel"
  ACCOUNT_SETTING_TA = "facebook:header_nav:acc_setting_btn"

  MENU_LOGOUT_IL = "//li[contains(@data-gt, 'menu_logout')]"
  MENU_LOGOUT_TA = "facebook:header_nav:menu_logout"

  MENU_SETTING_IL = "//li[contains(@data-gt, 'menu_settings')]"
  MENU_SETTING_TA = "facebook:header_nav:menu_settings"

  CREATE_NEW_ACC_TEXT_IL = "//div[contains(text(), 'Create a New Account')]"
  CREATE_NEW_ACC_TEXT_TA = "facebook:header_nav:create_new_acc_text"

  BODY_IL = "//body"
  BODY_TA = "facebook:header_nav:body"

  SEARCH_INPUT_IL = "//input[@data-testid='search_input']"
  SEARCH_INPUT_TA = "facebook:header_nav:search_input"

  CREATE_HEADER_BTN_IL = "#creation_hub_entrypoint"
  CREATE_HEADER_BTN_TA = "facebook:header_nav:create_btn"

  ADS_LINK_IL = "(//a[contains(@title, 'Ad Advertise your business')])[1]"
  ADS_LINK_TA = "facebook:header_nav:ads_link"

  HELP_CENTER_IL = "//div[@id='pagelet_bluebar']//a[contains(@aria-label, 'Help Center')]"
  HELP_CENTER_TA = "facebook:header_nav:help_center"

  HELP_WITH_THIS_PAGE_IL = "//div[@id='pagelet_bluebar']//div[contains(text(), 'HELP WITH THIS PAGE')]"
  HELP_WITH_THIS_PAGE_TA = "facebook:header_nav:help_with_this_page"

  HOW_CAN_I_HELP_INPUT_IL = "//div[@id='contextual_help_nav']//input[contains(@placeholder, 'How can we help?')]"
  HOW_CAN_I_HELP_INPUT_TA = "facebook:header_nav:how_can_i_help_input"

  HELP_SEARCH_RESULT_IL = "(//div[@id='contextual_help_nav']//div[contains(text(), 'do I test')])[1]"
  HELP_SEARCH_RESULT_TA = "facebook:header_nav:help_search_result"

  FACEBOOK_ANDROID_TEXT_IL = "(//div[@id='contextual_help_nav']//div[contains(text(), 'Facebook for Android') and @class='mvm uiP fsm'])[1]"
  FACEBOOK_ANDROID_TEXT_TA = "facebook:header_nav:fb_android_text"

  BACK_BTN_IL = "(//div[@id='contextual_help_nav']//button[contains(text(), 'Back')])[1]"
  BACK_BTN_TA = "facebook:header_nav:back_button"

  CHAT_AND_MSG_IL = "(//div[@id='contextual_help_nav']//div[contains(text(), 'Chat and Messages')])[1]"
  CHAT_AND_MSG_TA = "facebook:header_nav:chat_and_messages"

  SEE_MORE_HELP_IL = "(//div[@id='contextual_help_nav']//div[contains(text(), 'See more help')])[1]"
  SEE_MORE_HELP_TA = "facebook:header_nav:see_more_help"

  PAGE_TITLE_IL = "(//a[contains(@href, 'hc_global_nav')]//span[contains(text(), 'Help Center')])[1]"
  PAGE_TITLE_TA = "facebook:help_center:help_center_text"

  CREATE_PAGE_IL = "(//a[contains(@title, 'Page Connect and share with customers or fans')])[1]"
  CREATE_PAGE_TA = "facebook:header_nav:create_page_community"

  NOTIFICATIONS_BTN_IL = "(//a[contains(@name, 'notifications')])[1]"
  NOTIFICATIONS_BTN_TA = "facebook:header_nav:notifications_btn"

  NOTIFICATIONS_TEXT_IL = "//i[text()='Notifications']"
  NOTIFICATIONS_TEXT_TA = "facebook:header_nav:notifications_btn"

  SEE_ALL_IL = "(//div[@class='jewelFooter']//span[contains(text(), 'See All')])[2]"
  SEE_ALL_TA = "facebook:header_nav:see_all_btn"

  def set_email(key = nil, value)
    find_element(key, il_type: :xpath, tl: EMAIL_TA, il: EMAIL_IL, check_path: $check_path).set(value)
  end

  def set_pass(key = nil, value)
    find_element(key, il_type: :xpath, tl: PASS_TA, il: PASS_IL, check_path: $check_path).set(value)
  end

  def click_login_btn(key = nil)
    if page.has_xpath?("//label[@id='loginbutton']")
      find_element(key, il_type: :css, tl: LOGIN_BTN_TA, il: LOGIN_BTN_IL, check_path: $check_path).click
    else
      page.has_xpath?("//button[@name='login']")
      find_element(key, il_type: :xpath, tl: LOGIN_BTN_TA, il: "//button[@name='login']", check_path: $check_path).click
    end
  end

  def escape(key = nil)
    find_element(key, il_type: :xpath, tl: BODY_TA, il: BODY_IL, check_path: $check_path).send_keys :escape
  end

  def click_acc_setting_btn(key = nil)
    find_element(key, il_type: :css, tl: ACCOUNT_SETTING_TA, il: ACCOUNT_SETTING_IL, check_path: $check_path).click
  end

  def should_see_profile_name(key = nil)
    element = find_element(key, il_type: :xpath, tl: PROFILE_NAME_TA, il: PROFILE_NAME_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_menu_logout_btn(key = nil)
    find_element(key, il_type: :xpath, tl: MENU_LOGOUT_TA, il: MENU_LOGOUT_IL, check_path: $check_path).click
  end

  def click_menu_setting_btn(key = nil)
    find_element(key, il_type: :xpath, tl: MENU_SETTING_TA, il: MENU_SETTING_IL, check_path: $check_path).click
  end

  def should_see_create_new_acc_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: CREATE_NEW_ACC_TEXT_TA, il: CREATE_NEW_ACC_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_profile_btn(key = nil)
    find_element(key, il_type: :xpath, tl: PROFILE_NAME_TA, il: PROFILE_NAME_IL, check_path: $check_path).click
  end

  def fill_search_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: SEARCH_INPUT_TA, il: SEARCH_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_create_btn(key = nil)
    find_element(key, il_type: :css, tl: CREATE_HEADER_BTN_TA, il: CREATE_HEADER_BTN_IL, check_path: $check_path).click
  end

  def click_menu_ads_btn(key = nil)
    find_element(key, il_type: :xpath, tl: ADS_LINK_TA, il: ADS_LINK_IL, check_path: $check_path).click
  end

  def move_to_tab
    window = page.driver.browser.window_handles
    page.driver.browser.switch_to.window(window.last)
  end

  def click_help_center_btn(key = nil)
    find_element(key, il_type: :xpath, tl: HELP_CENTER_TA, il: HELP_CENTER_IL, check_path: $check_path).click
  end

  def should_see_help_with_this_page(key = nil)
    element = find_element(key, il_type: :xpath, tl: HELP_WITH_THIS_PAGE_TA, il: HELP_WITH_THIS_PAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_how_can_i_help_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: HOW_CAN_I_HELP_INPUT_TA, il: HOW_CAN_I_HELP_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_help_search_result(key = nil)
    find_element(key, il_type: :xpath, tl: HELP_SEARCH_RESULT_TA, il: HELP_SEARCH_RESULT_IL, check_path: $check_path).click
  end

  def should_see_fb_android_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: FACEBOOK_ANDROID_TEXT_TA, il: FACEBOOK_ANDROID_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_back_button(key = nil)
    find_element(key, il_type: :xpath, tl: BACK_BTN_TA, il: BACK_BTN_IL, check_path: $check_path).click
  end

  def click_chat_and_messages(key = nil)
    find_element(key, il_type: :xpath, tl: CHAT_AND_MSG_TA, il: CHAT_AND_MSG_IL, check_path: $check_path).click
  end

  def click_see_more_help(key = nil)
    find_element(key, il_type: :xpath, tl: SEE_MORE_HELP_TA, il: SEE_MORE_HELP_IL, check_path: $check_path).click
  end

  def should_see_help_center_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: PAGE_TITLE_TA, il: PAGE_TITLE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_menu_page_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_PAGE_TA, il: CREATE_PAGE_IL, check_path: $check_path).click
  end

  def click_notifications_btn(key = nil)
    find_element(key, il_type: :xpath, tl: NOTIFICATIONS_BTN_TA, il: NOTIFICATIONS_BTN_IL, check_path: $check_path).click
  end

  def should_see_notifications_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: NOTIFICATIONS_TEXT_TA, il: NOTIFICATIONS_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_see_all_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SEE_ALL_TA, il: SEE_ALL_IL, check_path: $check_path).click
  end
end
