require_relative '../page_extension'

class ProductPage < PageExtension


  HOW_IT_WORKS_TEXT_IL = "//h2[text()='How it works']"
  HOW_IT_WORKS_TEXT_TA = "ta:product_page:how_it_works_text"

  CAPABILITY_TEXT_IL = "//h2[contains(text(), 'Supported right Now')]"
  CAPABILITY_TEXT_TA = "ta:product_page:capability_text"

  TRY_IT_NOW_BTN_IL = "(//div[contains(@class, 'jet-button__state-normal')])[2]"
  TRY_IT_NOW_BTN_TA = "ta:product_page:try_it_now_btn"

  CHECK_OUT_DOCUMENTATION_IL = "(//div[contains(@class, 'jet-button__state-normal')])[3]"
  CHECK_OUT_DOCUMENTATION_TA = "ta:product_page:check_out_documentation"

  CHECK_OUT_DOCUMENTATION_2_IL = "(//a[contains(@class, 'jet-button__instance--icon- hover-effect-4')])[3]"
  CHECK_OUT_DOCUMENTATION_2_TA = "ta:product_page:check_out_documentation2"

  CHECK_OUT_DOCUMENTATION_3_IL = "(//span[contains(text(), 'CHECK OUT DOCUMENTATION')])[5]"
  CHECK_OUT_DOCUMENTATION_3_TA = "ta:product_page:check_out_documentation2"

  SUBMIT_A_FUTURE_REQUEST_IL = "//span[@class='elementor-button-text']"
  SUBMIT_A_FUTURE_REQUEST_TA =  "ta:product_page:submit_a_feature_request"


  def should_see_how_it_works_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: HOW_IT_WORKS_TEXT_TA, il: HOW_IT_WORKS_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_supported_right_now(key = nil)
    element = find_element(key, il_type: :xpath, tl: CAPABILITY_TEXT_TA, il: CAPABILITY_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_try_it_now_btn(key = nil)
    find_element(key, il_type: :xpath, tl: TRY_IT_NOW_BTN_TA, il: TRY_IT_NOW_BTN_IL, check_path: $check_path).click
  end

  def click_check_out_docs_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CHECK_OUT_DOCUMENTATION_TA, il: CHECK_OUT_DOCUMENTATION_IL, check_path: $check_path).click
  end

  def click_check_out_docs_2_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CHECK_OUT_DOCUMENTATION_2_TA, il: CHECK_OUT_DOCUMENTATION_2_IL, check_path: $check_path).click
  end

  def click_check_out_docs_3_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CHECK_OUT_DOCUMENTATION_3_TA, il: CHECK_OUT_DOCUMENTATION_3_IL, check_path: $check_path).click
  end

  def click_submit_a_feature_request(key = nil)
    find_element(key, il_type: :xpath, tl: SUBMIT_A_FUTURE_REQUEST_TA, il: SUBMIT_A_FUTURE_REQUEST_IL, check_path: $check_path).click
  end

end