require_relative '../page_extension'

class HomePage< PageExtension


  MAIN_TEXT_IL = "//span[text()='powered by ']"
  MAIN_TEXT_TA = "ta:home_page:powered_by"

  GET_A_TRIAL_BTN_IL = "(//div[contains(@class,'jet-button__state-normal')])[2]"
  GET_A_TRIAL_BTN_TA = "ta:home_page:get_a_trial_btn"

  LEARN_MORE_BTN_IL = "(//div[contains(@class,'jet-button__state-normal')])[3]"
  LEARN_MORE_BTN_TA = "ta:home_page:learn_more_btn"

  WRITE_FASTER_IL = "(//div[@class='elementor-icon-box-icon'])[1]"
  WRITE_FASTER_TA = "ta:home_page:write_tests_faster_link"

  COVER_MORE_IL = "(//div[@class='elementor-icon-box-icon'])[2]"
  COVER_MORE_TA = "ta:home_page:cover_more_technologies"

  MINIMIZE_MAINTENANCE_IL = "(//div[@class='elementor-icon-box-icon'])[3]"
  MINIMIZE_MAINTENANCE_TA = "ta:home_page:minimize_maintenance"

  TRY_THE_SOLUTION_IL = "(//div[contains(@class, 'jet-button__state-normal')])[4]"
  TRY_THE_SOLUTION_TA = "ta:home_page:try_the_solution_btn"

  LEARN_MORE_TA_WORKS_BTN_IL = "(//div[contains(@class, 'jet-button__state-normal')])[5]"
  LEARN_MORE_TA_WORKS_BTN_TA = "ta:home_page:learn_more_btn"

  REQUEST_A_DEMO_IL = "(//div[contains(@class, 'jet-button__state-normal')])[6]"
  REQUEST_A_DEMO_TA = "ta:home_page:request_a_demo"


  def should_see_main_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: MAIN_TEXT_TA, il: MAIN_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_get_a_trial(key = nil)
    find_element(key, il_type: :xpath, tl: GET_A_TRIAL_BTN_TA, il: GET_A_TRIAL_BTN_IL, check_path: $check_path).click
  end

  def click_learn_more_btn(key = nil)
    find_element(key, il_type: :xpath, tl: LEARN_MORE_BTN_TA, il: LEARN_MORE_BTN_IL, check_path: $check_path).click
  end

  def click_write_faster_btn(key = nil)
    find_element(key, il_type: :xpath, tl: WRITE_FASTER_TA, il: WRITE_FASTER_IL, check_path: $check_path).click
  end

  def click_cover_more_btn(key = nil)
    find_element(key, il_type: :xpath, tl: COVER_MORE_TA, il: COVER_MORE_IL, check_path: $check_path).click
  end

  def click_minimize_maintenance_btn(key = nil)
    find_element(key, il_type: :xpath, tl: MINIMIZE_MAINTENANCE_TA, il: MINIMIZE_MAINTENANCE_IL, check_path: $check_path).click
  end

  def click_try_the_solution_btn(key = nil)
    find_element(key, il_type: :xpath, tl: TRY_THE_SOLUTION_TA, il: TRY_THE_SOLUTION_IL, check_path: $check_path).click
  end

  def click_learn_more_ta_works_btn(key = nil)
    find_element(key, il_type: :xpath, tl: LEARN_MORE_TA_WORKS_BTN_TA, il: LEARN_MORE_TA_WORKS_BTN_IL, check_path: $check_path).click
  end

  def click_request_a_demo_btn(key = nil)
    find_element(key, il_type: :xpath, tl: REQUEST_A_DEMO_TA, il: REQUEST_A_DEMO_IL, check_path: $check_path).click
  end

end