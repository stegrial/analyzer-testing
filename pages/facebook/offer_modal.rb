require_relative '../page_extension'

class OfferPageFacebook < PageExtension


  DISCOUNT_PERCENT_IL = "//button[contains(@data-tooltip-content, 'Discount Percent')]"
  DISCOUNT_PERCENT_TA = "facebook:offer_page:discount_percent"

  OFFER_TYPE_IL= "//div[contains(text(), 'Example: $10 Off')]"
  OFFER_TYPE_TA= "facebook:offer_page:offer_type"

  DISCOUNT_AMOUNT_IL = "//div[@class='uiScrollableAreaContent']//input[contains(@value, '$10')]"
  DISCOUNT_AMOUNT_TA = "facebook:offer_page:discount_amount"

  DISCOUNTED_ITEMS_IL = "//div[@class='uiScrollableAreaContent']//input[contains(@placeholder, 'Add items or services to this offer')]"
  DISCOUNTED_ITEMS_TA = "facebook:offer_page:discounted_items"

  ADD_DESCRIPTION_IL = "//div[@class='uiScrollableAreaContent']//a[contains(text(), 'Add description')]"
  ADD_DESCRIPTION_TA = "facebook:offer_page:add_description"

  FILL_DESCRIPTION_IL = "(//div[@class='uiScrollableAreaContent']//textarea)[1]"
  FILL_DESCRIPTION_TA = "facebook:offer_page:fill_description"

  EXPIRES_DATE_IL = "//div[@class='uiScrollableAreaContent']//input[contains(@placeholder, 'mm/dd/yyyy')]"
  EXPIRES_DATE_TA = "facebook:offer_page:expires_date"

  IN_STORE_CHECKBOX_IL = "(//input[@type='checkbox'])[8]"
  IN_STORE_CHECKBOX_TA = "facebook:offer_page:in_store_checkbox"

  PRIMARY_ACTION_IL= "(//div[@class='uiScrollableAreaContent']//button[contains(@data-testid, 'SUIAbstractMenu/button')])[2]"
  PRIMARY_ACTION_TA= "facebook:offer_page:primary_action"

  SEND_MSG_IL = "(//div[@class='uiScrollableAreaContent']//div[contains(text(), 'Send Message')])[1]"
  SEND_MSG_TA = "facebook:offer_page:send_message"

  ADD_TERMS_AND_CONDITIONS_IL = "(//div[@class='uiScrollableAreaContent']//a[contains(text(), 'Add terms and conditions')])[1]"
  ADD_TERMS_AND_CONDITIONS_TA = "facebook:offer_page:terms_and_conditions"

  FILL_TERMS_AND_CONDITIONS_IL = "(//div[@class='uiScrollableAreaContent']//textarea)[2]"
  FILL_TERMS_AND_CONDITIONS_TA = "facebook:offer_page:fill_terms_and_conditions"

  PUBLISH_OFFER_BTN_IL = "(//div[text()='Publish'])[1]"
  PUBLISH_OFFER_BTN_TA = "facebook:offer_page:publish_btn"

  SELECT_PHOTO_FROM_IL = "(//a[contains(@tooltip,'Choose From Photos')])[1]"
  SELECT_PHOTO_FROM_TA = "facebook:offer_page:choose_from_photos"

  FIRST_IMG_IL = "(//div[contains(@class,'_8fmy uiScaledImageContainer')])[1]"
  FIRST_IMG_TA = "facebook:offer_page:first_photo"

  def click_discount_percent(key = nil)
    find_element(key, il_type: :xpath, tl: DISCOUNT_PERCENT_TA, il: DISCOUNT_PERCENT_IL, check_path: $check_path).click
  end

  def click_offer_type(key = nil)
    find_element(key, il_type: :xpath, tl: OFFER_TYPE_TA, il: OFFER_TYPE_IL, check_path: $check_path).click
  end

  def fill_discount_amount(key = nil, value)
    find_element(key, il_type: :xpath, tl: DISCOUNT_AMOUNT_TA, il: DISCOUNT_AMOUNT_IL, check_path: $check_path).set(value)
  end

  def fill_discounted_items(key = nil, value)
    find_element(key, il_type: :xpath, tl: DISCOUNTED_ITEMS_TA, il: DISCOUNTED_ITEMS_IL, check_path: $check_path).set(value)
  end

  def click_add_descriptions(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_DESCRIPTION_TA, il: ADD_DESCRIPTION_IL, check_path: $check_path).click
  end

  def fill_description_offer(key = nil, value)
    find_element(key, il_type: :xpath, tl: FILL_DESCRIPTION_TA, il: FILL_DESCRIPTION_IL, check_path: $check_path).set(value)
  end

  def fill_expires_date(key = nil, value)
    find_element(key, il_type: :xpath, tl: EXPIRES_DATE_TA, il: EXPIRES_DATE_IL, check_path: $check_path).set(value)
  end

  def click_in_store_checkbox(key = nil)
    find_element(key, il_type: :xpath, tl: IN_STORE_CHECKBOX_TA, il: IN_STORE_CHECKBOX_IL, check_path: $check_path).click
  end

  def click_primary_action(key = nil)
    find_element(key, il_type: :xpath, tl: PRIMARY_ACTION_TA, il: PRIMARY_ACTION_IL, check_path: $check_path).click
  end

  def select_send_message(key = nil)
    find_element(key, il_type: :xpath, tl: SEND_MSG_TA, il: SEND_MSG_IL, check_path: $check_path).click
  end

  def click_terms_and_conditions(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TERMS_AND_CONDITIONS_TA, il: ADD_TERMS_AND_CONDITIONS_IL, check_path: $check_path).click
  end

  def fill_terms_and_conditions(key = nil, value)
    find_element(key, il_type: :xpath, tl: FILL_TERMS_AND_CONDITIONS_TA, il: FILL_TERMS_AND_CONDITIONS_IL, check_path: $check_path).set(value)
  end

  def click_publish_offer_btn(key = nil)
    find_element(key, il_type: :xpath, tl: PUBLISH_OFFER_BTN_TA, il: PUBLISH_OFFER_BTN_IL, check_path: $check_path).click
  end

  def click_first_photo(key = nil)
    find_element(key, il_type: :xpath, tl: FIRST_IMG_TA, il: FIRST_IMG_IL, check_path: $check_path).click
    sleep 5 #wait for img upload
  end

  def click_choose_from_photos(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_PHOTO_FROM_TA, il: SELECT_PHOTO_FROM_IL, check_path: $check_path).click
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


end