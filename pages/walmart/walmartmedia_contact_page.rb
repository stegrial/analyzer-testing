require_relative '../page_extension'

class WalmartMediaContactPage < PageExtension


  CONTACT_INFO_IL = "//span[contains(text(), 'Contact Information')]"
  CONTACT_INFO_TA = "walmart:media_contact_page:contact_info"

  FIRST_NAME_INPUT_IL = "#first-name"
  FIRST_NAME_INPUT_TA = "walmart:media_contact_page:first_name"

  LAST_NAME_IL = "#last-name"
  LAST_NAME_TA = "walmart:media_contact_page:last_name"

  COMPANY_NAME_IL = "#company-name"
  COMPANY_NAME_TA =  "walmart:media_contact_page:company_name"

  COMPANY_WEBSITE_IL =  "#company-website"
  COMPANY_WEBSITE_TA =  "walmart:media_contact_page:company_website"

  EMAIL_IL = "#email"
  EMAIL_TA = "walmart:media_contact_page:email_field"

  PHONE_IL = "#phone"
  PHONE_TA = "walmart:media_contact_page:phone_field"

  MORE_THAN_2500_IL = "//span[text()='More than $25,000/month']"
  MORE_THAN_2500_TA = "walmart:media_contact_page:more_than_2500"

  CHOOSE_PRODUCT_IL = "#product"
  CHOOSE_PRODUCT_TA = "walmart:media_contact_page:choose_product"

  ADVERTISING_STRATEGY_IL = "//li[@data-value='Advertising strategy']"
  ADVERTISING_STRATEGY_TA = "walmart:media_contact_page:advertising_strategy"

  EXTRA_TEXT_IL = "#extra-info"
  EXTRA_TEXT_TA = "walmart:media_contact_page:extra_text"

  HUMAN_CHECKBOX_IL = "//span[contains(text(), ' breathing person.')]"
  HUMAN_CHECKBOX_TA = "walmart:media_contact_page:human_checkbox"

  ACCEPTS_IL = "//span[contains(text(), 'I have read the')]"
  ACCEPTS_TA = "walmart:media_contact_page:accepts_checkbox"

  CONTINUE_BTN_IL = "//button[contains(@class, 'MuiButton-containedPrimary')]"
  CONTINUE_BTN_TA = "walmart:media_contact_page:continue_btn"


  def should_see_contact_info(key = nil)
    element = find_element(key, il_type: :xpath, tl: CONTACT_INFO_TA, il: CONTACT_INFO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_first_name(key = nil, value)
    find_element(key, il_type: :css, tl: FIRST_NAME_INPUT_TA, il: FIRST_NAME_INPUT_IL, check_path: $check_path).set(value)
  end

  def fill_last_name(key = nil, value)
    find_element(key, il_type: :css, tl: LAST_NAME_TA, il: LAST_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_company_name(key = nil, value)
    find_element(key, il_type: :css, tl: COMPANY_NAME_TA, il: COMPANY_NAME_IL, check_path: $check_path).set(value)
  end

  def fill_company_website(key = nil, value)
    find_element(key, il_type: :css, tl: COMPANY_WEBSITE_TA, il: COMPANY_WEBSITE_IL, check_path: $check_path).set(value)
  end

  def fill_email_field(key = nil, value)
    find_element(key, il_type: :css, tl: EMAIL_TA, il: EMAIL_IL, check_path: $check_path).set(value)
  end

  def fill_phone_field(key = nil, value)
    find_element(key, il_type: :css, tl: PHONE_TA, il: PHONE_IL, check_path: $check_path).set(value)
  end

  def click_more_than_2500(key = nil)
    find_element(key, il_type: :xpath, tl: MORE_THAN_2500_TA, il: MORE_THAN_2500_IL, check_path: $check_path).click
  end

  def click_choose_product(key = nil)
    find_element(key, il_type: :css, tl: CHOOSE_PRODUCT_TA, il: CHOOSE_PRODUCT_IL, check_path: $check_path).click
  end

  def click_advertising_strategy(key = nil)
    find_element(key, il_type: :xpath, tl: ADVERTISING_STRATEGY_TA, il: ADVERTISING_STRATEGY_IL, check_path: $check_path).click
  end

  def fill_extra_text(key = nil, value)
    find_element(key, il_type: :css, tl: EXTRA_TEXT_TA, il: EXTRA_TEXT_IL, check_path: $check_path).set(value)
  end

  def click_human_checkbox(key = nil)
    find_element(key, il_type: :xpath, tl: HUMAN_CHECKBOX_TA, il: HUMAN_CHECKBOX_IL, check_path: $check_path).click
  end

  def click_accepts_checkbox(key = nil)
    find_element(key, il_type: :xpath, tl: ACCEPTS_TA, il: ACCEPTS_IL, check_path: $check_path).click
  end

  def click_continue_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CONTINUE_BTN_TA, il: CONTINUE_BTN_IL, check_path: $check_path).click
  end

end