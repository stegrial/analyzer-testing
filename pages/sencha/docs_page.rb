require_relative '../page_extension'

class DocsPage < PageExtension

  HEADER_LIST_MENU_IL = "//span[contains(@class, 'header-product-title')]"
  HEADER_LIST_MENU_TA = "sencha:docs_page:header_list_menu"

  PRODUCT_EXT_JS_IL = "//div[@id='product-menu-extjs']"
  PRODUCT_EXT_JS_TA = "sencha:docs_page:product_ext_js"

  PRODUCT_EXT_ANGULAR_IL = "//div[@id='product-menu-extangular']"
  PRODUCT_EXT_ANGULAR_TA = "sencha:docs_page:product_ext_angular"

  PRODUCT_EXT_REACT_IL = "//div[@id='product-menu-extreact']"
  PRODUCT_EXT_REACT_TA = "sencha:docs_page:product_ext_react"

  PRODUCT_EXT_WEB_COMPONENT_IL = "//div[@id='product-menu-extwebcomponents']"
  PRODUCT_EXT_WEB_COMPONENT_TA = "sencha:docs_page:product_ext_web_component"

  DOCS_HELP_IL = "//span[@id='help-btn']"
  DOCS_HELP_TA = "sencha:docs_page:docs_help_btn"

  CONTENTS_MENU_IL = "//h2[text()='Contents']"
  CONTENTS_MENU_TA = "sencha:docs_page:contents_menu"

  TERMS_ICONS_LABELS_LINK_IL = "//a[text()='Terms, Icons, and Labels']"
  TERMS_ICONS_LABELS_LINK_TA = "sencha:docs_page:terms_icons_labels_link"

  ACCESS_LEVELS_LINK_IL = "//a[text()='Access Levels']"
  ACCESS_LEVELS_LINK_TA = "sencha:docs_page:access_levels_link"

  MEMBERS_TYPES_LINK_IL = "//a[text()='Member Types']"
  MEMBERS_TYPES_LINK_TA = "sencha:docs_page:members_types_link"

  MEMBERS_SYNTAX_LINK_IL = "//a[text()='Member Syntax']"
  MEMBERS_SYNTAX_LINK_TA = "sencha:docs_page:members_syntax_link"

  MEMBERS_FLAGS_LINK_IL = "//a[text()='Member Flags']"
  MEMBERS_FLAGS_LINK_TA = "sencha:docs_page:members_flag_link"

  CLASS_ICONS_LINK_IL = "//a[text()='Class Icons']"
  CLASS_ICONS_LINK_TA = "sencha:docs_page:class_icons_link"

  MEMBER_ICONS_LINK_IL = "//a[text()='Member Icons']"
  MEMBER_ICONS_LINK_TA = "sencha:docs_page:member_icons_link"

  CLOSE_DOCS_HELP_IL = "//div[@id='help-close']"
  CLOSE_DOCS_HELP_TA = "sencha:docs_page:close_docs_help_btn"

  HEADER_EXT_JS_IL = "//a[text()='Ext JS']"
  HEADER_EXT_JS_TA = "sencha:docs_page:header_ext_js"

  EXT_JS_GETTING_STARTED_IL = "//a[contains(@href, './extjs/7.2.0/guides/getting_started')]"
  EXT_JS_GETTING_STARTED_TA = "sencha:docs_page:ext_js_getting_started"

  EXT_JS_DOCUMENTATION_IL = "//a[@href='./extjs/7.2.0/']"
  EXT_JS_DOCUMENTATION_TA = "sencha:docs_page:ext_js_documentation"

  HEADER_EXT_ANGULAR_IL = "//a[text()='ExtAngular']"
  HEADER_EXT_ANGULAR_TA = "sencha:docs_page:header_ext_angular"

  EXT_ANGULAR_GETTING_STARTED_IL = "//a[contains(@href, './extangular/7.2.0/guides/getting_started')]"
  EXT_ANGULAR_GETTING_STARTED_TA = "sencha:docs_page:ext_angular_getting_started"

  EXT_ANGULAR_DOCUMENTATION_IL = "//a[@href='./extangular/7.2.0/']"
  EXT_ANGULAR_DOCUMENTATION_TA = "sencha:docs_page:ext_angular_documentation"


  def click_header_list_menu(key = nil)
    find_element(key, il_type: :xpath, tl: HEADER_LIST_MENU_TA, il: HEADER_LIST_MENU_IL, check_path: $check_path).click
  end

  def should_see_product_ext_js(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRODUCT_EXT_JS_TA, il: PRODUCT_EXT_JS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_product_ext_angular(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRODUCT_EXT_ANGULAR_TA, il: PRODUCT_EXT_ANGULAR_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_product_ext_react(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRODUCT_EXT_REACT_TA, il: PRODUCT_EXT_REACT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_product_ext_web_component(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRODUCT_EXT_WEB_COMPONENT_TA, il: PRODUCT_EXT_WEB_COMPONENT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_docs_help_btn(key = nil)
    find_element(key, il_type: :xpath, tl: DOCS_HELP_TA, il: DOCS_HELP_IL, check_path: $check_path).click
  end

  def should_see_contents_menu_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: CONTENTS_MENU_TA, il: CONTENTS_MENU_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_terms_icons_labels_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: TERMS_ICONS_LABELS_LINK_TA, il: TERMS_ICONS_LABELS_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_access_levels_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: ACCESS_LEVELS_LINK_TA, il: ACCESS_LEVELS_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_members_types_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: MEMBERS_TYPES_LINK_TA, il: MEMBERS_TYPES_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_members_syntax_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: MEMBERS_SYNTAX_LINK_TA, il: MEMBERS_SYNTAX_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_members_flag_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: MEMBERS_FLAGS_LINK_TA, il: MEMBERS_FLAGS_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_class_icons_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: CLASS_ICONS_LINK_TA, il: CLASS_ICONS_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_member_icons_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: MEMBER_ICONS_LINK_TA, il: MEMBER_ICONS_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_close_docs_help_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_DOCS_HELP_TA, il: CLOSE_DOCS_HELP_IL, check_path: $check_path).click
  end

  def should_see_header_ext_js(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_EXT_JS_TA, il: HEADER_EXT_JS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_js_getting_started(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_JS_GETTING_STARTED_TA, il: EXT_JS_GETTING_STARTED_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_js_documentation(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_JS_DOCUMENTATION_TA, il: EXT_JS_DOCUMENTATION_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_header_ext_angular(key = nil)
    element = find_element(key, il_type: :xpath, tl: HEADER_EXT_ANGULAR_TA, il: HEADER_EXT_ANGULAR_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_angular_getting_started(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_ANGULAR_GETTING_STARTED_TA, il: EXT_ANGULAR_GETTING_STARTED_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_angular_documentation(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_ANGULAR_DOCUMENTATION_TA, il: EXT_ANGULAR_DOCUMENTATION_IL, check_path: $check_path)
    expect(element).to be_visible
  end

end
