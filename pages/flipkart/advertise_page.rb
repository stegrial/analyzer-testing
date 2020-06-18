require_relative '../page_extension'

class AdvertisePageFlipkart < PageExtension


  POWER_OF_COMMERCE_H2_IL = "//h2[text()='Power of commerce audience']"
  POWER_OF_COMMERCE_H2_TA = "flipkart:advertise_page:power_of_commerce_h2"

  VIEW_ALL_BTN_IL = "(//button[text()=' View All'])[2]"
  VIEW_ALL_BTN_TA = "flipkart:advertise_page:view_all_btn"

  CONTACT_US_H2_IL = "//h2[text()='Contact Us']"
  CONTACT_US_H2_TA = "flipkart:advertise_page:contact_us"

  POSITION_SELECT_IL = "#input_1_5"
  POSITION_SELECT_TA = "flipkart:advertise_page:position_select"

  NAME_INPUT_IL = "#input_1_1"
  NAME_INPUT_TA = "flipkart:advertise_page:name"

  EMAIL_INPUT_IL = "#field_1_2"
  EMAIL_INPUT_TA = "flipkart:advertise_page:email"

  PHONE_NUMBER_IL = "li#field_1_3"
  PHONE_NUMBER_TA = "flipkart:advertise_page:phone_number"

  COMPANY_IL = "input#input_1_4"
  COMPANY_TA = "flipkart:advertise_page:company"

  ORGANIZATION_SIZE_IL = "select#input_1_6"
  ORGANIZATION_SIZE_TA = "flipkart:advertise_page:organization_size"

  MARKETING_BUDGET_IL = "select#input_1_7"
  MARKETING_BUDGET_TA = "flipkart:advertise_page:annual_marketing_budget"

  SUBMIT_IL = "button#gform_submit_button_1"
  SUBMIT_TA = "flipkart:advertise_page:submit"


  def click_on_arrow_next(key = nil)
    find_element(key, il_type: :xpath, tl: ARROW_NEXT_TA, il: ARROW_NEXT_IL, check_path: $check_path).click
  end

  def click_on_arrow_prev(key = nil)
    find_element(key, il_type: :xpath, tl: ARROW_PREV_TA, il: ARROW_PREV_IL, check_path: $check_path).click
  end

  def should_see_power_of_commerce_h2(key = nil)
    element = find_element(key, il_type: :xpath, tl: POWER_OF_COMMERCE_H2_TA, il: POWER_OF_COMMERCE_H2_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_contact_us_h2(key = nil)
    element = find_element(key, il_type: :xpath, tl: CONTACT_US_H2_TA, il: CONTACT_US_H2_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_position_select(key = nil, value)
    find_element(key, il_type: :css, tl: POSITION_SELECT_TA, il: POSITION_SELECT_IL, check_path: $check_path).select(value)
  end

  def fill_name_field(key = nil, value)
    find_element(key, il_type: :css, tl: NAME_INPUT_TA, il: NAME_INPUT_IL, check_path: $check_path).set(value)
  end

  def fill_email_field(key = nil, value)
    find_element(key, il_type: :css, tl: EMAIL_INPUT_TA, il: EMAIL_INPUT_IL, check_path: $check_path).set(value)
  end

  def fill_phone_number_field(key = nil, value)
    find_element(key, il_type: :css, tl: PHONE_NUMBER_TA, il: PHONE_NUMBER_IL, check_path: $check_path).set(value)
  end

  def fill_company_field(key = nil, value)
    find_element(key, il_type: :css, tl: COMPANY_TA, il: COMPANY_IL, check_path: $check_path).set(value)
  end

  def click_on_organization_size(key = nil, value)
    find_element(key, il_type: :css, tl: ORGANIZATION_SIZE_TA, il: ORGANIZATION_SIZE_IL, check_path: $check_path).select(value)
  end

  def click_on_marketing_budget(key = nil, value)
    find_element(key, il_type: :css, tl: MARKETING_BUDGET_TA, il: MARKETING_BUDGET_IL, check_path: $check_path).select(value)
  end

  def click_on_submit_btn(key = nil)
    find_element(key, il_type: :css, tl: SUBMIT_TA, il: SUBMIT_IL, check_path: $check_path).click
  end

  def should_see_view_all_btn(key = nil)
    element = find_element(key, il_type: :xpath, tl: VIEW_ALL_BTN_TA, il: VIEW_ALL_BTN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end