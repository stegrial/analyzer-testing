require_relative '../page_extension'

class FaqPageFlipkart < PageExtension


  LOG_IN_BTN_IL = "//button[contains(., 'Log in')]"
  LOG_IN_BTN_TA = "flipkart:faq_page:log_in_btn"

  CLOSE_MODAL_BTN_IL = "//button[text()='✕']"
  CLOSE_MODAL_BTN_TA = "flipkart:faq_page:close_btn"

  HELP_WITH_ISSUES_IL = "//span[text()='Help with your Issues']"
  HELP_WITH_ISSUES_TA = "flipkart:faq_page:help_with_issues"

  HELP_WITH_OTHER_ISSUES_IL = "//span[text()='Help with other issues']"
  HELP_WITH_OTHER_ISSUES_TA = "flipkart:faq_page:help_with_other_issues"

  INCIDENTS_BREADCRUMB_IL = "//a[text()='Incidents']"
  INCIDENTS_BREADCRUMB_TA = "flipkart:faq_page:incidents_breadcrumb"

  MANAGE_MY_ORDER_IL = "//div[text()='I want to manage my order']"
  MANAGE_MY_ORDER_TA = "flipkart:faq_page:manage_my_order"

  SELECT_ITEM_TEXT_IL = "//div[text()='Select an item to change address, delivery date, and more']"
  SELECT_ITEM_TEXT_TA = "flipkart:faq_page:select_an_item_text"

  POSTAL_ADDRESS_IL = "//span[text()='Postal Address']"
  POSTAL_ADDRESS_TA = "flipkart:faq_page:postal_address"

  CORPORATE_ADDRESS_IL = "//span[text()='Corporate Address']"
  CORPORATE_ADDRESS_TA = "flipkart:faq_page:corporate_address"

  CLOSE_POSTAL_MODAL_BTN_IL = "//*[@id='postal-modal-overlay']//button[text()='✕']"
  CLOSE_POSTAL_MODAL_BTN_TA = "flipkart:faq_page:close_postal_modal_btn"


  def click_on_log_in_btn(key = nil)
    find_element(key, il_type: :xpath, tl: LOG_IN_BTN_TA, il: LOG_IN_BTN_IL, check_path: $check_path).click
  end

  def click_close_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_MODAL_BTN_TA, il: CLOSE_MODAL_BTN_IL, check_path: $check_path).click
  end

  def click_help_with_issues(key = nil)
    find_element(key, il_type: :xpath, tl: HELP_WITH_ISSUES_TA, il: HELP_WITH_ISSUES_IL, check_path: $check_path).click
  end

  def should_see_incidents_breadcrumb(key = nil)
    element = find_element(key, il_type: :xpath, tl: INCIDENTS_BREADCRUMB_TA, il: INCIDENTS_BREADCRUMB_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_help_with_other_issues(key = nil)
    find_element(key, il_type: :xpath, tl: HELP_WITH_OTHER_ISSUES_TA, il: HELP_WITH_OTHER_ISSUES_IL, check_path: $check_path).click
  end

  def click_manage_my_order(key = nil)
    find_element(key, il_type: :xpath, tl: MANAGE_MY_ORDER_TA, il: MANAGE_MY_ORDER_IL, check_path: $check_path).click
  end

  def click_postal_address(key = nil)
    find_element(key, il_type: :xpath, tl: POSTAL_ADDRESS_TA, il: POSTAL_ADDRESS_IL, check_path: $check_path).click
  end

  def should_see_select_an_item_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: SELECT_ITEM_TEXT_TA, il: SELECT_ITEM_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_corporate_address(key = nil)
    element = find_element(key, il_type: :xpath, tl: CORPORATE_ADDRESS_TA, il: CORPORATE_ADDRESS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_close_postal_modal_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_POSTAL_MODAL_BTN_TA, il: CLOSE_POSTAL_MODAL_BTN_IL, check_path: $check_path).click
  end

end
