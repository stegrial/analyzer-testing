require_relative '../page_extension'

class TheTiebarHeader < PageExtension

  LOGO_IL = "//a[@href='https://www.thetiebar.com/']"
  LOGO_TA = "thetiebar:header:logo"

  SEARCH_FIELD_IL = "//input[contains(@placeholder, 'Search')]"
  SEARCH_FIELD_TA = "thetiebar:header:search_field"

  SEARCH_BUTTON_IL = "//button[@aria-label='Search']"
  SEARCH_BUTTON_TA = "thetiebar:header:search_button"

  CART_BTN_IL = "//button[contains(@aria-label, 'Cart')]"
  CART_BTN_TA = "thetiebar:header:cart_btn"

  SIGNIN_BTN_IL = "(//a[contains(@href, 'login')]/button)[2]"
  SIGNIN_BTN_TA = "thetiebar:header:signin_btn"

  ACCOUNT_BTN_IL = "(//div/span[text()='Account'])[2]"
  ACCOUNT_BTN_TA = "thetiebar:header:account_btn"

  REWARDS_LINK_IL = "//h4[contains(text(), 'Rewards Program!')]"
  REWARDS_LINK_TA = "thetiebar:header:rewards_program"

  SHIRTS_CATEGORY_IL = "(//span[contains(text(), 'Shirts')])[1]"
  SHIRTS_CATEGORY_TA = "thetiebar:header:subcategory:Shirts"

  NECKTIES_CATEGORY_IL = "(//span[contains(text(), 'Neckties')])[1]"
  NECKTIES_CATEGORY_TA = "thetiebar:header:subcategory:Neckties"

  SKINNYTIES_CATEGORY_IL = "(//span[contains(text(), 'Skinny Ties')])[1]"
  SKINNYTIES_CATEGORY_TA = "thetiebar:header:subcategory:Skinny_ties"

  BOWTIES_CATEGORY_IL = "(//span[contains(text(), 'Bow Ties')])[1]"
  BOWTIES_CATEGORY_TA = "thetiebar:header:subcategory:Bow_ties"

  TIEBARS_CATEGORY_IL = "(//span[contains(text(), 'Tie Bars')])[1]"
  TIEBARS_CATEGORY_TA = "thetiebar:header:subcategory:pants"

  ACCESSORIES_CATEGORY_IL = "(//span[contains(text(), 'Accessories')])[1]"
  ACCESSORIES_CATEGORY_TA = "thetiebar:header:subcategory:Accessories"

  WEDDING_CATEGORY_IL = "(//span[contains(text(), 'Wedding')])[1]"
  WEDDING_CATEGORY_TA = "thetiebar:header:subcategory:Wedding"

  GIFTS_CATEGORY_IL = "(//span[contains(text(), 'Gifts')])[1]"
  GIFTS_CATEGORY_TA = "thetiebar:header:subcategory:Gifts"

  SIGN_OUT_LINK_IL = "//div[contains(text(), 'Sign Out')]"
  SIGN_OUT_LINK_TA = "thetiebar:header:sign_out"

  ORDERS_ACCOUNT_MENU_IL = "//li//div[text()='Orders']"
  ORDERS_ACCOUNT_MENU_TA = "thetiebar:header:orders_acc_menu"

  ADDRESS_BOOK_ACCOUNT_MENU_IL = "//li//div[text()='Address Book']"
  ADDRESS_BOOK_ACCOUNT_MENU_TA = "thetiebar:header:address_book_acc_menu"

  PAYMENT_ACCOUNT_MENU_IL = "//li//div[text()='Payment']"
  PAYMENT_ACCOUNT_MENU_TA = "thetiebar:header:payment_acc_menu"

  WISH_LIST_ACCOUNT_MENU_IL = "//li//div[text()='Wish List']"
  WISH_LIST_ACCOUNT_MENU_TA = "thetiebar:header:wish_list_acc_menu"

  GIFT_CARDS_ACCOUNT_MENU_IL = "//li//div[text()='Gift Cards & Credit']"
  GIFT_CARDS_ACCOUNT_MENU_TA = "thetiebar:header:gift_cards_credit_acc_menu"

  PROFILE_ACCOUNT_MENU_IL = "//li//div[text()='Profile']"
  PROFILE_ACCOUNT_MENU_TA = "thetiebar:header:profile_acc_menu"

  PREFERENCE_ACCOUNT_MENU_IL = "//li//div[text()='Preferences']"
  PREFERENCE_ACCOUNT_MENU_TA = "thetiebar:header:preferences_acc_menu"

  NEED_HELP_ACCOUNT_MENU_IL = "//li//div[text()='Need Help?']"
  NEED_HELP_ACCOUNT_MENU_TA = "thetiebar:header:need_help_acc_menu"


  def click_orders_in_acc_menu(key = nil)
    find_element(key, il_type: :xpath, tl: ORDERS_ACCOUNT_MENU_TA, il: ORDERS_ACCOUNT_MENU_IL, check_path: $check_path).click
  end

  def click_address_book_in_acc_menu(key = nil)
    find_element(key, il_type: :xpath, tl: ADDRESS_BOOK_ACCOUNT_MENU_TA, il: ADDRESS_BOOK_ACCOUNT_MENU_IL, check_path: $check_path).click
  end

  def click_payment_in_acc_menu(key = nil)
    find_element(key, il_type: :xpath, tl: PAYMENT_ACCOUNT_MENU_TA, il: PAYMENT_ACCOUNT_MENU_IL, check_path: $check_path).click
  end

  def click_wish_list_in_acc_menu(key = nil)
    find_element(key, il_type: :xpath, tl: WISH_LIST_ACCOUNT_MENU_TA, il: WISH_LIST_ACCOUNT_MENU_IL, check_path: $check_path).click
  end

  def click_gift_cads_in_acc_menu(key = nil)
    find_element(key, il_type: :xpath, tl: GIFT_CARDS_ACCOUNT_MENU_TA, il: GIFT_CARDS_ACCOUNT_MENU_IL, check_path: $check_path).click
  end

  def click_profile_in_acc_menu(key = nil)
    find_element(key, il_type: :xpath, tl: PROFILE_ACCOUNT_MENU_TA, il: PROFILE_ACCOUNT_MENU_IL, check_path: $check_path).click
  end

  def click_preference_in_acc_menu(key = nil)
    find_element(key, il_type: :xpath, tl: PREFERENCE_ACCOUNT_MENU_TA, il: PREFERENCE_ACCOUNT_MENU_IL, check_path: $check_path).click
  end

  def click_need_help_in_acc_menu(key = nil)
    find_element(key, il_type: :xpath, tl: NEED_HELP_ACCOUNT_MENU_TA, il: NEED_HELP_ACCOUNT_MENU_IL, check_path: $check_path).click
  end

  def click_logo(key = nil)
    find_element(key, il_type: :xpath, tl: LOGO_TA, il: LOGO_IL, check_path: $check_path).click
  end

  def click_sing_in_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SIGNIN_BTN_TA, il: SIGNIN_BTN_IL, check_path: $check_path).click
  end

  def click_account_btn(key = nil)
    find_element(key, il_type: :xpath, tl: ACCOUNT_BTN_TA, il: ACCOUNT_BTN_IL, check_path: $check_path).click
  end

  def click_sing_out_link(key = nil)
    find_element(key, il_type: :xpath, tl: SIGN_OUT_LINK_TA, il: SIGN_OUT_LINK_IL, check_path: $check_path).click
  end

  def click_shirts_category(key = nil)
    find_element(key, il_type: :xpath, tl: SHIRTS_CATEGORY_TA, il: SHIRTS_CATEGORY_IL, check_path: $check_path).click
  end

  def click_neckties_category(key = nil)
    find_element(key, il_type: :xpath, tl: NECKTIES_CATEGORY_TA, il: NECKTIES_CATEGORY_IL, check_path: $check_path).click
  end

  def click_skinnyties_category(key = nil)
    find_element(key, il_type: :xpath, tl: SKINNYTIES_CATEGORY_TA, il: SKINNYTIES_CATEGORY_IL, check_path: $check_path).click
  end

  def click_bowties_category(key = nil)
    find_element(key, il_type: :xpath, tl: BOWTIES_CATEGORY_TA, il: BOWTIES_CATEGORY_IL, check_path: $check_path).click
  end

  def click_tiebars_category(key = nil)
    find_element(key, il_type: :xpath, tl: TIEBARS_CATEGORY_TA, il: TIEBARS_CATEGORY_IL, check_path: $check_path).click
  end

  def click_accessories_category(key = nil)
    find_element(key, il_type: :xpath, tl: ACCESSORIES_CATEGORY_TA, il: ACCESSORIES_CATEGORY_IL, check_path: $check_path).click
  end

  def click_wedding_category(key = nil)
    find_element(key, il_type: :xpath, tl: WEDDING_CATEGORY_TA, il: WEDDING_CATEGORY_IL, check_path: $check_path).click
  end

  def click_gifts_category(key = nil)
    find_element(key, il_type: :xpath, tl: GIFTS_CATEGORY_TA, il: GIFTS_CATEGORY_IL, check_path: $check_path).click
  end

  def fill_search_input(key = nil, value)
    find_element(key, il_type: :xpath, tl: SEARCH_FIELD_TA, il: SEARCH_FIELD_IL, check_path: $check_path).set(value)
  end

  def click_search_button(key = nil)
    find_element(key, il_type: :xpath, tl: SEARCH_BUTTON_TA, il: SEARCH_BUTTON_IL, check_path: $check_path).click
  end

  def click_enter_search_result(key = nil)
    find_element(key, il_type: :xpath, tl: SEARCH_FIELD_TA, il: SEARCH_FIELD_IL, check_path: $check_path).native.send_keys(:enter)
  end

  def click_cart_icon(key = nil)
    find_element(key, il_type: :xpath, tl: CART_BTN_TA, il: CART_BTN_IL, check_path: $check_path).click
  end

end
