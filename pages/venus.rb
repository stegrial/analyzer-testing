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
  SEARCH_BUTTON_TA = 'venus:search_button'
  SEARCH_BUTTON_EP = 'EP:venus:search_button'

  SEARCH_FIELD_IL = "//input[contains (@placeholder, 'Search')]"
  SEARCH_FIELD_TA = 'venus:search_page:search_field'
  SEARCH_FIELD_EP = 'EP:venus:search_page:search_field'

  FIND_BUTTON_IL = "//button[@variant='contained']"
  FIND_BUTTON_TA = 'venus:search_page:find_button'
  FIND_BUTTON_EP = 'EP:venus:search_page:find_button'

  VIEW_DETAIL_SECOND_IL = "(//span[text()='view detail'])[2]"
  VIEW_DETAIL_SECOND_TA = 'venus:search_results:view_detail_second'
  VIEW_DETAIL_SECOND_EP = 'EP:venus:search_results:view_detail_second'

  CLOTHING_CAT_IL = "//button[contains(., 'Clothing')]"
  CLOTHING_CAT_TA = 'venus:clothing_cat'
  CLOTHING_CAT_EP = 'EP:venus:clothing_cat'

  CAT_DROPDOWN_IL = "//div[@data-page='Category']//div[@id='select-subcategories']"
  CAT_DROPDOWN_TA = 'venus:cat_dropdown'
  CAT_DROPDOWN_EP = 'EP:venus:cat_dropdown'

  SUBCAT_DROPDOWN_IL = "//div[@data-page='Subcategory']//div[@id='select-subcategories']"
  SUBCAT_DROPDOWN_TA = 'venus:subcat_dropdown'
  SUBCAT_DROPDOWN_EP = 'EP:venus:subcat_dropdown'

  CLOTHING_CAT_DROPDOWN_IL = "//li[text()='Clothing']"
  CLOTHING_CAT_DROPDOWN_TA = 'venus:subcat_dropdown:clothing_cat'
  CLOTHING_CAT_DROPDOWN_EP = 'EP:venus:subcat_dropdown:clothing_cat'

  SIZE_FILTER_IL = "//button[.//span[text()='Filter']]"
  SIZE_FILTER_TA = 'venus:subcat:size_filter'
  SIZE_FILTER_EP = 'EP:venus:subcat:size_filter'

  def filter_size(locator, size)
    case locator
      when :il then "//label[.//span[text()='#{size}']]"
      when :ta then "venus:filter_size:#{size.tr('^A-Za-z0-9_', '')}"
      when :ep then "EP:venus:filter_size:#{size.tr('^A-Za-z0-9_', '')}"
      else p 'Locator type is not set'
    end
  end

  def list_size(locator, size)
    case locator
      when :il then "(//button[./span[text()='#{size}']])[1]"
      when :ta then "venus:list_size:#{size.tr('^A-Za-z0-9_', '')}"
      when :ep then "EP:venus:list_size:#{size.tr('^A-Za-z0-9_', '')}"
      else p 'Locator type is not set'
    end
  end

  VIEW_RESULTS_BTN_IL = "//button[contains(., 'View Results')]"
  VIEW_RESULTS_BTN_TA = 'venus:size_filter:view_results_btn'
  VIEW_RESULTS_BTN_EP = 'EP:venus:size_filter:view_results_btn'

  FIRST_NAME_FIELD_IL = 'ctl00_Body1_firstname'
  FIRST_NAME_FIELD_TA = 'venus:first_name_field'
  FIRST_NAME_FIELD_EP = 'EP:venus:first_name_field'

  LAST_NAME_FIELD_IL = 'ctl00_Body1_lastname'
  LAST_NAME_FIELD_TA = 'venus:last_name_field'
  LAST_NAME_FIELD_EP = 'EP:venus:last_name_field'

  CREATE_ACCOUNT_BTN_IL = "//a[text()='Create Account']"
  CREATE_ACCOUNT_BTN_TA = 'venus:create_account_btn'
  CREATE_ACCOUNT_BTN_EP = 'EP:venus:create_account_btn'

  SALE_CAT_IL = "//button[contains(., 'Sale')]"
  SALE_CAT_TA = 'venus:sale_cat'
  SALE_CAT_EP = 'EP:venus:sale_cat'

  def product_name(locator, name)
    case locator
      when :il then "//a[.//h2[text()='#{name}']]"
      when :ta then "venus:product_list:#{name.tr('^A-Za-z0-9_', '')}"
      when :ep then "EP:venus:product_list:#{name.tr('^A-Za-z0-9_', '')}"
      else p 'Locator type is not set'
    end
  end

  def subcat_name(locator, name)
    case locator
      when :il then "(//li[text()='#{name[1]}'])[1]"
      when :ta then "venus:cat_dropdown:#{name[0].tr('^A-Za-z0-9_', '')}#{name[1].tr('^A-Za-z0-9_', '')}"
      when :ep then "EP:venus:cat_dropdown:#{name[0].tr('^A-Za-z0-9_', '')}#{name[1].tr('^A-Za-z0-9_', '')}"
      else p 'Locator type is not set'
    end
  end

  QTY_DROPDOWN_IL = "//div[./div[text()='Qty:']]//div[@role='button']"
  QTY_DROPDOWN_TA = 'venus:product:qty_dropdown'
  QTY_DROPDOWN_EP = 'EP:venus:product:qty_dropdown'

  def quantity(locator, qty)
    case locator
      when :il then "//ul[@role='listbox']/li[text()='#{qty}']"
      when :ta then "venus:product:qty_dropdown:quantity_#{qty.tr('^A-Za-z0-9_', '')}"
      when :ep then "EP:venus:product:qty_dropdown:quantity_#{qty.tr('^A-Za-z0-9_', '')}"
      else p 'Locator type is not set'
    end
  end

  WISH_LIST_BTN_IL = "//button[./span[text()='+ wish list']]"
  WISH_LIST_BTN_TA = 'venus:product:wish_list_btn'
  WISH_LIST_BTN_EP = 'EP:venus:product:wish_list_btn'

  PRODUCT_SIZE_IL = "//span[contains(@id,'ProductSize')]"
  PRODUCT_SIZE_TA = "venus:product:product_size"
  PRODUCT_SIZE_EP = "EP:venus:product:product_size"

  REMOVE_WISH_LIST_BTN_IL = "//a[text()='Remove']"
  REMOVE_WISH_LIST_BTN_TA = "venus:product:remove_wish_list_btn"
  REMOVE_WISH_LIST_BTN_EP = "EP:venus:product:remove_wish_list_btn"

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

  def click_clothing_cat(key = nil)
    return find(ta(CLOTHING_CAT_EP)).click if key == :ep
    return find(:xpath, CLOTHING_CAT_IL).click if key == :il
    find(:xpath, ta(CLOTHING_CAT_TA, CLOTHING_CAT_IL)).click
  end

  def open_cat_dropdown(key = nil)
    return find(ta(CAT_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, CAT_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(CAT_DROPDOWN_TA, CAT_DROPDOWN_IL)).click
  end

  def choose_subcat_by_first_name(key = nil, name)
    return find(ta(subcat_name(:ep, name))).click if key == :ep
    return find(:xpath, subcat_name(:il, name)).click if key == :il
    find(:xpath, ta(subcat_name(:ta, name), subcat_name(:il, name))).click
  end

  def open_subcat_dropdown(key = nil)
    return find(ta(SUBCAT_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, SUBCAT_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(SUBCAT_DROPDOWN_TA, SUBCAT_DROPDOWN_IL)).click
  end

  def choose_clothing_cat(key = nil)
    return find(ta(CLOTHING_CAT_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, CLOTHING_CAT_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(CLOTHING_CAT_DROPDOWN_TA, CLOTHING_CAT_DROPDOWN_IL)).click
  end

  def open_size_filter(key = nil)
    return find(ta(SIZE_FILTER_EP)).click if key == :ep
    return find(:xpath, SIZE_FILTER_IL).click if key == :il
    find(:xpath, ta(SIZE_FILTER_TA, SIZE_FILTER_IL)).click
  end

  def choose_filter_size(key = nil, size)
    return find(ta(filter_size(:ep, size))).click if key == :ep
    return find(:xpath, filter_size(:il, size)).click if key == :il
    find(:xpath, ta(filter_size(:ta, size), filter_size(:il, size))).click
  end

  def click_view_results_btn(key = nil)
    return find(ta(VIEW_RESULTS_BTN_EP)).click if key == :ep
    return find(:xpath, VIEW_RESULTS_BTN_IL).click if key == :il
    find(:xpath, ta(VIEW_RESULTS_BTN_TA, VIEW_RESULTS_BTN_IL)).click
  end

  def fill_first_name_field(key = nil, first_name)
    return find(:id, ta(FIRST_NAME_FIELD_EP)).set(first_name) if key == :ep
    return find(:id, FIRST_NAME_FIELD_IL).set(first_name) if key == :il
    find(:id, ta(FIRST_NAME_FIELD_TA, FIRST_NAME_FIELD_IL)).set(first_name)
  end

  def fill_last_name_field(key = nil, last_name)
    return find(:id, ta(LAST_NAME_FIELD_EP)).set(last_name) if key == :ep
    return find(:id, LAST_NAME_FIELD_IL).set(last_name) if key == :il
    find(:id, ta(LAST_NAME_FIELD_TA, LAST_NAME_FIELD_IL)).set(last_name)
  end

  def click_create_account_btn(key = nil)
    return find(ta(CREATE_ACCOUNT_BTN_EP)).click if key == :ep
    return find(:xpath, CREATE_ACCOUNT_BTN_IL).click if key == :il
    find(:xpath, ta(CREATE_ACCOUNT_BTN_TA, CREATE_ACCOUNT_BTN_IL)).click
  end

  def click_sale_cat(key = nil)
    return find(ta(SALE_CAT_EP)).click if key == :ep
    return find(:xpath, SALE_CAT_IL).click if key == :il
    find(:xpath, ta(SALE_CAT_TA, SALE_CAT_IL)).click
  end

  def choose_product_by_name(key = nil, name)
    return find(ta(product_name(:ep, name))).click if key == :ep
    return find(:xpath, product_name(:il, name)).click if key == :il
    find(:xpath, ta(product_name(:ta, name), product_name(:il, name))).click
  end

  def choose_list_size(key = nil, size)
    return find(ta(list_size(:ep, size))).click if key == :ep
    return find(:xpath, list_size(:il, size)).click if key == :il
    find(:xpath, ta(list_size(:ta, size), list_size(:il, size))).click
  end

  def open_qty_dropdown(key = nil)
    return find(ta(QTY_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, QTY_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(QTY_DROPDOWN_TA, QTY_DROPDOWN_IL)).click
  end

  def select_quantity(key = nil, qty)
    return find(ta(quantity(:ep, qty))).click if key == :ep
    return find(:xpath, quantity(:il, qty)).click if key == :il
    find(:xpath, ta(quantity(:ta, qty), quantity(:il, qty))).click
  end

  def click_wish_list_button(key = nil)
    return find(ta(WISH_LIST_BTN_EP)).click if key == :ep
    return find(:xpath, WISH_LIST_BTN_IL).click if key == :il
    find(:xpath, ta(WISH_LIST_BTN_TA, WISH_LIST_BTN_IL)).click
  end

  def observe_product_size(key = nil)
    return find(ta(PRODUCT_SIZE_EP)) if key == :ep
    return find(:xpath, PRODUCT_SIZE_IL) if key == :il
    find(:xpath, ta(PRODUCT_SIZE_TA, PRODUCT_SIZE_IL))
  end

  def click_remove_wish_list(key = nil)
    return find(ta(REMOVE_WISH_LIST_BTN_EP)).click if key == :ep
    return find(:xpath, REMOVE_WISH_LIST_BTN_IL).click if key == :il
    find(:xpath, ta(REMOVE_WISH_LIST_BTN_TA, REMOVE_WISH_LIST_BTN_IL)).click
  end


end