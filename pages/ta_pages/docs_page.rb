require_relative '../page_extension'

class DocPage< PageExtension


  INSTALL_CLIENT_H1_IL = "//h1[@id='install-client']"
  INSTALL_CLIENT_H1_TA = "ta:docs_page:install_client_h1"

  SEARCH_IN_DOC_IL = "//input[@type='search']"
  SEARCH_IN_DOC_TA = "ta:docs_page:search"

  SETTING_API_KEY_IL = "//a[@href='#/client/commands?id=setting-api-key']"
  SETTING_API_KEY_TA = "ta:docs_page:setting_api_key"

  TA_COMMANDS_PAGE_IL = "//span[text()='TrueAutomation commands ']"
  TA_COMMANDS_PAGE_TA = "ta:docs_page:ta_commands_page"

  CLEAR_BTN_IL = "//div[contains(@class, 'clear-button')]"
  CLEAR_BTN_TA = "ta:docs_page:clear_btn"

  NEXT_BTN_IL = "//div[contains(@class, 'pagination-item--next')]"
  NEXT_BTN_TA = "ta:docs_page:next_btn"

  INSTALLING_CLIENT_IL = "//h2[@id='installing-trueautomation-client']"
  INSTALLING_CLIENT_TA = "ta:docs_page:installing_ta_client"

  PREVIOUS_BTN_IL = "//div[contains(@class, 'pagination-item--previous')]"
  PREVIOUS_BTN_TA = "ta:docs_page:previous_btn"

  SIDEBAR_TOGGLE_IL = "//div[contains(@class, 'sidebar-toggle-button')]"
  SIDEBAR_TOGGLE_TA = "ta:docs_page:sidebar_btn"

  VISIBLE_SIDE_BAR_IL = "//body[not(@class='ready sticky close')]"
  VISIBLE_SIDE_BAR_TA = "ta:docs_page:sidebar_visible"

  INVISIBLE_SIDE_BAR_IL = "//body[@class='ready sticky close']"
  INVISIBLE_SIDE_BAR_TA = "ta:docs_page:sidebar_invisible"

  BACK_TO_CLOUD_BTN_IL = "//a[contains(text(), 'Back to') and @target='_blank']"
  BACK_TO_CLOUD_BTN_TA = "ta:docs_page:back_to_cloud"


  def should_see_install_client(key = nil)
    element = find_element(key, il_type: :xpath, tl: INSTALL_CLIENT_H1_TA, il: INSTALL_CLIENT_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_search_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: SEARCH_IN_DOC_TA, il: SEARCH_IN_DOC_IL, check_path: $check_path).set(value)
  end

  def click_setting_api_key(key = nil)
    find_element(key, il_type: :xpath, tl: SETTING_API_KEY_TA, il: SETTING_API_KEY_IL, check_path: $check_path).click
  end

  def should_see_ta_commands_page(key = nil)
    element = find_element(key, il_type: :xpath, tl: TA_COMMANDS_PAGE_TA, il: TA_COMMANDS_PAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_clear_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CLEAR_BTN_TA, il: CLEAR_BTN_IL, check_path: $check_path).click
  end

  def click_next_btn(key = nil)
    find_element(key, il_type: :xpath, tl: NEXT_BTN_TA, il: NEXT_BTN_IL, check_path: $check_path).click
  end

  def should_see_installing_client(key = nil)
    element = find_element(key, il_type: :xpath, tl: INSTALLING_CLIENT_TA, il: INSTALLING_CLIENT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_previous_btn(key = nil)
    find_element(key, il_type: :xpath, tl: PREVIOUS_BTN_TA, il: PREVIOUS_BTN_IL, check_path: $check_path).click
    end

  def click_sidebar_toggle(key = nil)
    find_element(key, il_type: :xpath, tl: SIDEBAR_TOGGLE_TA, il: SIDEBAR_TOGGLE_IL, check_path: $check_path).click
  end

  def check_sidebar_visible(key = nil)
    element = find_element(key, il_type: :xpath, tl: VISIBLE_SIDE_BAR_TA, il: VISIBLE_SIDE_BAR_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def check_sidebar_hidden(key = nil)
    element = find_element(key, il_type: :xpath, tl: INVISIBLE_SIDE_BAR_TA, il: INVISIBLE_SIDE_BAR_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end