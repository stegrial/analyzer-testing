require_relative '../page_extension'

class HomePageFacebook < PageExtension


  ADD_TO_YOUR_STORY_IL = "//a[contains(text(), 'Add to Your Story')]"
  ADD_TO_YOUR_STORY_TA = "facebook:home_page:add_to_your_story"

  MORE_OPTIONS_IL = "(//a[contains(@aria-label, 'More post options')])[1]"
  MORE_OPTIONS_TA = "facebook:home_page:more_options"

  NEWS_FEED_IL = "//span[contains(text(), 'News Feed')]"
  NEWS_FEED_TA = "facebook:home_page:news_feed"

  WATCH_PARTY_IL = "//div[contains(text(), 'Watch Party')]"
  WATCH_PARTY_TA = "facebook:home_page:watch_party"

  MY_VIDEOS_IL = "(//span[contains(text(), 'My Videos')])[1]"
  MY_VIDEOS_TA = "facebook:home_page:my_videos"

  ADD_TO_QUEUE_IL = "(//div[contains(text(), 'Add to Queue')])[1]"
  ADD_TO_QUEUE_TA = "facebook:home_page:add_to_queue_btn"

  DONE_BTN_IL = "(//button[contains(text(), 'Done')])[1]"
  DONE_BTN_TA = "facebook:home_page:done_btn"

  POST_BTN_IL = "(//button//span[contains(text(), 'Post')])[1]"
  POST_BTN_TA = "facebook:home_page:post_btn"

  CHAT_MODAL_IL = "(//div[contains(@id, 'fbDockChatBuddylistNub')])[1]"
  CHAT_MODAL_TA = "facebook:home_page:chat_modal"

  LEAVE_THIS_PAGE_BTN_IL = "//button[contains(text(), 'Leave This Page')]"
  LEAVE_THIS_PAGE_BTN_TA = "facebook:home_page:leave_this_page_btn"

  OWN_COMMUNITY_PAGE_IL = "//div[contains(text(), 'Trueautomation_test1')]"
  OWN_COMMUNITY_PAGE_TA = "facebook:home_page:own_community_page"

  MESSENGER_LINK_IL = "//div[@id='universalNav']//a[contains(@title, 'Messenger')]"
  MESSENGER_LINK_TA = "facebook:home_page:messenger_link"


  def click_add_to_your_story(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_YOUR_STORY_TA, il: ADD_TO_YOUR_STORY_IL, check_path: $check_path).click
  end

  def click_more_options_btn(key = nil)
    find_element(key, il_type: :xpath, tl: MORE_OPTIONS_TA, il: MORE_OPTIONS_IL, check_path: $check_path).click
  end

  def click_news_feed_radio_btn(key = nil)
    find_element(key, il_type: :xpath, tl: NEWS_FEED_TA, il: NEWS_FEED_IL, check_path: $check_path).click
  end

  def click_watch_party_btn(key = nil)
    find_element(key, il_type: :xpath, tl: WATCH_PARTY_TA, il: WATCH_PARTY_IL, check_path: $check_path).click
  end

  def click_my_videos_tab(key = nil)
    find_element(key, il_type: :xpath, tl: MY_VIDEOS_TA, il: MY_VIDEOS_IL, check_path: $check_path).click
  end

  def click_add_to_queue_btn(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_QUEUE_TA, il: ADD_TO_QUEUE_IL, check_path: $check_path).click
  end

  def click_done_btn(key = nil)
    find_element(key, il_type: :xpath, tl: DONE_BTN_TA, il: DONE_BTN_IL, check_path: $check_path).click
  end

  def click_post_btn(key = nil)
    find_element(key, il_type: :xpath, tl: POST_BTN_TA, il: POST_BTN_IL, check_path: $check_path).click
    sleep 5 # wait for posting and starting video
  end

  def should_see_chat_modal(key = nil)
    element = find_element(key, il_type: :xpath, tl: CHAT_MODAL_TA, il: CHAT_MODAL_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_leave_this_page_btn(key = nil)
    if page.has_xpath?("//button[contains(text(), 'Leave This Page')]")
      find_element(key, il_type: :xpath, tl: LEAVE_THIS_PAGE_BTN_TA, il: LEAVE_THIS_PAGE_BTN_IL, check_path: $check_path).click
    end
  end

  def click_own_community_page(key = nil)
    find_element(key, il_type: :xpath, tl: OWN_COMMUNITY_PAGE_TA, il: OWN_COMMUNITY_PAGE_IL, check_path: $check_path).click
  end

  def click_messenger_link(key = nil)
    find_element(key, il_type: :xpath, tl: MESSENGER_LINK_TA, il: MESSENGER_LINK_IL, check_path: $check_path).click
  end

end