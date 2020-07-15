require_relative '../page_extension'

class ChatPageFacebook < PageExtension


  CHATS_TEXT_IL = "//h1[text()='Chats']"
  CHATS_TEXT_TA = "facebook:chat_page:chats_text"

  SEARCH_INPUT_IL = "//input[contains(@placeholder, 'Search Messenger')]"
  SEARCH_INPUT_TA = "facebook:chat_page:search_input"

  CONTACTS_IN_CHAT_IL = "//div[contains(text(), 'Contacts')]"
  CONTACTS_IN_CHAT_TA = "facebook:chat_page:contacts_in_chat"

  BUSINESSES_IN_CHAT_IL = "//div[contains(text(), 'Businesses')]"
  BUSINESSES_IN_CHAT_TA = "facebook:chat_page:businesses_in_chat"

  CLEAR_SEARCH_FIELD_IL = "(//div[@class='uiScrollableAreaContent']//i[contains(@class,'img')and @alt])[2]"
  CLEAR_SEARCH_FIELD_TA =  "facebook:chat_page:clear_search_field"

  START_CHAT_MARK_SOZA_IL = "(//span[text()='Mark Soza'])[1]"
  START_CHAT_MARK_SOZA_TA = "facebook:chat_page:start_chat_mark_soza"

  CHOOSE_AN_EMOJI_IL = "//a[contains(@title,'Choose an emoji')]"
  CHOOSE_AN_EMOJI_TA = "facebook:chat_page:choose_an_emoji"

  SELECT_EMOJI_IL = "(//div[contains(@aria-label,'Pick emoji')])[5]"
  SELECT_EMOJI_TA =  "facebook:chat_page:select_emoji"

  SEND_MSG_IL = "(//a[contains(@data-tooltip-content,'Press Enter to send')])[1]"
  SEND_MSG_TA = "facebook:chat_page:send_msg"

  MORE_ACTIONS_IL = "//h4[contains(text(),'More Actions')]"
  MORE_ACTIONS_TA = "facebook:chat_page:more_actions"

  PRIVACY_AND_SUPPORT_IL = "//h4[contains(text(),'Privacy & Support')]"
  PRIVACY_AND_SUPPORT_TA = "facebook:chat_page:privacy_support_btn"

  def should_see_chats_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: CHATS_TEXT_TA, il: CHATS_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_search_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: SEARCH_INPUT_TA, il: SEARCH_INPUT_IL, check_path: $check_path).set(value)
  end

  def should_see_contacts_in_chat(key = nil)
    element = find_element(key, il_type: :xpath, tl: CHATS_TEXT_TA, il: CHATS_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_businesses_in_chat(key = nil)
    element = find_element(key, il_type: :xpath, tl: BUSINESSES_IN_CHAT_TA, il: BUSINESSES_IN_CHAT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_to_start_chat_mark_soza(key = nil)
    find_element(key, il_type: :xpath, tl: START_CHAT_MARK_SOZA_TA, il: START_CHAT_MARK_SOZA_IL, check_path: $check_path).click
  end

  def click_choose_an_emoji(key = nil)
    find_element(key, il_type: :xpath, tl: CHOOSE_AN_EMOJI_TA, il: CHOOSE_AN_EMOJI_IL, check_path: $check_path).click
  end

  def click_select_emoji(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_EMOJI_TA, il: SELECT_EMOJI_IL, check_path: $check_path).click
  end

  def click_send_msg(key = nil)
    find_element(key, il_type: :xpath, tl: SEND_MSG_TA, il: SEND_MSG_IL, check_path: $check_path).click
  end

  def click_clear_search_field(key = nil)
    find_element(key, il_type: :xpath, tl: CLEAR_SEARCH_FIELD_TA, il: CLEAR_SEARCH_FIELD_IL, check_path: $check_path).click
  end

  def should_see_more_actions(key = nil)
    element = find_element(key, il_type: :xpath, tl: MORE_ACTIONS_TA, il: MORE_ACTIONS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_privacy_support_btn(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRIVACY_AND_SUPPORT_TA, il: PRIVACY_AND_SUPPORT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end