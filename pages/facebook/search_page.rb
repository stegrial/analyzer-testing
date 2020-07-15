require_relative '../page_extension'

class SearchPageFacebook < PageExtension


  SEARCH_RESULTS_IL = "#BrowseResultsContainer"
  SEARCH_RESULTS_TA = "facebook:search_page:search_results"

  ADD_FRIEND_BTN_IL = "(//div[@id='browse_result_area']//div[contains(@class,'FriendButton')])[1]"
  ADD_FRIEND_BTN_TA = "facebook:search_page:like_btn"

  PEOPLE_TAB_IL = "//li[contains(@data-edge, 'keywords_users')]"
  PEOPLE_TAB_TA = "facebook:search_page:people_tab"

  FRIENDS_OF_FRIENDS_FILTER_IL = "//h4[contains(text(), 'Friends of Friends')]"
  FRIENDS_OF_FRIENDS_FILTER_TA = "facebook:search_page:friends_of_friends"

  GROUPS_TAB_IL = "//li[contains(@data-edge, 'keywords_groups')]"
  GROUPS_TAB_TA = "facebook:search_page:groups_tab"

  PUBLIC_GROUP_IL = "//span[contains(text(), 'Public groups')]"
  PUBLIC_GROUP_TA = "facebook:search_page:public_group_btn"

  PHOTOS_TAB_IL =  "//li[contains(@data-edge, 'keywords_blended_photos')]"
  PHOTOS_TAB_TA = "facebook:search_page:photos_tab"

  PUBLIC_PHOTOS_IL = "(//div[@id='BrowseResultsContainer']//div[contains(text(), 'Public Photos')])[1]"
  PUBLIC_PHOTOS_TA = "facebook:search_page:public_photos"

  SEE_ALL_LINK_IL = "(//div[@id='BrowseResultsContainer']//a[contains(text(), 'See All')])[1]"
  SEE_ALL_LINK_TA = "facebook:search_page:see_all_link"


  def should_see_search_results(key = nil)
    element = find_element(key, il_type: :css, tl: SEARCH_RESULTS_TA, il: SEARCH_RESULTS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_add_friend_btn(key = nil)
    element = find_element(key, il_type: :xpath, tl: ADD_FRIEND_BTN_TA, il: ADD_FRIEND_BTN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_people_tabs(key = nil)
    find_element(key, il_type: :xpath, tl: PEOPLE_TAB_TA, il: PEOPLE_TAB_IL, check_path: $check_path).click
  end

  def should_see_friends_of_friends_filter(key = nil)
    element = find_element(key, il_type: :xpath, tl: FRIENDS_OF_FRIENDS_FILTER_TA, il: FRIENDS_OF_FRIENDS_FILTER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_groups_tab(key = nil)
    find_element(key, il_type: :xpath, tl: GROUPS_TAB_TA, il: GROUPS_TAB_IL, check_path: $check_path).click
  end

  def click_public_group_btn(key = nil)
    find_element(key, il_type: :xpath, tl: PUBLIC_GROUP_TA, il: PUBLIC_GROUP_IL, check_path: $check_path).click
  end

  def click_photos_tab(key = nil)
    find_element(key, il_type: :xpath, tl: PHOTOS_TAB_TA, il: PHOTOS_TAB_IL, check_path: $check_path).click
  end

  def should_see_public_photos(key = nil)
    element = find_element(key, il_type: :xpath, tl: PUBLIC_PHOTOS_TA, il: PUBLIC_PHOTOS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_see_all_link(key = nil)
    find_element(key, il_type: :xpath, tl: SEE_ALL_LINK_TA, il: SEE_ALL_LINK_IL, check_path: $check_path).click
  end

end