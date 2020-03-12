require 'spec_helper'
require_relative 'page_extension'

class Revolve
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension


  NEW_NAVMENU_IL = "//a[text()='New']"
  NEW_NAVMENU_TA = "revolve:new_navmenu"
  NEW_NAVMENU_EP = "EP:revolve:new_navmenu"

  FILTER_BTN_IL = "//button[.//span[text()='Filter']]"
  FILTER_BTN_TA = "revolve:filter_btn"
  FILTER_BTN_EP = "EP:revolve:filter_btn"

  PRICE_IL = "(//h6[contains(., 'Price')])[2]"
  PRICE_TA = "revolve:prise"
  PRICE_EP = "EP:revolve:prise"

  CHECKBOX_FOR_PRICE_IL = "(//div[@class='ReactVirtualized__Grid__innerScrollContainer'])[6]/label[1]"
  CHECKBOX_FOR_PRICE_TA = "revolve:checkbox_in_price"
  CHECKBOX_FOR_PRICE_EP = "EP:revolve:checkbox_in_price"

  VIEW_RESULTS_BTN_IL = "(//button/span[text()='View Results'])[2]"
  VIEW_RESULTS_BTN_TA = "revolve:view_results_btn"
  VIEW_RESULTS_BTN_EP = "EP:revolve:view_results_btn"

  CATEGORIES_NAVMENU_IL = "//span[text()='Categories']"
  CATEGORIES_NAVMENU_TA = "revolve:categories_navmenu"
  CATEGORIES_NAVMENU_EP = "EP:revolve:categories_navmenu"

  DRESSES_CATEGORY_IL = "//a[contains(., 'Dresses')]"
  DRESSES_CATEGORY_TA = "revolve:dresses_categories"
  DRESSES_CATEGORY_EP = "EP:revolve:dresses_categories"

  PRODUCT_ITEM_IL = "//ul/li[4]/div"
  PRODUCT_ITEM_TA = "revolve:product_item4"
  PRODUCT_ITEM_EP = "EP:revolve:product_item4"
  #
  HAMBURGER_MENU_IL = "//button[@aria-label='Menu']"
  HAMBURGER_MENU_TA = "revolve:hamburger_menu"
  HAMBURGER_MENU_EP = "EP:revolve:hamburger_menu"

  ACCOUNT_BUTTON_IL = "(//*[contains(text(), 'Hey, ')])[1]"
  ACCOUNT_BUTTON_TA = "revolve:account_button"
  ACCOUNT_BUTTON_EP = "EP:revolve:account_button"

  EMAIL_FIELD_IL = "input#loginEmail"
  EMAIL_FIELD_TA = "revolve:email_field"
  EMAIL_FIELD_EP = "EP:revolve:email_field"

  PASS_FIELD_IL = "input#loginPassword"
  PASS_FIELD_TA = "revolve:pass_field"
  PASS_FIELD_EP = "EP:revolve:pass_field"

  SIGN_IN_BTN_IL = "(//a[text()='Sign in'])[1]"
  SIGN_IN_BTN_TA = "revolve:sign_in_btn"
  SIGN_IN_BTN_EP = "EP:revolve:sign_in_btn"

  HOT_LIST_BANNER_IL = "(//a[text()='View the Hot List'])[1]"
  HOT_LIST_BANNER_TA = "revolve:main:hot_list"
  HOT_LIST_BANNER_EP = "EP:revolve:main:hot_list"

  REVOLVE_LOGO_IL = "//a[./span[text()='Revolve, Apparel & Fashion']]"
  REVOLVE_LOGO_TA = "revolve:logo"
  REVOLVE_LOGO_EP = "EP:revolve:logo"

  SIZE_BUTTON_XS_IL = "//button[@aria-label='XS']"
  SIZE_BUTTON_XS_TA = "revolve:xs_size"
  SIZE_BUTTON_XS_EP = "EP:revolve:xs_size"

  SIZE_BUTTON_S_IL = "//button[@aria-label='S']"
  SIZE_BUTTON_S_TA = "revolve:s_size"
  SIZE_BUTTON_S_EP = "EP:revolve:s_size"

  BUY_BTN_IL = "//button//span[text()='Buy Now']"
  BUY_BTN_TA = "revolve:buy_btn"
  BUY_BTN_EP = "EP:revolve:buy_btn"

  PRODUCT_IMG_IL = "(//img[@alt='product'])[2]"
  PRODUCT_IMG_TA = "revolve:jewelry_product_img"
  PRODUCT_IMG_EP = "EP:revolve:jewelry_product_img"

  ADD_TO_BAG_IL = "(//button/span[text()='Add to Bag'])[1]"
  ADD_TO_BAG_TA = "revolve:add_to_bag"
  ADD_TO_BAG_EP = "EP:revolve:add_to_bag"

  VIEW_BAG_IL = "//button[@data-th='view-cart']"
  VIEW_BAG_TA = "revolve:view_cart_bag"
  VIEW_BAG_EP = "EP:revolve:view_cart_bag"

  CHECKOUT_BTN_IL = "(//a[text()='Proceed to checkout'])[1]"
  CHECKOUT_BTN_TA = "revolve:checkout_page"
  CHECKOUT_BTN_EP = "EP:revolve:checkout_page"

  CHECKOUT_BTN2_IL =  "(//a[text()='Proceed To Checkout'])[1]"
  CHECKOUT_BTN2_TA =  "revolve:checkout_page2"
  CHECKOUT_BTN2_EP =  "EP:revolve:checkout_page2"

  COUNTRY_IL = "select#shipping_country"
  COUNTRY_TA = "revolve:country"
  COUNTRY_EP = "EP:revolve:country"

  FULL_NAME_IL = "input#shipping_name"
  FULL_NAME_TA = "revolve:full_name"
  FULL_NAME_EP = "EP:revolve:full_name"

  ADDRESS_IL = "input#shipping_street"
  ADDRESS_TA = "revolve:address"
  ADDRESS_EP = "EP:revolve:address"

  DEEP_ADDRESS_IL = "input#shipping_street2"
  DEEP_ADDRESS_TA = "revolve:address2"
  DEEP_ADDRESS_EP = "EP:revolve:address2"

  ZIP_CODE_IL = "input#shipping_zip_code"
  ZIP_CODE_TA = "revolve:zip_code"
  ZIP_CODE_EP = "EP:revolve:zip_code"

  PHONE_IL = "input#shipping_telephone"
  PHONE_TA = "revolve:telephone"
  PHONE_EP = "EP:revolve:telephone"

  SAVE_CONTINUE_BTN_IL = "//input[@onclick='saveAddress()']"
  SAVE_CONTINUE_BTN_TA = "revolve:save_continue_btn"
  SAVE_CONTINUE_BTN_EP = "EP:revolve:save_continue_btn"

  CONFIRM_CHECKOUT_IL = "a#confirmAddressNoSuggestions"
  CONFIRM_CHECKOUT_TA = "revolve:confirm_checkout"
  CONFIRM_CHECKOUT_EP = "EP:revolve:confirm_checkout"

  ORDER_EMAIL_IL = "input#order_email"
  ORDER_EMAIL_TA = "revolve:order_email"
  ORDER_EMAIL_EP = "EP:revolve:order_email"

  SORT_BTN_IL = "//button[contains(., 'Sort By')]"
  SORT_BTN_TA = "revolve:sort_by_btn"
  SORT_BTN_EP = "EP:revolve:sort_by_btn"

  SORT_BY_PRICE_IL = "//button[contains(., 'Price: Low to High')]"
  SORT_BY_PRICE_TA = "revolve:sort_by_price"
  SORT_BY_PRICE_EP = "EP:revolve:sort_by_price"

  SEARCH_BTN_IL = "//button[@aria-label='Search']"
  SEARCH_BTN_TA = "revolve:search_btn"
  SEARCH_BTN_EP = "EP:revolve:search_btn"

  DATA_INPUT_IL = "//input[@placeholder='Search...']"
  DATA_INPUT_TA = "revolve:data"
  DATA_INPUT_EP = "EP:revolve:data"

  SEARCH_RESULT_IL = "(//mark[@class='highlight'])[2]"
  SEARCH_RESULT_TA = "revolve:search_result"
  SEARCH_RESULT_EP = "EP:revolve:search_result"

  LANGUAGE_DROPDOWN_IL = "//div[text()='English']"
  LANGUAGE_DROPDOWN_TA = "revolve:language"
  LANGUAGE_DROPDOWN_EP = "EP:revolve:language"

  ITALIANO_LG_IL = "//li[@data-value='it']"
  ITALIANO_LG_TA = "revolve:italiano"
  ITALIANO_LG_EP = "EP:revolve:italiano"


  def click_new_in_top_navmenu(key = nil)
    post_processing key do
      return find(ta(NEW_NAVMENU_EP)).click if key == :ep
      return find(:xpath, NEW_NAVMENU_IL).click if key == :il
      find(:xpath, ta(NEW_NAVMENU_TA, NEW_NAVMENU_IL)).click
    end
  end

  def click_filter_btn(key = nil)
    post_processing key do
      return find(ta(FILTER_BTN_EP)).click if key == :ep
      return find(:xpath, FILTER_BTN_IL).click if key == :il
      find(:xpath, ta(FILTER_BTN_TA, FILTER_BTN_IL)).click
    end
  end

  def click_to_expand_price_list(key = nil)
    post_processing key do
      return find(ta(PRICE_EP)).click if key == :ep
      return find(:xpath, PRICE_IL).click if key == :il
      find(:xpath, ta(PRICE_TA, PRICE_IL)).click
    end
  end

  def checkbox_for_price(key = nil)
    post_processing key do
      return find(ta(CHECKBOX_FOR_PRICE_EP)).click if key == :ep
      return find(:xpath, CHECKBOX_FOR_PRICE_IL).click if key == :il
      find(:xpath, ta(CHECKBOX_FOR_PRICE_TA, CHECKBOX_FOR_PRICE_IL)).click
    end
  end

  def click_view_results_btn(key = nil)
    post_processing key do
      return find(ta(VIEW_RESULTS_BTN_EP)).click if key == :ep
      return find(:xpath, VIEW_RESULTS_BTN_IL).click if key == :il
      find(:xpath, ta(VIEW_RESULTS_BTN_TA, VIEW_RESULTS_BTN_IL)).click
    end
  end

  def click_categories_in_top_navmenu(key = nil)
    post_processing key do
      return find(ta(CATEGORIES_NAVMENU_EP)).click if key == :ep
      return find(:xpath, CATEGORIES_NAVMENU_IL).click if key == :il
      find(:xpath, ta(CATEGORIES_NAVMENU_TA, CATEGORIES_NAVMENU_IL)).click
    end
  end

  def click_dresses_categories(key = nil)
    post_processing key do
      return find(ta(DRESSES_CATEGORY_EP)).click if key == :ep
      return find(:xpath, DRESSES_CATEGORY_IL).click if key == :il
      find(:xpath, ta(DRESSES_CATEGORY_TA, DRESSES_CATEGORY_IL)).click
    end
  end

  def click_product_item4(key = nil)
    post_processing key do
      return find(ta(PRODUCT_ITEM_EP)).click if key == :ep
      return find(:xpath, PRODUCT_ITEM_IL).click if key == :il
      find(:xpath, ta(PRODUCT_ITEM_TA, PRODUCT_ITEM_IL)).click
    end
  end

  def click_account_button(key = nil)
    post_processing key do
      return find(:xpath, ta(ACCOUNT_BUTTON_EP)).click if key == :ep
      return find(:xpath, ACCOUNT_BUTTON_IL).click if key == :il
      find(:xpath, ta(ACCOUNT_BUTTON_TA, ACCOUNT_BUTTON_IL)).click
    end
  end

  def fill_email_field(key = nil, email)
    post_processing key do
      return find(:css, ta(EMAIL_FIELD_EP)).set(email) if key == :ep
      return find(:css, EMAIL_FIELD_IL).set(email) if key == :il
      find(:css, ta(EMAIL_FIELD_TA, EMAIL_FIELD_IL)).set(email)
    end
  end

  def fill_pass_field(key = nil, pass)
    post_processing key do
      return find(:css, ta(PASS_FIELD_EP)).set(pass) if key == :ep
      return find(:css, PASS_FIELD_IL).set(pass) if key == :il
      find(:css, ta(PASS_FIELD_TA, PASS_FIELD_IL)).set(pass)
    end
  end

  def click_sign_in_button(key = nil)
    post_processing key do
      return find(:xpath, ta(SIGN_IN_BTN_EP)).click if key == :ep
      return find(:xpath, SIGN_IN_BTN_IL).click if key == :il
      find(:xpath, ta(SIGN_IN_BTN_TA, SIGN_IN_BTN_IL)).click
    end
  end

  def click_hamburger_menu(key = nil)
    post_processing key do
      return find(ta(HAMBURGER_MENU_EP)).click if key == :ep
      return find(:xpath, HAMBURGER_MENU_IL).click if key == :il
      find(:xpath, ta(HAMBURGER_MENU_TA, HAMBURGER_MENU_IL)).click
    end
  end

  def click_hot_list_banner(key = nil)
    post_processing key do
      return find(:xpath, ta(HOT_LIST_BANNER_EP)).click if key == :ep
      return find(:xpath, HOT_LIST_BANNER_IL).click if key == :il
      find(:xpath, ta(HOT_LIST_BANNER_TA, HOT_LIST_BANNER_IL)).click
    end
  end

  def click_revolve_logo(key = nil)
    post_processing key do
      return find(:xpath, ta(REVOLVE_LOGO_EP)).click if key == :ep
      return find(:xpath, REVOLVE_LOGO_IL).click if key == :il
      find(:xpath, ta(REVOLVE_LOGO_TA, REVOLVE_LOGO_IL)).click
    end
  end

  def click_to_select_size(key = nil)
    post_processing key do
      return find(:xpath, ta(SIZE_BUTTON_S_EP)).click if key == :ep
      return find(:xpath, SIZE_BUTTON_S_IL).click if key == :il
      find(:xpath, ta(SIZE_BUTTON_S_TA, SIZE_BUTTON_S_IL)).click
    end
  end

  def click_jewelry_product_img(key = nil)
    post_processing key do
      return find(:xpath, ta(PRODUCT_IMG_EP)).click if key == :ep
      return find(:xpath, PRODUCT_IMG_IL).click if key == :il
      find(:xpath, ta(PRODUCT_IMG_TA, PRODUCT_IMG_IL)).click
    end
  end

  def click_view_bag(key = nil)
    post_processing key do
      return find(:xpath, ta(VIEW_BAG_EP)).click if key == :ep
      return find(:xpath, VIEW_BAG_IL).click if key == :il
      find(:xpath, ta(VIEW_BAG_TA, VIEW_BAG_IL)).click
    end
  end

  def click_checkout_page(key = nil)
    post_processing key do
      return find(:xpath, ta(CHECKOUT_BTN_EP)).click if key == :ep
      return find(:xpath, CHECKOUT_BTN_IL).click if key == :il
      find(:xpath, ta(CHECKOUT_BTN_TA, CHECKOUT_BTN_IL)).click
      end
  end

  def click_add_to_bag(key = nil)
    post_processing key do
      return find(:xpath, ta(ADD_TO_BAG_EP)).click if key == :ep
      return find(:xpath, ADD_TO_BAG_IL).click if key == :il
      find(:xpath, ta(ADD_TO_BAG_TA, ADD_TO_BAG_IL)).click
      end
  end

  def select_country(key = nil)
    select "US", :from => "shipping_country"
  end

  def set_name(key = nil, name)
    post_processing key do
      return find(:css, ta(FULL_NAME_EP)).set(name) if key == :ep
      return find(:css, FULL_NAME_IL).set(name) if key == :il
      find(:css, ta(FULL_NAME_TA, FULL_NAME_IL)).set(name)
    end
  end

  def set_address(key = nil, adress)
    post_processing key do
      return find(:css, ta(ADDRESS_EP)).set(adress) if key == :ep
      return find(:css, ADDRESS_IL).set(adress) if key == :il
      find(:css, ta(ADDRESS_TA, ADDRESS_IL)).set(adress)
    end
  end

  def set_deep_address(key = nil, adress2)
    post_processing key do
      return find(:css, ta(DEEP_ADDRESS_EPADDRESS_EP)).set(adress2) if key == :ep
      return find(:css, DEEP_ADDRESS_IL).set(adress2) if key == :il
      find(:css, ta(DEEP_ADDRESS_TA, DEEP_ADDRESS_IL)).set(adress2)
    end
  end

  def set_zip_code(key = nil, zip)
    post_processing key do
      return find(:css, ta(ZIP_CODE_EP)).set(zip) if key == :ep
      return find(:css, ZIP_CODE_IL).set(zip) if key == :il
      find(:css, ta(ZIP_CODE_TA, ZIP_CODE_IL)).set(zip)
    end
  end

  def set_phone(key = nil, phone)
    post_processing key do
      return find(:css, ta(PHONE_EP)).set(phone) if key == :ep
      return find(:css, PHONE_IL).set(phone) if key == :il
      find(:css, ta(PHONE_TA, PHONE_IL)).set(phone)
      end
  end

  def set_order_email(key = nil, email)
    post_processing key do
      return find(:css, ta(ORDER_EMAIL_EP)).set(email) if key == :ep
      return find(:css, ORDER_EMAIL_IL).set(email) if key == :il
      find(:css, ta(ORDER_EMAIL_TA, ORDER_EMAIL_IL)).set(email)
    end
  end

  def click_continue_save_btn(key = nil)
    post_processing key do
      return find(:xpath, ta(SAVE_CONTINUE_BTN_EP)).click if key == :ep
      return find(:xpath, SAVE_CONTINUE_BTN_IL).click if key == :il
      find(:xpath, ta(SAVE_CONTINUE_BTN_TA, SAVE_CONTINUE_BTN_IL)).click
      end
    end

  def click_proceed_to_checkout1
    if page.has_xpath?("(//a[text()='Proceed to checkout'])[1]")
      find(:xpath, "(//a[text()='Proceed to checkout'])[1]").click
      p "a"
    else
      find(:xpath, "(//span[text()='Proceed To Checkout'])[1]").click
      p "span"
    end
  end

  def click_sort_by(key = nil)
    post_processing key do
      return find(:xpath, ta(SORT_BTN_EP)).click if key == :ep
      return find(:xpath, SORT_BTN_IL).click if key == :il
      find(:xpath, ta(SORT_BTN_TA, SORT_BTN_IL)).click
    end
  end

 def click_sort_by_price(key = nil)
   post_processing key do
     return find(:xpath, ta(SORT_BY_PRICE_EP)).click if key == :ep
     return find(:xpath, SORT_BY_PRICE_IL).click if key == :il
     find(:xpath, ta(SORT_BY_PRICE_TA, SORT_BY_PRICE_IL)).click
   end
 end

  def check_sorting
    carusel = "//button[contains(., 'Price: Low to High')]"
    expect(page).to have_selector(:xpath, carusel)
  end

  def click_search_btn(key = nil)
    post_processing key do
      return find(ta(SEARCH_BTN_EP)).click if key == :ep
      return find(:xpath, SEARCH_BTN_IL).click if key == :il
      find(:xpath, ta(SEARCH_BTN_TA, SEARCH_BTN_IL)).click
    end
  end

  def set_search_data(key = nil, data)
    post_processing key do
      return find(ta(DATA_INPUT_EP)).set(data) if key == :ep
      return find(:xpath, DATA_INPUT_IL).set(data) if key == :il
      find(:xpath, ta(DATA_INPUT_TA, DATA_INPUT_IL)).set(data)
      end
  end

  def click_second_search_result(key = nil)
    post_processing key do
      return find(ta(SEARCH_RESULT_EP)).click if key == :ep
      return find(:xpath, SEARCH_RESULT_IL).click if key == :il
      find(:xpath, ta(SEARCH_RESULT_TA, SEARCH_RESULT_IL)).click
    end
  end

  def click_language(key = nil)
  post_processing key do
      return find(ta(LANGUAGE_DROPDOWN_EP)).click if key == :ep
      return find(:xpath, LANGUAGE_DROPDOWN_IL).click if key == :il
      find(:xpath, ta(LANGUAGE_DROPDOWN_TA, LANGUAGE_DROPDOWN_IL)).click
    end
  end

  def click_italiano_language(key = nil)
    post_processing key do
      return find(ta(ITALIANO_LG_EP)).click if key == :ep
      return find(:xpath, ITALIANO_LG_IL).click if key == :il
      find(:xpath, ta(ITALIANO_LG_TA, ITALIANO_LG_IL)).click
    end
  end

  def click_english_language(key = nil)
    post_processing key do
      return find(ta(ENGLISH_LG_EP)).click if key == :ep
      return find(:xpath, ENGLISH_LG_IL).click if key == :il
      find(:xpath, ta(ENGLISH_LG_TA, ENGLISH_LG_IL)).click
    end
  end

end