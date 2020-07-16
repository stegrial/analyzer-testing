require_relative '../page_extension'

class ProductsPage < PageExtension

  EXT_JS_HEADER_IL = "//h1[text()='Try Sencha Ext JS']"
  EXT_JS_HEADER_TA = "sencha:products_page:ext_js_header"

  EXT_ANGULAR_HEADER_IL = "//h1[text()='Sencha ExtAngular']"
  EXT_ANGULAR_HEADER_TA = "sencha:products_page:ext_angular_header"

  EXT_WEB_COMPONENTS_HEADER_IL = "//h1[text()='Sencha ExtWebComponents']"
  EXT_WEB_COMPONENTS_HEADER_TA = "sencha:products_page:ext_web_components_header"

  EXT_REACT_HEADER_IL = "//h1[text()='Sencha ExtReact']"
  EXT_REACT_HEADER_TA = "sencha:products_page:ext_react_header"

  GXT_HEADER_IL = "//h1[text()='Sencha GXT']"
  GXT_HEADER_TA = "sencha:products_page:gxt_header"

  EXT_JS_FULL_TRIAL_TEXT_IL = "//div[@id='ext-element-8']"
  EXT_JS_FULL_TRIAL_TEXT_TA = "sencha:products_page:ext_js_full_trial_text"

  EXT_JS_TRY_30_DAY_TEXT_IL = "//div[@id='ext-element-9']"
  EXT_JS_TRY_30_DAY_TEXT_TA = "sencha:products_page:ext_js_try_30_day_text"

  EXT_JS_FIRST_NAME_IL = "//input[@id='ext-element-13']"
  EXT_JS_FIRST_NAME_TA = "sencha:products_page:ext_js_first_name_field"

  EXT_JS_LAST_NAME_IL = "//input[@id='ext-element-26']"
  EXT_JS_LAST_NAME_TA = "sencha:products_page:ext_js_last_name_field"

  EXT_JS_EMAIL_IL = "//input[@id='ext-element-38']"
  EXT_JS_EMAIL_TA = "sencha:products_page:ext_js_email_field"

  EXT_JS_PHONE_IL = "//input[@id='ext-element-56']"
  EXT_JS_PHONE_TA = "sencha:products_page:ext_js_phone_field"

  EXT_JS_COUNTRY_IL = "//div[@id='ext-expandtrigger-8']"
  EXT_JS_COUNTRY_TA = "sencha:products_page:ext_js_country"

  EXT_JS_COUNTRY_UKRAINE_IL = "//span[text()='UKRAINE']"
  EXT_JS_COUNTRY_UKRAINE_TA = "sencha:products_page:ext_js_country_ukraine"

  EXT_JS_DOWNLOAD_ZIP_IL = "//div[@id='ext-element-433']"
  EXT_JS_DOWNLOAD_ZIP_TA = "sencha:products_page:ext_js_download_zip"

  EXT_JS_I_AGREE_TO_TERMS_IL = "//div[@id='ext-element-132']"
  EXT_JS_I_AGREE_TO_TERMS_TA = "sencha:products_page:ext_js_i_agree_to_terms"

  EXT_JS_I_HAVE_READ_IL = "//div[@id='ext-element-138']//div[@class='x-box-el']"
  EXT_JS_I_HAVE_READ_TA = "sencha:products_page:ext_js_i_have_read"

  EXT_JS_I_AGREE_TO_RECEIVE_IL = "//label[@id='ext-element-148']"
  EXT_JS_I_AGREE_TO_RECEIVE_TA = "sencha:products_page:ext_js_i_agree_to_receive"

  EXT_JS_DOWNLOAD_NOW_IL = "//div[text()='Download Now']"
  EXT_JS_DOWNLOAD_NOW_TA = "sencha:products_page:ext_js_download_now"


  def should_see_ext_js_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_JS_HEADER_TA, il: EXT_JS_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_angular_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_ANGULAR_HEADER_TA, il: EXT_ANGULAR_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_web_components_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_WEB_COMPONENTS_HEADER_TA, il: EXT_WEB_COMPONENTS_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_react_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_REACT_HEADER_TA, il: EXT_REACT_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_gxt_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: GXT_HEADER_TA, il: GXT_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_js_full_trial_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_JS_FULL_TRIAL_TEXT_TA, il: EXT_JS_FULL_TRIAL_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_js_try_30_day_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_JS_TRY_30_DAY_TEXT_TA, il: EXT_JS_TRY_30_DAY_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_ext_js_first_name_field(key = nil, first_name)
    find_element(key, il_type: :xpath, tl: EXT_JS_FIRST_NAME_TA, il: EXT_JS_FIRST_NAME_IL, check_path: $check_path).set(first_name)
  end

  def fill_ext_js_last_name_field(key = nil, last_name)
    find_element(key, il_type: :xpath, tl: EXT_JS_LAST_NAME_TA, il: EXT_JS_LAST_NAME_IL, check_path: $check_path).set(last_name)
  end

  def fill_ext_js_email_field(key = nil, email)
    find_element(key, il_type: :xpath, tl: EXT_JS_EMAIL_TA, il: EXT_JS_EMAIL_IL, check_path: $check_path).set(email)
  end

  def fill_ext_js_phone_field(key = nil, phone)
    find_element(key, il_type: :xpath, tl: EXT_JS_PHONE_TA, il: EXT_JS_PHONE_IL, check_path: $check_path).set(phone)
  end

  def click_ext_js_country(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_JS_COUNTRY_TA, il: EXT_JS_COUNTRY_IL, check_path: $check_path).click
  end

  def click_ext_js_country_ukraine(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_JS_COUNTRY_UKRAINE_TA, il: EXT_JS_COUNTRY_UKRAINE_IL, check_path: $check_path).click
  end

  def click_ext_js_download_zip(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_JS_DOWNLOAD_ZIP_TA, il: EXT_JS_DOWNLOAD_ZIP_IL, check_path: $check_path).click
  end

  def click_ext_js_i_agree_to_terms(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_JS_I_AGREE_TO_TERMS_TA, il: EXT_JS_I_AGREE_TO_TERMS_IL, check_path: $check_path).click
  end

  def click_ext_js_i_have_read(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_JS_I_HAVE_READ_TA, il: EXT_JS_I_HAVE_READ_IL, check_path: $check_path).click
  end

  def click_ext_js_i_agree_to_receive(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_JS_I_AGREE_TO_RECEIVE_TA, il: EXT_JS_I_AGREE_TO_RECEIVE_IL, check_path: $check_path).click
  end

  def click_ext_js_download_now(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_JS_DOWNLOAD_NOW_TA, il: EXT_JS_DOWNLOAD_NOW_IL, check_path: $check_path).click
  end

end
