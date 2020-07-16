require_relative '../page_extension'

class SupportPage < PageExtension

  HEADER_PRODUCTS_MENU_IL = "(//span[text()='Products'])[1]"
  HEADER_PRODUCTS_MENU_TA = "sencha:support_page:header_products_menu"

  DEV_TOOLS_MENU_IL = "//span[text()='Dev Tools']"
  DEV_TOOLS_MENU_TA = "sencha:support_page:dev_tools_menu"

  TEST_AUTOMATION_TITLE_IL = "//a[@title='Test Automation']"
  TEST_AUTOMATION_TITLE_TA = "sencha:support_page:test_automation_title"

  DRAG_DROP_IDE_TITLE_IL = "//a[@title='Drag-drop IDE']"
  DRAG_DROP_IDE_TITLE_TA = "sencha:support_page:drag_drop_ide_title"

  COMMAND_LINE_TOOL_TITLE_IL = "//a[@title='Command Line Tool']"
  COMMAND_LINE_TOOL_TITLE_TA = "sencha:support_page:command_line_tool_title"

  DEBUGGING_TOOL_TITLE_IL = "//a[@title='Debugging Tool']"
  DEBUGGING_TOOL_TITLE_TA = "sencha:support_page:debugging_tool_title"

  FREE_TRIAL_BTN_IL = "//span[text()='Free Trial']"
  FREE_TRIAL_BTN_TA = "sencha:support_page:free_trial_btn"

  BUY_NOW_BTN_IL = "//span[text()='Buy Now']"
  BUY_NOW_BTN_TA = "sencha:support_page:buy_now_btn"

  EMAIL_FIELD_IL = "//input[@id='usr']"
  EMAIL_FIELD_TA = "sencha:support_page:email_filed"

  PASSWORD_FIELD_IL = "//input[@id='pwd']"
  PASSWORD_FIELD_TA = "sencha:support_page:password_filed"

  SIGN_IN_BTN_IL = "//input[@id='supportSubmit']"
  SIGN_IN_BTN_TA = "sencha:support_page:sign_in_btn"

  NEED_HELP_LINK_IL = "//a[text()='Need help?']"
  NEED_HELP_LINK_TA = "sencha:support_page:need_help_link"

  HOW_TO_USE_SUPPORT_LINK_IL = "//a[@href='/support/using-sencha-care-support']"
  HOW_TO_USE_SUPPORT_LINK_TA = "sencha:support_page:how_to_use_support_link"

  FAQ_LINK_IL = " //a[@href='/support/faqs/']"
  FAQ_LINK_TA = "sencha:support_page:faq_link"


  def hover_header_products_menu(key = nil)
    find_element(key, il_type: :xpath, tl: HEADER_PRODUCTS_MENU_TA, il: HEADER_PRODUCTS_MENU_IL, check_path: $check_path).hover
  end

  def hover_dev_tools_menu(key = nil)
    find_element(key, il_type: :xpath, tl: DEV_TOOLS_MENU_TA, il: DEV_TOOLS_MENU_IL, check_path: $check_path).hover
  end

  def should_see_test_automation_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: TEST_AUTOMATION_TITLE_TA, il: TEST_AUTOMATION_TITLE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_drag_drop_ide_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: DRAG_DROP_IDE_TITLE_TA, il: DRAG_DROP_IDE_TITLE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_command_line_tool_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: COMMAND_LINE_TOOL_TITLE_TA, il: COMMAND_LINE_TOOL_TITLE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_debugging_tool_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: DEBUGGING_TOOL_TITLE_TA, il: DEBUGGING_TOOL_TITLE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_free_trial_btn(key = nil)
    element = find_element(key, il_type: :xpath, tl: FREE_TRIAL_BTN_TA, il: FREE_TRIAL_BTN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_buy_now_btn(key = nil)
    element = find_element(key, il_type: :xpath, tl: BUY_NOW_BTN_TA, il: BUY_NOW_BTN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_email_field(key = nil, email)
    find_element(key, il_type: :xpath, tl: EMAIL_FIELD_TA, il: EMAIL_FIELD_IL, check_path: $check_path).set(email)
  end

  def fill_password_field(key = nil, password)
    find_element(key, il_type: :xpath, tl: PASSWORD_FIELD_TA, il: PASSWORD_FIELD_IL, check_path: $check_path).set(password)
  end

  def click_sign_in_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SIGN_IN_BTN_TA, il: SIGN_IN_BTN_IL, check_path: $check_path).click
  end

  def should_see_need_help_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: NEED_HELP_LINK_TA, il: NEED_HELP_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_how_to_use_support_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: HOW_TO_USE_SUPPORT_LINK_TA, il: HOW_TO_USE_SUPPORT_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_faq_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: FAQ_LINK_TA, il: FAQ_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
