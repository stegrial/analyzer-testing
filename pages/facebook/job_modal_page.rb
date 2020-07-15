require_relative '../page_extension'

class JobModalPageFacebook < PageExtension


  CREATE_JOB_IL = "//h3[contains(text(), 'Create Job')][1]"
  CREATE_JOB_TA = "facebook:job_modal_page:create_job_h3"

  JOB_TITLE_IL = "#job_composer_job_title"
  JOB_TITLE_TA = "facebook:job_modal_page:job_title"

  JOB_LOCATION_IL = "//input[@placeholder='Add an address']"
  JOB_LOCATION_TA = "facebook:job_modal_page:job_location"

  ODESSA_ROAD_IL= "(//span[contains(text(),'Odessa Road, London, E7 9, United Kingdom')])[1]"
  ODESSA_ROAD_TA= "facebook:job_modal_page:odessa_road"

  SALARY_MIN_IL = "(//input[contains(@placeholder,'Minimum')])[1]"
  SALARY_MIN_TA = "facebook:job_modal_page:salary_minimum"

  SALARY_MAX_IL = "(//input[contains(@placeholder,'Maximum')])[1]"
  SALARY_MAX_TA = "facebook:job_modal_page:salary_maximum"

  PER_HOUR_IL = "(//div[contains(text(),'per hour')])[1]"
  PER_HOUR_TA = "facebook:job_modal_page:per_hour"

  PER_MONTH_IL = "(//div[contains(text(),'per month')])[1]"
  PER_MONTH_TA = "facebook:job_modal_page:per_month"

  JOB_TYPE_IL = "(//div[contains(text(),'Full-time')])[1]"
  JOB_TYPE_TA = "facebook:job_modal_page:full_time"

  INTERNSHIP_TYPE_IL = "(//div[contains(text(),'Internship')])[1]"
  INTERNSHIP_TYPE_TA = "facebook:job_modal_page:internship_type"

  JOB_DESCRIPTION_IL = "(//textarea[contains(@id,'Job Description')])[1]"
  JOB_DESCRIPTION_TA = "facebook:job_modal_page:job_description"

  REMOVE_APP_QUESTIONS_IL = "(//button[contains(@title,'Remove')])[1]"
  REMOVE_APP_QUESTIONS_TA = "facebook:job_modal_page:remove_app_question"

  USE_COVER_IMG_IL = "(//button[contains(text(),'Use Cover Photo')])[1]"
  USE_COVER_IMG_TA = "facebook:job_modal_page:use_cover_photo"

  RECEIVE_APP_EMAIL_IL = "(//input[contains(@id,'job_composer_application_notification_email')])[1]"
  RECEIVE_APP_EMAIL_TA = "facebook:job_modal_page:receive_app_email"

  PREVIEW_JOB_IL = "(//a[contains(text(),'Preview Job')])[1]"
  PREVIEW_JOB_TA = "facebook:job_modal_page:preview_job_link"

  JOB_PREVIEW_IL = "(//div[contains(text(),'Job Preview')])[1]"
  JOB_PREVIEW_TA = "facebook:job_modal_page:preview_job_text"

  CLOSE_JOB_PREVIEW_MODAL_IL = "(//button[contains(@class,'layerCancel')])[2]"
  CLOSE_JOB_PREVIEW_MODAL_TA = "facebook:job_modal_page:close_job_preview_modal"

  CLOSE_CREATE_JOB_MODAL_IL = "(//button[contains(@class,'layerCancel')])[1]"
  CLOSE_CREATE_JOB_MODAL_TA = "facebook:job_modal_page:close_create_job_modal"

  DISCARD_BTN_IL = "(//a[contains(text(),'Discard')])[1]"
  DISCARD_BTN_TA = "facebook:job_modal_page:discard_btn"

  def should_see_create_job_h3(key = nil)
    element = find_element(key, il_type: :xpath, tl: CREATE_JOB_TA, il: CREATE_JOB_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_job_title(key = nil, value)
    find_element(key, il_type: :css, tl: JOB_TITLE_TA, il: JOB_TITLE_IL, check_path: $check_path).set(value)
  end

  def click_job_location(key = nil, value)
    find_element(key, il_type: :xpath, tl: JOB_LOCATION_TA, il: JOB_LOCATION_IL, check_path: $check_path).set(value)
  end

  def click_odessa_road(key = nil)
    find_element(key, il_type: :xpath, tl: ODESSA_ROAD_TA, il: ODESSA_ROAD_IL, check_path: $check_path).click
  end

  def fill_salary_minimum(key = nil, value)
    find_element(key, il_type: :xpath, tl: SALARY_MIN_TA, il: SALARY_MIN_IL, check_path: $check_path).set(value)
  end

  def fill_salary_maximum(key = nil, value)
    find_element(key, il_type: :xpath, tl: SALARY_MAX_TA, il: SALARY_MAX_IL, check_path: $check_path).set(value)
  end

  def click_per_hour(key = nil)
    find_element(key, il_type: :xpath, tl: PER_HOUR_TA, il: PER_HOUR_IL, check_path: $check_path).click
  end

  def click_per_month(key = nil)
    find_element(key, il_type: :xpath, tl: PER_MONTH_TA, il: PER_MONTH_IL, check_path: $check_path).click
  end

  def click_job_type(key = nil)
    find_element(key, il_type: :xpath, tl: JOB_TYPE_TA, il: JOB_TYPE_IL, check_path: $check_path).click
  end

  def click_internship_type(key = nil)
    find_element(key, il_type: :xpath, tl: INTERNSHIP_TYPE_TA, il: INTERNSHIP_TYPE_IL, check_path: $check_path).click
  end

  def click_job_description(key = nil, value)
    find_element(key, il_type: :xpath, tl: JOB_DESCRIPTION_TA, il: JOB_DESCRIPTION_IL, check_path: $check_path).set(value)
  end

  def click_remove_app_question(key = nil)
    find_element(key, il_type: :xpath, tl: REMOVE_APP_QUESTIONS_TA, il: REMOVE_APP_QUESTIONS_IL, check_path: $check_path).click
  end

  def click_use_cover_photo(key = nil)
    find_element(key, il_type: :xpath, tl: USE_COVER_IMG_TA, il: USE_COVER_IMG_IL, check_path: $check_path).click
  end

  def click_receive_app_email(key = nil, value)
    find_element(key, il_type: :xpath, tl: RECEIVE_APP_EMAIL_TA, il: RECEIVE_APP_EMAIL_IL, check_path: $check_path).set(value)
  end

  def click_preview_job_link(key = nil)
    find_element(key, il_type: :xpath, tl: PREVIEW_JOB_TA, il: PREVIEW_JOB_IL, check_path: $check_path).click
  end

  def should_see_preview_job_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: JOB_PREVIEW_TA, il: JOB_PREVIEW_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_close_job_preview_modal(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_JOB_PREVIEW_MODAL_TA, il: CLOSE_JOB_PREVIEW_MODAL_IL, check_path: $check_path).click
  end

  def click_close_create_job_modal(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_CREATE_JOB_MODAL_TA, il: CLOSE_CREATE_JOB_MODAL_IL, check_path: $check_path).click
  end

  def click_discard_btn(key = nil)
    find_element(key, il_type: :xpath, tl: DISCARD_BTN_TA, il: DISCARD_BTN_IL, check_path: $check_path).click
  end

end