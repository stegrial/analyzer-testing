require 'spec_helper'

class Venus
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  ACCOUNT_BUTTON_IL = "(//button[@aria-label='Account'])[1]"
  ACCOUNT_BUTTON_TA = 'venus:account_button'
  ACCOUNT_BUTTON_EP = 'EP:venus:account_button'

  EMAIL_FIELD_IL = 'ctl00_Body1_loginemail'
  EMAIL_FIELD_TA = 'venus:email_field'
  EMAIL_FIELD_EP = 'EP:venus:email_field'

  PASS_FIELD_IL = 'ctl00_Body1_loginpassword'
  PASS_FIELD_TA = 'venus:pass_field'
  PASS_FIELD_EP = 'EP:venus:pass_field'

  SIGN_IN_BTN_IL = 'ctl00_Body1_loginbutton'
  SIGN_IN_BTN_TA = 'venus:sign_in_btn'
  SIGN_IN_BTN_EP = 'EP:venus:sign_in_btn'

  MAIL_OPTIONS_IL = "(//li[@role='menuitem' and ./a[text()='Mail Options']])[2]"
  MAIL_OPTIONS_TA = 'venus:account_menu:mail_options'
  MAIL_OPTIONS_EP = 'EP:venus:account_menu:mail_options'

  THIRD_BANNER_IL = "(//a[@title='Shop Now'])[3]"
  THIRD_BANNER_TA = 'venus:main:third_banner'
  THIRD_BANNER_EP = 'EP:venus:main:third_banner'

  VENUS_LOGO_IL = "//a[./span[text()='Venus']]"
  VENUS_LOGO_TA = 'venus:logo'
  VENUS_LOGO_EP = 'EP:venus:logo'

  SEARCH_BUTTON_IL = "//button[@aria-label='Search']"
  SEARCH_BUTTON_TA = 'venus:main:search_button'
  SEARCH_BUTTON_EP = 'EP:venus:main:search_button'

  SEARCH_FIELD_IL = "//input[contains (@placeholder, 'Search')]"
  SEARCH_FIELD_TA = 'venus:search_page:search_field'
  SEARCH_FIELD_EP = 'EP:venus:search_page:search_field'

  FIND_BUTTON_IL = "//button[@variant='contained']"
  FIND_BUTTON_TA = 'venus:search_page:find_button'
  FIND_BUTTON_EP = 'EP:venus:search_page:find_button'

  VIEW_DETAIL_SECOND_IL = "(//span[text()='view detail'])[2]"
  VIEW_DETAIL_SECOND_TA = 'venus:search_results:view_detail_second'
  VIEW_DETAIL_SECOND_EP = 'EP:venus:search_results:view_detail_second'

  CLOTHING_CATEGORY_IL = "//button[contains(., 'Clothing')]"
  CLOTHING_CATEGORY_TA = 'venus:main:clothing_category'
  CLOTHING_CATEGORY_EP = 'EP:venus:main:clothing_category'

  CATEGORY_DROPDOWN_IL = "//div[@data-page='Category']//div[@id='select-subcategories']"
  CATEGORY_DROPDOWN_TA = 'venus:category:category_dropdown'
  CATEGORY_DROPDOWN_EP = 'EP:venus:category:category_dropdown'

  TOPS_SUBCATEGORY_IL = "//li[text()='Tops']"
  TOPS_SUBCATEGORY_TA = 'venus:category_dropdown:tops_subcategory'
  TOPS_SUBCATEGORY_EP = 'EP:venus:category_dropdown:tops_subcategory'

  SUBCATEGORY_DROPDOWN_IL = "//div[@data-page='Subcategory']//div[@id='select-subcategories']"
  SUBCATEGORY_DROPDOWN_TA = 'venus:subcategory:subcategory_dropdown'
  SUBCATEGORY_DROPDOWN_EP = 'EP:venus:subcategory:subcategory_dropdown'

  CLOTHING_CATEGORY_DROPDOWN_IL = "//li[text()='Clothing']"
  CLOTHING_CATEGORY_DROPDOWN_TA = 'venus:subcategory_dropdown:clothing_category'
  CLOTHING_CATEGORY_DROPDOWN_EP = 'EP:venus:subcategory_dropdown:clothing_category'

  SIZE_FILTER_IL = "//button[.//span[text()='Filter']]"
  SIZE_FILTER_TA = 'venus:subcategory:size_filter'
  SIZE_FILTER_EP = 'EP:venus:subcategory:size_filter'

  def size(locator, size)
    return @size_il = "//label[.//span[text()='#{size}']]" if locator == :il
    return @size_ta = "venus:size_filter:'#{size}'" if locator == :ta
    @size_ep = "EP:venus:size_filter:'#{size}'" if locator == :ep
  end

  VIEW_RESULTS_BTN_IL = "//button[contains(., 'View Results')]"
  VIEW_RESULTS_BTN_TA = 'venus:size_filter:view_results_btn'
  VIEW_RESULTS_BTN_EP = 'EP:venus:size_filter:view_results_btn'

  def click_account_button(key = nil)
    return find(:xpath, ta(ACCOUNT_BUTTON_EP)).click if key == :ep
    return find(:xpath, ACCOUNT_BUTTON_IL).click if key == :il
    find(:xpath, ta(ACCOUNT_BUTTON_TA, ACCOUNT_BUTTON_IL)).click
  end

  def fill_email_field(key = nil, email)
    return find(:id, ta(EMAIL_FIELD_EP)).set(email) if key == :ep
    return find(:id, EMAIL_FIELD_IL).set(email) if key == :il
    find(:id, ta(EMAIL_FIELD_TA, EMAIL_FIELD_IL)).set(email)
  end

  def fill_pass_field(key = nil, pass)
    return find(:id, ta(PASS_FIELD_EP)).set(pass) if key == :ep
    return find(:id, PASS_FIELD_IL).set(pass) if key == :il
    find(:id, ta(PASS_FIELD_TA, PASS_FIELD_IL)).set(pass)
  end

  def click_sign_in_button(key = nil)
    return find(:id, ta(SIGN_IN_BTN_EP)).click if key == :ep
    return find(:id, SIGN_IN_BTN_IL).click if key == :il
    find(:id, ta(SIGN_IN_BTN_TA, SIGN_IN_BTN_IL)).click
  end

  def click_mail_options(key = nil)
    return find(:xpath, ta(MAIL_OPTIONS_EP)).click if key == :ep
    return find(:xpath, MAIL_OPTIONS_IL).click if key == :il
    find(:xpath, ta(MAIL_OPTIONS_TA, MAIL_OPTIONS_IL)).click
  end

  def click_third_banner(key = nil)
    return find(:xpath, ta(THIRD_BANNER_EP)).click if key == :ep
    return find(:xpath, THIRD_BANNER_IL).click if key == :il
    find(:xpath, ta(THIRD_BANNER_TA, THIRD_BANNER_IL)).click
  end

  def click_venus_logo(key = nil)
    return find(:xpath, ta(VENUS_LOGO_EP)).click if key == :ep
    return find(:xpath, VENUS_LOGO_IL).click if key == :il
    find(:xpath, ta(VENUS_LOGO_TA, VENUS_LOGO_IL)).click
  end

  def click_search_button(key = nil)
    return find(:xpath, ta(SEARCH_BUTTON_EP)).click if key == :ep
    return find(:xpath, SEARCH_BUTTON_IL).click if key == :il
    find(:xpath, ta(SEARCH_BUTTON_TA, SEARCH_BUTTON_IL)).click
  end

  def enter_search_value(key = nil, value)
    return find(:xpath, ta(SEARCH_FIELD_EP)).set(value) if key == :ep
    return find(:xpath, SEARCH_FIELD_IL).set(value) if key == :il
    find(:xpath, ta(SEARCH_FIELD_TA, SEARCH_FIELD_IL)).set(value)
  end

  def click_find_button(key = nil)
    return find(:xpath, ta(FIND_BUTTON_EP)).click if key == :ep
    return find(:xpath, FIND_BUTTON_IL).click if key == :il
    find(:xpath, ta(FIND_BUTTON_TA, FIND_BUTTON_IL)).click
  end

  def click_view_detail_second(key = nil)
    return find(:xpath, ta(VIEW_DETAIL_SECOND_EP)).click if key == :ep
    return find(:xpath, VIEW_DETAIL_SECOND_IL).click if key == :il
    find(:xpath, ta(VIEW_DETAIL_SECOND_TA, VIEW_DETAIL_SECOND_IL)).click
  end

  def click_clothing_category(key = nil)
    return find(ta(CLOTHING_CATEGORY_EP)).click if key == :ep
    return find(:xpath, CLOTHING_CATEGORY_IL).click if key == :il
    find(:xpath, ta(CLOTHING_CATEGORY_TA, CLOTHING_CATEGORY_IL)).click
  end

  def open_category_dropdown(key = nil)
    return find(ta(CATEGORY_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, CATEGORY_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(CATEGORY_DROPDOWN_TA, CATEGORY_DROPDOWN_IL)).click
  end

  def choose_tops_subcategory(key = nil)
    return find(ta(TOPS_SUBCATEGORY_EP)).click if key == :ep
    return find(:xpath, TOPS_SUBCATEGORY_IL).click if key == :il
    find(:xpath, ta(TOPS_SUBCATEGORY_TA, TOPS_SUBCATEGORY_IL)).click
  end

  def open_subcategory_dropdown(key = nil)
    return find(ta(SUBCATEGORY_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, SUBCATEGORY_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(SUBCATEGORY_DROPDOWN_TA, SUBCATEGORY_DROPDOWN_IL)).click
  end

  def choose_clothing_category(key = nil)
    return find(ta(CLOTHING_CATEGORY_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, CLOTHING_CATEGORY_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(CLOTHING_CATEGORY_DROPDOWN_TA, CLOTHING_CATEGORY_DROPDOWN_IL)).click
  end

  def open_size_filter(key = nil)
    return find(ta(SIZE_FILTER_EP)).click if key == :ep
    return find(:xpath, SIZE_FILTER_IL).click if key == :il
    find(:xpath, ta(SIZE_FILTER_TA, SIZE_FILTER_IL)).click
  end

  def choose_size(key = nil, size)
    return find(ta(size(:ep, size))).click if key == :ep
    return find(:xpath, size(:il, size)).click if key == :il
    find(:xpath, ta(size(:ep, size), size(:ep, size))).click
  end

  def click_view_results_btn(key = nil)
    return find(ta(VIEW_RESULTS_BTN_EP)).click if key == :ep
    return find(:xpath, VIEW_RESULTS_BTN_IL).click if key == :il
    find(:xpath, ta(VIEW_RESULTS_BTN_TA, VIEW_RESULTS_BTN_IL)).click
  end


end