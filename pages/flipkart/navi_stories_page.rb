require_relative '../page_extension'

class NaviOnStoriesPageFlipkart < PageExtension


  TOP_STORIES_IL = "//li[@id='mega-menu-item-23321']/a[text()='Top Stories']"
  TOP_STORIES_TA = "flipkart:stories_page:top_stories"

  TOP_STORIES_H1_IL = "//h1[text()='Top Stories']"
  TOP_STORIES_H1_TA = "flipkart:stories_page:top_stories_h1"

  SHOPPING_GUIDES_IL = "//li[@id='mega-menu-item-23329']/a[text()='Shopping Guides']"
  SHOPPING_GUIDES_TA = "flipkart:stories_page:shopping_guides_link"

  HOMES_IL = "//li[@id='mega-menu-item-23328']/a[text()='Homes']"
  HOMES_TA = "flipkart:stories_page:homes_link"

  SIGNUP_BTN_IL = "(//li[contains(@class,'signup')]/a[text()='Sign Up'])[1]"
  SIGNUP_BTN_TA = "flipkart:stories_page:signup_btn"

  SUBSCRIBE_FOR_UPDATES_IL = "//h1[text()='Subscribe for priority updates']"
  SUBSCRIBE_FOR_UPDATES_TA = "flipkart:stories_page:subscribe_for_updates"

  SEARCH_BTN_IL = "//a[@class='open-search-main-menu']"
  SEARCH_BTN_TA = "flipkart:stories_page:search_btn"

  SEARCH_INPUT_IL = "//input[@type='search']"
  SEARCH_INPUT_TA = "flipkart:stories_page:search_input"

  FAQ_SEARCH_RESULT_IL = "//span[contains(@class, 'highlighted') and text()='FAQ']"
  FAQ_SEARCH_RESULT_TA = "flipkart:stories_page:faq_search_result"

  FAQ_H1_IL = "//h1[contains(text(),'FAQ')]"
  FAQ_H1_TA = "flipkart:stories_page:faq_h1"

  CLOSE_MODAL_IL = "#onesignal-popover-cancel-button"
  CLOSE_MODAL_TA = "flipkart:stories_page:close_modal"


  def click_on_top_stories(key = nil)
    find_element(key, il_type: :xpath, tl: TOP_STORIES_TA, il: TOP_STORIES_IL, check_path: $check_path).click
  end

  def should_see_top_stories_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: TOP_STORIES_H1_TA, il: TOP_STORIES_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def hover_shopping_guides_link(key = nil)
    find_element(key, il_type: :xpath, tl: SHOPPING_GUIDES_TA, il: SHOPPING_GUIDES_IL, check_path: $check_path).hover
  end

  def hover_homes_link(key = nil)
    find_element(key, il_type: :xpath, tl: HOMES_TA, il: HOMES_IL, check_path: $check_path).hover
  end

  def click_on_signup_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SIGNUP_BTN_TA, il: SIGNUP_BTN_IL, check_path: $check_path).click
  end

  def should_see_subscribe_for_updates(key = nil)
    element = find_element(key, il_type: :xpath, tl: SUBSCRIBE_FOR_UPDATES_TA, il: SUBSCRIBE_FOR_UPDATES_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_search_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SEARCH_BTN_TA, il: SEARCH_BTN_IL, check_path: $check_path).click
  end

  def click_on_search_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: SEARCH_INPUT_TA, il: SEARCH_INPUT_IL, check_path: $check_path).set(value)
  end

  def click_on_faq_search_result(key = nil)
    element =  find_element(key, il_type: :xpath, tl: FAQ_SEARCH_RESULT_TA, il: FAQ_SEARCH_RESULT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def close_modal(key = nil)
    find_element(key, il_type: :css, tl: CLOSE_MODAL_TA, il: CLOSE_MODAL_IL, check_path: $check_path).click
  end

end