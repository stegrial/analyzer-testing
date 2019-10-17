require 'spec_helper'

class VenusNavigation
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  ACCOUNT_BUTTON_IL = "(//button[@aria-label='Account'])[1]"
  ACCOUNT_BUTTON_TA = 'venus:navigation_page:account_button'
  ACCOUNT_BUTTON_EP = 'EP:venus:navigation_page:account_button'

  MAIL_OPTIONS_IL = "(//li[@role='menuitem' and ./a[text()='Mail Options']])[2]"
  MAIL_OPTIONS_TA = 'venus:navigation_page:account_menu:mail_options'
  MAIL_OPTIONS_EP = 'EP:venus:navigation_page:account_menu:mail_options'

  VENUS_LOGO_IL = "//a[./span[text()='Venus']]"
  VENUS_LOGO_TA = 'venus:navigation_page:logo'
  VENUS_LOGO_EP = 'EP:venus:navigation_page:logo'

  SALE_CAT_IL = "//button[contains(., 'Sale')]"
  SALE_CAT_TA = 'venus:navigation_page:sale_cat'
  SALE_CAT_EP = 'EP:venus:navigation_page:sale_cat'

  SEARCH_BUTTON_IL = "//button[@aria-label='Search']"
  SEARCH_BUTTON_TA = 'venus:navigation_page:search_button'
  SEARCH_BUTTON_EP = 'EP:venus:navigation_page:search_button'

  SEARCH_FIELD_IL = "//input[contains (@placeholder, 'Search')]"
  SEARCH_FIELD_TA = 'venus:navigation_page:search_field'
  SEARCH_FIELD_EP = 'EP:venus:navigation_page:search_field'

  FIND_BUTTON_IL = "//button[@variant='contained']"
  FIND_BUTTON_TA = 'venus:navigation_page:find_button'
  FIND_BUTTON_EP = 'EP:venus:navigation_page:find_button'

  CLOTHING_CAT_IL = "//button[contains(., 'Clothing')]"
  CLOTHING_CAT_TA = 'venus:navigation_page:clothing_cat'
  CLOTHING_CAT_EP = 'EP:venus:navigation_page:clothing_cat'

  CART_BUTTON_IL = "//div[contains(@id, 'cart')]"
  CART_BUTTON_TA = 'venus:navigation_page:cart_button'
  CART_BUTTON_EP = 'EP:venus:navigation_page:cart_button'


  def click_account_button(key = nil)
    return find(:xpath, ta(ACCOUNT_BUTTON_EP)).click if key == :ep
    return find(:xpath, ACCOUNT_BUTTON_IL).click if key == :il
    find(:xpath, ta(ACCOUNT_BUTTON_TA, ACCOUNT_BUTTON_IL)).click
  end

  def click_mail_options(key = nil)
    return find(:xpath, ta(MAIL_OPTIONS_EP)).click if key == :ep
    return find(:xpath, MAIL_OPTIONS_IL).click if key == :il
    find(:xpath, ta(MAIL_OPTIONS_TA, MAIL_OPTIONS_IL)).click
  end

  def click_venus_logo(key = nil)
    return find(:xpath, ta(VENUS_LOGO_EP)).click if key == :ep
    return find(:xpath, VENUS_LOGO_IL).click if key == :il
    find(:xpath, ta(VENUS_LOGO_TA, VENUS_LOGO_IL)).click
  end

  def click_sale_cat(key = nil)
    return find(ta(SALE_CAT_EP)).click if key == :ep
    return find(:xpath, SALE_CAT_IL).click if key == :il
    find(:xpath, ta(SALE_CAT_TA, SALE_CAT_IL)).click
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

  def click_clothing_cat(key = nil)
    return find(ta(CLOTHING_CAT_EP)).click if key == :ep
    return find(:xpath, CLOTHING_CAT_IL).click if key == :il
    find(:xpath, ta(CLOTHING_CAT_TA, CLOTHING_CAT_IL)).click
  end

  def find_items_on_cart(key = nil)
    return find(ta(CART_BUTTON_EP)) if key == :ep
    return find(:xpath, CART_BUTTON_IL) if key == :il
    find(:xpath, ta(CART_BUTTON_TA, CART_BUTTON_IL))
  end

  def click_items_on_cart(key = nil)
    return find(ta(CART_BUTTON_EP)).click if key == :ep
    return find(:xpath, CART_BUTTON_IL).click if key == :il
    find(:xpath, ta(CART_BUTTON_TA, CART_BUTTON_IL)).click
  end


end