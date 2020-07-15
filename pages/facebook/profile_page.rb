require_relative '../page_extension'

class ProfilePageFacebook < PageExtension


  NEW_POST_IL = "//a[contains(@label, 'Create Post')]"
  NEW_POST_TA = "facebook:profile_page:new_post"

  SET_TEXT_IL = "(//div[@data-offset-key])[1]"
  SET_TEXT_TA = "facebook:profile_page:set_text"

  POST_BTN_IL = "//button//span[text()='Post']"
  POST_BTN_TA = "facebook:profile_page:post_btn"

  NEW_POST_TEXT_IL = "//div[@data-testid='post_message']//p[text()='new post for test']"
  NEW_POST_TEXT_TA = "facebook:profile_page:new_post_created"

  WRITE_COMMENT_IL = "(//form//div[@aria-label='Write a comment...'])[1]"
  WRITE_COMMENT_TA = "facebook:profile_page:write_a_comment"

  STORY_OPTION_IL = "(//a[@aria-label='Story options'])[1]"
  STORY_OPTION_TA = "facebook:profile_page:story_option"

  DELETE_POST_IL = "//a[@data-feed-option-name='FeedDeleteOption']"
  DELETE_POST_TA = "facebook:profile_page:delete_post"

  CONFIRM_DELETE_IL = "//button[text()='Delete']"
  CONFIRM_DELETE_TA = "facebook:profile_page:accept_delete"

  ABOUT_LINK_IL = "(//ul[@data-referrer='timeline_light_nav_top']//a[contains(text(), 'About')])[1]"
  ABOUT_LINK_TA = "facebook:profile_page:about_btn"

  ADD_COVER_PHOTO_IL = "//a[contains(@class, 'fbTimelineEditCoverButton')]"
  ADD_COVER_PHOTO_TA = "facebook:profile_page:add_cover_photo"

  LAYER_CONFIRM_OK_BTN_IL = "(//button[contains(@class, 'layerConfirm')])[1]"
  LAYER_CONFIRM_OK_BTN_TA = "facebook:profile_page:ok_btn_layer_confirm"

  SELECT_ARTWORK_IL = "//span[contains(text(), 'Select Artwork')]"
  SELECT_ARTWORK_TA = "facebook:profile_page:select_artwork"

  FOURTH_IMG_IL = "(//img[contains(@caption, 'Stock Cover Media Artist')])[4]"
  FOURTH_IMG_TA = "facebook:profile_page:fourth_img"

  SAVE_CHANGES_BTN_IL = "(//button[contains(text(), 'Save Changes')])[1]"
  SAVE_CHANGES_BTN_TA = "facebook:profile_page:save_changes"

  EDIT_COVER_PHOTO_IL = "(//a[contains(@class, 'fbTimelineEditCoverButton')])[1]"
  EDIT_COVER_PHOTO_TA = "facebook:profile_page:edit_cover_photo"

  REMOVE_COVER_PHOTO_IL = "(//span[contains(text(), 'Remove')])[1]"
  REMOVE_COVER_PHOTO_TA = "facebook:profile_page:remove_cover_photo"

  CONFIRM_REMOVING_IL = "(//button[contains(text(), 'Confirm')])[1]"
  CONFIRM_REMOVING_TA = "facebook:profile_page:confirm_removing"

  ADD_COVER_PHOTO_TEXT_IL = "(//span[contains(text(), 'Add Cover Photo')])[1]"
  ADD_COVER_PHOTO_TEXT_TA = "facebook:profile_page:add_cover_photo_text"
  def click_new_post_btn(key = nil)
    find_element(key, il_type: :xpath, tl: NEW_POST_TA, il: NEW_POST_IL, check_path: $check_path).click
  end

  def fill_text(key = nil, value)
    find_element(key, il_type: :xpath, tl: SET_TEXT_TA, il: SET_TEXT_IL, check_path: $check_path).set(value)
  end

  def click_post_btn(key = nil)
    find_element(key, il_type: :xpath, tl: POST_BTN_TA, il: POST_BTN_IL, check_path: $check_path).click
  end

  def should_see_new_post_created(key = nil)
    element = find_element(key, il_type: :xpath, tl: NEW_POST_TEXT_TA, il: NEW_POST_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_comment_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: WRITE_COMMENT_TA, il: WRITE_COMMENT_IL, check_path: $check_path).set(value)
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

  def click_about_btn(key = nil)
    find_element(key, il_type: :xpath, tl: ABOUT_LINK_TA, il: ABOUT_LINK_IL, check_path: $check_path).click
  end

  def click_add_cover_page(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_COVER_PHOTO_TA, il: ADD_COVER_PHOTO_IL, check_path: $check_path).click
  end

  def click_ok_btn_layer_confirm(key = nil)
    find_element(key, il_type: :xpath, tl: LAYER_CONFIRM_OK_BTN_TA, il: LAYER_CONFIRM_OK_BTN_IL, check_path: $check_path).click
  end

  def click_select_artwork(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_ARTWORK_TA, il: SELECT_ARTWORK_IL, check_path: $check_path).click
  end

  def click_fourth_img(key = nil)
    find_element(key, il_type: :xpath, tl: FOURTH_IMG_TA, il: FOURTH_IMG_IL, check_path: $check_path).click
  end

  def click_save_changes(key = nil)
    find_element(key, il_type: :xpath, tl: SAVE_CHANGES_BTN_TA, il: SAVE_CHANGES_BTN_IL, check_path: $check_path).click
    sleep 5 # wait until changes was saved in base
  end

  def click_edit_cover_photo(key = nil)
    find_element(key, il_type: :xpath, tl: EDIT_COVER_PHOTO_TA, il: EDIT_COVER_PHOTO_IL, check_path: $check_path).click
  end

  def click_remove_cover_photo(key = nil)
    find_element(key, il_type: :xpath, tl: REMOVE_COVER_PHOTO_TA, il: REMOVE_COVER_PHOTO_IL, check_path: $check_path).click
  end

  def click_confirm_removing_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_REMOVING_TA, il: CONFIRM_REMOVING_IL, check_path: $check_path).click
  end

  def sees_add_cover_photo_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: ADD_COVER_PHOTO_TEXT_TA, il: ADD_COVER_PHOTO_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end