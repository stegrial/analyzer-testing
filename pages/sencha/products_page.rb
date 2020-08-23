require_relative '../page_extension'

class ProductsPage < PageExtension

  EXT_JS_HEADER_IL = "//h1[@class='dlTrialH1']"
  EXT_JS_HEADER_TA = "sencha:products_page:ext_js_header"

  EXT_JS_HEADER_TEXT_IL = "//h2[@class='dlTrialH2']"
  EXT_JS_HEADER_TEXT_TA = "sencha:products_page:ext_js_header_text"

  EXT_JS_TRY_30_DAY_TEXT_IL = "//h3[@class='dlTrialH3']"
  EXT_JS_TRY_30_DAY_TEXT_TA = "sencha:products_page:ext_js_try_30_day_text"


  def should_see_ext_js_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_JS_HEADER_TA, il: EXT_JS_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_js_full_trial_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_JS_HEADER_TEXT_TA, il: EXT_JS_HEADER_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_js_try_30_day_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_JS_TRY_30_DAY_TEXT_TA, il: EXT_JS_TRY_30_DAY_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
