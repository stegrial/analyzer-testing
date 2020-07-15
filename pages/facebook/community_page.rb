require_relative '../page_extension'

class CommunityPageFacebook < PageExtension


  TA_COMMUNITY_IL = "//a[text()='TrueAutomation.io']"
  TA_COMMUNITY_TA = "facebook:community_page:TA_community"

  EASY_TA_SEARCH_IN_SOCIAL_IL = "//a[text()='@trueautomation']"
  EASY_TA_SEARCH_IN_SOCIAL_TA = "facebook:community_page:easy_TA_search"

  LEFT_SIDE_NAV_ABOUT_IL = "//a[contains(@data-endpoint,'/trueautomation/about/')]"
  LEFT_SIDE_NAV_ABOUT_TA =  "facebook:community_page:about_TA"

  CONTACT_INFO_TEXT_IL = "//div[contains(text(),'CONTACT INFO')]"
  CONTACT_INFO_TEXT_TA = "facebook:community_page:contact_info_text"

  SUGGEST_EDIT_IL = "//div[contains(text(),'Suggest Edits')]"
  SUGGEST_EDIT_TA = "facebook:community_page:suggest_edits"

  BASIC_INFO_TEXT_IL = "//div[contains(text(),'Basic Information')]"
  BASIC_INFO_TEXT_TA = "facebook:community_page:basic_info_test"

  ADD_DUPLICATE_URL_IL = "//div[contains(text(),'Add Duplicate URL')]"
  ADD_DUPLICATE_URL_TA = "facebook:community_page:add_duplicate_url"

  URL_INFO_IL= "//div[contains(text(),'Copy the URL of the duplicate place')]"
  URL_INFO_TA= "facebook:community_page:url_info"

  CLOSE_DIALOG_IL = "//a[contains(@data-testid,'dialog_title_close_button')]"
  CLOSE_DIALOG_TA = "facebook:community_page:dialog_close_button"

  SEND_MSG_IL = "//button[contains(text(),'Send Message')]"
  SEND_MSG_TA = "facebook:community_page:send_msg_btn"

  CHAT_MODAL_IL = "//div[contains(@class,'fbDockChatTabFlyout')]"
  CHAT_MODAL_TA = "facebook:community_page:chat_modal"

  TYPE_A_MESSAGE_IL = "//div[@role='combobox']"
  TYPE_A_MESSAGE_TA = "facebook:community_page:type_a_message"

  CLOSE_CHAT_IL = "//div[@class='close']"
  CLOSE_CHAT_TA = "facebook:community_page:close_chat"

  COMMUNITY_H1_IL = "//h1//span[contains(text(), 'Trueautomation_test1')]"
  COMMUNITY_H1_TA = "facebook:community_page:community_h1"

  EVENT_BTN_IL = "//div[@id='PagesComposerConsolidatedEntry']//span[contains(text(), 'Event')]"
  EVENT_BTN_TA = "facebook:community_page:event_btn"

  REQUIRED_INFO_IL = "//span[contains(text(), 'Required Info')]"
  REQUIRED_INFO_TA = "facebook:community_page:required_info"

  EVENT_NAME_IL = "//input[@aria-labelledby='eventCreateTitle']"
  EVENT_NAME_TA = "facebook:community_page:event_name_input"

  ONLINE_EVENT_IL = "(//label[@class='uiInputLabelLabel'])[1]"
  ONLINE_EVENT_TA = "facebook:community_page:online_event_checkbox"

  LOCATION_IL = "(//input[contains(@placeholder, 'Include a place or address')])[1]"
  LOCATION_TA = "facebook:community_page:location_event"

  SELECT_CATEGORY_IL = "//span[text()='Select Category']"
  SELECT_CATEGORY_TA = "facebook:community_page:select_category"

  DANCE_CATEGORY_IL = "//div[@class='uiScrollableAreaContent']//span[text()='Dance']"
  DANCE_CATEGORY_TA = "facebook:community_page:dance_category"

  ANYONE_CAN_POST_IL = "//label[contains(@class, 'uiInputLabelLabel')and text()='Anyone can post']"
  ANYONE_CAN_POST_TA = "facebook:community_page:anyone_can_post"

  PUBLISH_BTN_IL = "(//button[contains(@class, 'layerConfirm')and text()='Publish'])[1]"
  PUBLISH_BTN_TA =  "facebook:community_page:publish_btn"

  DESCRIPTION_IL = "//div[contains(@class,'notranslate')]"
  DESCRIPTION_TA = "facebook:community_page:description_field"

  CLOSE_MODAL_IL = "//button[contains(@title, 'Close') and text()='Close']"
  CLOSE_MODAL_TA = "facebook:community_page:close_modal"

  MORE_SETTINGS_FOR_EVENT_IL = "(//a[contains(@aria-label, 'More')])[1]"
  MORE_SETTINGS_FOR_EVENT_TA = "facebook:community_page:more_settings_for_event"

  CANCEL_EVENT_IL = "(//span[contains(text(), 'Cancel Event')])[1]"
  CANCEL_EVENT_TA = "facebook:community_page:cancel_event"

  DELETE_EVENT_IL = "(//label[contains(text(), 'Delete Event')])[1]"
  DELETE_EVENT_TA = "facebook:community_page:delete_event"

  CONFIRM_DELETE_EVENT_IL = "(//button[contains(text(), 'Confirm')])[1]"
  CONFIRM_DELETE_EVENT_TA = "facebook:community_page:confirm_delete_event"

  OFFER_BTN_IL = "(//div[@id='PagesComposerConsolidatedEntry']//span[contains(text(), 'Offer')])[1]"
  OFFER_BTN_TA = "facebook:community_page:offer_btn"

  STORY_OPTION_IL = "(//a[@aria-label='Story options'])[1]"
  STORY_OPTION_TA = "facebook:community_page:story_option"

  DELETE_POST_IL = "//a[@data-feed-option-name='FeedDeleteOption']"
  DELETE_POST_TA = "facebook:community_page:delete_post"

  CONFIRM_DELETE_IL = "//input[@value='Delete']"
  CONFIRM_DELETE_TA = "facebook:community_page:accept_delete"

  JOB_BTN_IL = "(//div[@id='PagesComposerConsolidatedEntry']//span[contains(text(), 'Job')])[1]"
  JOB_BTN_TA = "facebook:community_page:job_btn"


  def click_ta_community(key = nil)
    find_element(key, il_type: :xpath, tl: TA_COMMUNITY_TA, il: TA_COMMUNITY_IL, check_path: $check_path).click
  end

  def should_see_easy_ta_search(key = nil)
    element = find_element(key, il_type: :xpath, tl: EASY_TA_SEARCH_IN_SOCIAL_TA, il: EASY_TA_SEARCH_IN_SOCIAL_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_about_ta(key = nil)
    find_element(key, il_type: :xpath, tl: LEFT_SIDE_NAV_ABOUT_TA, il: LEFT_SIDE_NAV_ABOUT_IL, check_path: $check_path).click
  end

  def should_see_contact_info_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: CONTACT_INFO_TEXT_TA, il: CONTACT_INFO_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_suggest_edits(key = nil)
    find_element(key, il_type: :xpath, tl: SUGGEST_EDIT_TA, il: SUGGEST_EDIT_IL, check_path: $check_path).click
  end

  def should_see_basic_info_test(key = nil)
    element = find_element(key, il_type: :xpath, tl: BASIC_INFO_TEXT_TA, il: BASIC_INFO_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_add_duplicate_url(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_DUPLICATE_URL_TA, il: ADD_DUPLICATE_URL_IL, check_path: $check_path).click
  end

  def should_see_url_info(key = nil)
    element = find_element(key, il_type: :xpath, tl: URL_INFO_TA, il: URL_INFO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_dialog_close_button(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_DIALOG_TA, il: CLOSE_DIALOG_IL, check_path: $check_path).click
  end

  def click_send_msg_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SEND_MSG_TA, il: SEND_MSG_IL, check_path: $check_path).click
  end

  def should_see_chat_modal(key = nil)
    element = find_element(key, il_type: :xpath, tl: CHAT_MODAL_TA, il: CHAT_MODAL_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_type_a_message_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: TYPE_A_MESSAGE_TA, il: TYPE_A_MESSAGE_IL, check_path: $check_path).set(value)
  end

  def click_close_chat(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_CHAT_TA, il: CLOSE_CHAT_IL, check_path: $check_path).click
  end

  def click_event_btn(key = nil)
    find_element(key, il_type: :xpath, tl: EVENT_BTN_TA, il: EVENT_BTN_IL, check_path: $check_path).click
  end

  def should_see_community_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: COMMUNITY_H1_TA, il: COMMUNITY_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_required_info(key = nil)
    element = find_element(key, il_type: :xpath, tl: REQUIRED_INFO_TA, il: REQUIRED_INFO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_event_name_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: EVENT_NAME_TA, il: EVENT_NAME_IL, check_path: $check_path).set(value)
  end

  def click_online_event_checkbox(key = nil)
    find_element(key, il_type: :xpath, tl: ONLINE_EVENT_TA, il: ONLINE_EVENT_IL, check_path: $check_path).click
  end

  def fill_location_event_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: LOCATION_TA, il: LOCATION_IL, check_path: $check_path).set(value)
  end

  def click_select_category(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_CATEGORY_TA, il: SELECT_CATEGORY_IL, check_path: $check_path).click
  end

  def fill_description_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: DESCRIPTION_TA, il: DESCRIPTION_IL, check_path: $check_path).set(value)
  end

  def click_dance_category(key = nil)
    find_element(key, il_type: :xpath, tl: DANCE_CATEGORY_TA, il: DANCE_CATEGORY_IL, check_path: $check_path).click
  end

  def click_anyone_can_post(key = nil)
    find_element(key, il_type: :xpath, tl: ANYONE_CAN_POST_TA, il: ANYONE_CAN_POST_IL, check_path: $check_path).click
  end

  def click_publish_btn(key = nil)
    find_element(key, il_type: :xpath, tl: PUBLISH_BTN_TA, il: PUBLISH_BTN_IL, check_path: $check_path).click
    sleep 7 # wait for publishing
  end

  def click_to_close_modal(key = nil)
    if page.has_xpath?("//button[contains(@title, 'Close') and text()='Close']")
      find_element(key, il_type: :xpath, tl: CLOSE_MODAL_TA, il: CLOSE_MODAL_IL, check_path: $check_path).click
    end
  end

  def click_more_settings_for_event(key = nil)
    find_element(key, il_type: :xpath, tl: MORE_SETTINGS_FOR_EVENT_TA, il: MORE_SETTINGS_FOR_EVENT_IL, check_path: $check_path).click
  end

  def click_cancel_event(key = nil)
    find_element(key, il_type: :xpath, tl: CANCEL_EVENT_TA, il: CANCEL_EVENT_IL, check_path: $check_path).click
  end

  def click_delete_event(key = nil)
    find_element(key, il_type: :xpath, tl: DELETE_EVENT_TA, il: DELETE_EVENT_IL, check_path: $check_path).click
  end

  def click_confirm_delete_event(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_DELETE_EVENT_TA, il: CONFIRM_DELETE_EVENT_IL, check_path: $check_path).click
    sleep 7 # wait for deleting
  end

  def click_offer_btn(key = nil)
    find_element(key, il_type: :xpath, tl: OFFER_BTN_TA, il: OFFER_BTN_IL, check_path: $check_path).click
    sleep 5 # wait until offer form is open
  end

  def click_to_open_story_option(key = nil)
    find_element(key, il_type: :xpath, tl: STORY_OPTION_TA, il: STORY_OPTION_IL, check_path: $check_path).click
  end

  def click_to_delete_post(key = nil)
    find_element(key, il_type: :xpath, tl: DELETE_POST_TA, il: DELETE_POST_IL, check_path: $check_path).click
  end

  def click_to_accept_delete_post(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_DELETE_TA, il: CONFIRM_DELETE_IL, check_path: $check_path).click
    sleep 5 # wait until created post will be deleted
  end

  def click_job_btn(key = nil)
    find_element(key, il_type: :xpath, tl: JOB_BTN_TA, il: JOB_BTN_IL, check_path: $check_path).click
    sleep 5 # wait until offer form is open
  end



end