require_relative '../page_extension'

class HeaderNavigation < PageExtension


  LOGIN_BTN_IL = "//div[./span[text()='Login']]"
  LOGIN_BTN_TA = 'ta:nav:login_btn'

  PRODUCT_DROPDOWN_IL = "//a[contains(@class, 'menu-item-link-top') and @href='https://trueautomation.io/product/']"
  PRODUCT_DROPDOWN_TA = "ta:nav:product_dropdown"

  HOW_IT_WORKS_IL = "//a[contains(@class, 'menu-item-link-sub') and @href='https://trueautomation.io/product/#howitworks']"
  HOW_IT_WORKS_TA = "ta:nav:how_it_works_link"

  CAPABILITY_IL = "//a[contains(@class, 'menu-item-link-sub') and @href='https://trueautomation.io/product/#supportedstuff']"
  CAPABILITY_TA = "ta:nav:capability"

  DOCUMENTATION_IL = "(//a[contains(@class, 'menu-item-link-top') and @href='https://trueautomation.io/docs/'])[1]"
  DOCUMENTATION_TA = "ta:nav:documentation_link"

  USE_CASES_DROPDOWN_IL = "//a[contains(@class, 'menu-item-link-top') and @href='https://trueautomation.io/use-cases/']"
  USE_CASES_DROPDOWN_TA = "ta:nav:uses_cases_dropdown"

  WRITE_TESTS_FASTER_IL = "//a[contains(@class, 'menu-item-link-sub') and @href='https://trueautomation.io/use-cases/#writetestsfaster']"
  WRITE_TESTS_FASTER_TA = "ta:nav:write_tests_faster_link"

  COVER_MORE_IL = "//a[contains(@class, 'menu-item-link-sub') and @href='https://trueautomation.io/use-cases/#toughtech']"
  COVER_MORE_TA = "ta:nav:cover_more_technologies"

  MAINTAIN_LESS_IL = "//a[contains(@class, 'menu-item-link-sub') and @href='https://trueautomation.io/use-cases/#maintenance']"
  MAINTAIN_LESS_TA = "ta:nav:maintain_less"

  HOME_BTN_IL = "(//a[contains(@class, 'menu-item-link-top') and @href='https://trueautomation.io/'])[1]"
  HOME_BTN_TA = "ta:nav:home_btn"

  HEADER_LOGO_IL = "(//a[contains(@class, 'jet-logo__link')])[1]"
  HEADER_LOGO_TA = "ta:nav:header_logo"


  def click_login_btn_on_nav_panel(key = nil)
    find_element(key, il_type: :xpath, tl: LOGIN_BTN_TA, il: LOGIN_BTN_IL, check_path: $check_path).click
  end

  def hover_product_dropdown(key = nil)
    find_element(key, il_type: :xpath, tl: PRODUCT_DROPDOWN_TA, il: PRODUCT_DROPDOWN_IL, check_path: $check_path).hover
  end

  def click_how_it_works_link(key = nil)
    find_element(key, il_type: :xpath, tl: HOW_IT_WORKS_TA, il: HOW_IT_WORKS_IL, check_path: $check_path).click
  end

  def click_capability_link(key = nil)
    find_element(key, il_type: :xpath, tl: CAPABILITY_TA, il: CAPABILITY_IL, check_path: $check_path).click
  end

  def click_documentation_link(key = nil)
    find_element(key, il_type: :xpath, tl: DOCUMENTATION_TA, il: DOCUMENTATION_IL, check_path: $check_path).click
  end

  def hover_use_cases_link(key = nil)
    find_element(key, il_type: :xpath, tl: USE_CASES_DROPDOWN_TA, il: USE_CASES_DROPDOWN_IL, check_path: $check_path).hover
  end

  def click_write_tests_faster(key = nil)
    find_element(key, il_type: :xpath, tl: WRITE_TESTS_FASTER_TA, il: WRITE_TESTS_FASTER_IL, check_path: $check_path).click
  end

  def click_cover_more_technologies(key = nil)
    find_element(key, il_type: :xpath, tl: COVER_MORE_TA, il: COVER_MORE_IL, check_path: $check_path).click
  end

  def click_maintain_less(key = nil)
    find_element(key, il_type: :xpath, tl: MAINTAIN_LESS_TA, il: MAINTAIN_LESS_IL, check_path: $check_path).click
  end

  def click_home_btn(key = nil)
    find_element(key, il_type: :xpath, tl: HOME_BTN_TA, il: HOME_BTN_IL, check_path: $check_path).click
  end

  def click_header_logo(key = nil)
    find_element(key, il_type: :xpath, tl: HEADER_LOGO_TA, il: HEADER_LOGO_IL, check_path: $check_path).click
  end

end