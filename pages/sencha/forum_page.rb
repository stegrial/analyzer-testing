require_relative '../page_extension'

class ForumPage < PageExtension

  HEADER_PRODUCTS_LINK_IL = "(//a[text()='Products'])[1]"
  HEADER_PRODUCTS_LINK_TA = "sencha:forms_page:header_products_link"

  HEADER_SERVICES_LINK_IL = "(//a[text()='Services'])[1]"
  HEADER_SERVICES_LINK_TA = "sencha:forms_page:header_services_link"

  HEADER_PRICING_LINK_IL = "(//a[text()='Pricing'])[1]"
  HEADER_PRICING_LINK_TA = "sencha:forms_page:header_pricing_link"

  HEADER_DEVELOPERS_LINK_IL = "//a[text()='Developers']"
  HEADER_DEVELOPERS_LINK_TA = "sencha:forms_page:header_developers_link"

  HEADER_TRY_LINK_IL = "//a[text()='Try']"
  HEADER_TRY_LINK_TA = "sencha:forms_page:header_try_link"

  HEADER_BUY_LINK_IL = "//a[text()='Buy']"
  HEADER_BUY_LINK_TA = "sencha:forms_page:header_buy_link"

  SENCHA_SEARCH_FIELD_IL = "//input[@id='sencha-search-input']"
  SENCHA_SEARCH_FIELD_TA = "sencha:forms_page:sencha_search_field"

  USERNAME_FIELD_IL = "//input[@name='vb_login_username']"
  USERNAME_FIELD_TA = "sencha:forms_page:username_field"

  PASSWORD_TEXT_IL = "//input[@name='vb_login_password_hint']"
  PASSWORD_TEXT_TA = "sencha:forms_page:password_text"

  PASSWORD_FIELD_IL = "//input[@name='vb_login_password']"
  PASSWORD_FIELD_TA = "sencha:forms_page:password_field"

  REMEMBER_ME_IL = "//input[@name='cookieuser']"
  REMEMBER_ME_TA = "sencha:forms_page:remember_me"

  LOGIN_BUTTON_IL = "//input[@class='loginbutton']"
  LOGIN_BUTTON_TA = "sencha:forms_page:login_button"

  HERE_LINK_IL = "//a[text()='here']"
  HERE_LINK_TA = "sencha:forms_page:here_link"

  REGISTER_LINK_IL = "//a[text()='register']"
  REGISTER_LINK_TA = "sencha:forms_page:register_link"


  def should_see_header_products_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_PRODUCTS_LINK_TA, il: HEADER_PRODUCTS_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_header_services_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_SERVICES_LINK_TA, il: HEADER_SERVICES_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_header_pricing_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_PRICING_LINK_TA, il: HEADER_PRICING_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_header_developers_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_DEVELOPERS_LINK_TA, il: HEADER_DEVELOPERS_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_header_try_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_TRY_LINK_TA, il: HEADER_TRY_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_header_buy_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_BUY_LINK_TA, il: HEADER_BUY_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def fill_sencha_search_field(key = nil, text)
    find_element(key, il_type: :xpath, tl: SENCHA_SEARCH_FIELD_TA, il: SENCHA_SEARCH_FIELD_IL, check_path: $check_path).set(text)
  end

  def fill_username_field(key = nil, username)
    find_element(key, il_type: :xpath, tl: USERNAME_FIELD_TA, il: USERNAME_FIELD_IL, check_path: $check_path).set(username)
  end

  def click_password_text(key = nil)
    find_element(key, il_type: :xpath, tl: PASSWORD_TEXT_TA, il: PASSWORD_TEXT_IL, check_path: $check_path).click
  end

  def fill_password_field(key = nil, password)
    find_element(key, il_type: :xpath, tl: PASSWORD_FIELD_TA, il: PASSWORD_FIELD_IL, check_path: $check_path).set(password)
  end

  def click_remember_me(key = nil)
    find_element(key, il_type: :xpath, tl: REMEMBER_ME_TA, il: REMEMBER_ME_IL, check_path: $check_path).click
  end

  def click_login_button(key = nil)
    find_element(key, il_type: :xpath, tl: LOGIN_BUTTON_TA, il: LOGIN_BUTTON_IL, check_path: $check_path).click
  end

  def should_see_here_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: HERE_LINK_TA, il: HERE_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_register_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: REGISTER_LINK_TA, il: REGISTER_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
