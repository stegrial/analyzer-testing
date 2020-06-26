require_relative '../page_extension'

class MainPageWalmart < PageExtension


  EDIT_ZIPCODE_IL = "//button[contains(@aria-label,'Edit delivery zip code')]"
  EDIT_ZIPCODE_TA = "walmart:main_page:edit_delivery_zipcode"

  ENTER_LOCATION_TEXT_IL = "//*[@id='next-day-location-modal']//*[text()='Enter Location']"
  ENTER_LOCATION_TEXT_TA = "walmart:main_page:enter_location_text"

  SET_ZIP_CODE_IL = "//*[@id='next-day-location-modal']//*[@data-tl-id='zipcode-form-input']"
  SET_ZIP_CODE_TA = "walmart:main_page:set_zip_code"

  UPDATE_LOCATION_IL = "//*[@id='next-day-location-modal']//button[text()='Update location']"
  UPDATE_LOCATION_TA = "walmart:main_page:update_location"

  FEEDBACK_IL = "#hf-feedback-tab-text"
  FEEDBACK_TA = "walmart:main_page:feedback"

  EXPERIENCE_TEXT_IL= "//div[text()='How was your experience?']"
  EXPERIENCE_TEXT_TA= "walmart:main_page:how_was_your_experience_text"

  GOOD_STAR_IL = "//button[@aria-label='Good']"
  GOOD_STAR_TA = "walmart:main_page:good_star"

  ADD_COMMENT_IL = "//textarea[@name='feedback-comments']"
  ADD_COMMENT_TA = "walmart:main_page:add_comment"

  SUBMIT_IL = "#hf-feedback-bubble-submit"
  SUBMIT_TA = "walmart:main_page:submit"


  def click_edit_delivery_zipcode(key = nil)
    find_element(key, il_type: :xpath, tl: EDIT_ZIPCODE_TA, il: EDIT_ZIPCODE_IL, check_path: $check_path).click
  end

  def should_see_enter_location_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: ENTER_LOCATION_TEXT_TA, il: ENTER_LOCATION_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_set_zip_code(key = nil, value)
    find_element(key, il_type: :xpath, tl: SET_ZIP_CODE_TA, il: SET_ZIP_CODE_IL, check_path: $check_path).set(value)
  end

  def click_update_location(key = nil)
    find_element(key, il_type: :xpath, tl: UPDATE_LOCATION_TA, il: UPDATE_LOCATION_IL, check_path: $check_path).click
  end

  def click_feedback(key = nil)
    find_element(key, il_type: :css, tl: FEEDBACK_TA, il: FEEDBACK_IL, check_path: $check_path).click
  end

  def should_see_your_experience_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXPERIENCE_TEXT_TA, il: EXPERIENCE_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_good_star(key = nil)
    find_element(key, il_type: :xpath, tl: GOOD_STAR_TA, il: GOOD_STAR_IL, check_path: $check_path).click
  end

  def set_text_in_add_comment_field(key = nil, value)
    find_element(key, il_type: :xpath, tl: ADD_COMMENT_TA, il: ADD_COMMENT_IL, check_path: $check_path).set(value)
  end

  def click_submit_btn(key = nil)
    find_element(key, il_type: :css, tl: SUBMIT_TA, il: SUBMIT_IL, check_path: $check_path).click
  end

end