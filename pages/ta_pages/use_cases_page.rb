require_relative '../page_extension'

class UseCasesPage < PageExtension


  FASTER_TESTS_H2_IL = "//h2[text()='Up to 10X FASTER test preparation stage']"
  FASTER_TESTS_H2_TA = "ta:use_cases_page:faster_tests_h2"

  TA_SMART_LOCATORS_IL = "//p[contains(text(), 'TrueAutomation Smart locators do not rely on classic IDs')]"
  TA_SMART_LOCATORS_TA = "ta:use_cases_page:ta_smart_locators"

  MINIMIZE_TESTS_MAINTENANCE_IL = "//h2[text()='Minimize Tests Maintenance']"
  MINIMIZE_TESTS_MAINTENANCE_TA = "ta:use_cases_page:minimize_tests_maintenance"

  MAIN_TEXT_OF_PAGE_IL = "//h1[contains(text(),'A combination of different approaches')]"
  MAIN_TEXT_OF_PAGE_TA = "ta:use_cases_page:main_text_of_use_cases_page"

  VIEW_DETAILS_OF_WRITE_IL = "(//div[contains(@class,'jet-button__state-normal')])[3]"
  VIEW_DETAILS_OF_WRITE_TA = "ta:use_cases_page:view_details_of_write"

  VIEW_DETAILS_OF_COVER_IL = "(//div[contains(@class,'jet-button__state-normal')])[3]"
  VIEW_DETAILS_OF_COVER_TA = "ta:use_cases_page:view_details_of_cover"

  VIEW_DETAILS_OF_MINIMIZE_IL = "(//div[contains(@class,'jet-button__state-normal')])[3]"
  VIEW_DETAILS_OF_MINIMIZE_TA = "ta:use_cases_page:view_details_of_minimize"

  GET_A_TRIAL_BTN_1_IL = "(//span[@class='jet-button__label'])[3]"
  GET_A_TRIAL_BTN_1_TA = "ta:use_cases_page:get_a_trial_1"

  GET_A_TRIAL_BTN_2_IL = "(//span[text()='GET A TRIAL'])[2]"
  GET_A_TRIAL_BTN_2_TA = "ta:use_cases_page:get_a_trial_2"

  REQUEST_A_DEMO_IL = "(//span[contains(@class, 'jet-button__label') and text()='REQUEST A DEMO'])[1]"
  REQUEST_A_DEMO_TA = "ta:use_cases_page:request_a_demo"


  def should_see_faster_tests_h2(key = nil)
    element = find_element(key, il_type: :xpath, tl: FASTER_TESTS_H2_TA, il: FASTER_TESTS_H2_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ta_smart_locators_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: TA_SMART_LOCATORS_TA, il: TA_SMART_LOCATORS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_minimize_tests_maintenance(key = nil)
    element = find_element(key, il_type: :xpath, tl: MINIMIZE_TESTS_MAINTENANCE_TA, il: MINIMIZE_TESTS_MAINTENANCE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_main_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: MAIN_TEXT_OF_PAGE_TA, il: MAIN_TEXT_OF_PAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_view_details_of_write(key = nil)
    find_element(key, il_type: :xpath, tl: VIEW_DETAILS_OF_WRITE_TA, il: VIEW_DETAILS_OF_WRITE_IL, check_path: $check_path).click
  end

  def click_view_details_of_cover(key = nil)
    find_element(key, il_type: :xpath, tl: VIEW_DETAILS_OF_COVER_TA, il: VIEW_DETAILS_OF_COVER_IL, check_path: $check_path).click
  end

  def click_view_details_of_minimize(key = nil)
    find_element(key, il_type: :xpath, tl: VIEW_DETAILS_OF_MINIMIZE_TA, il: VIEW_DETAILS_OF_MINIMIZE_IL, check_path: $check_path).click
  end

  def click_get_a_trial_1(key = nil)
    find_element(key, il_type: :xpath, tl: GET_A_TRIAL_BTN_1_TA, il: GET_A_TRIAL_BTN_1_IL, check_path: $check_path).click
  end

  def click_get_a_trial_2(key = nil)
    find_element(key, il_type: :xpath, tl: GET_A_TRIAL_BTN_2_TA, il: GET_A_TRIAL_BTN_2_IL, check_path: $check_path).click
  end

  def click_request_a_demo_btn(key = nil)
    find_element(key, il_type: :xpath, tl: REQUEST_A_DEMO_TA, il: REQUEST_A_DEMO_IL, check_path: $check_path).click
  end

end