require 'spec_helper'
require_relative '../../helpers/special_methods'


class TheTiebarHeader
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage


  LOGO_IL = "//a[@href='https://www.thetiebar.com/']"
  LOGO_TA = "thetiebar:header:logo"
  LOGO_EP = "EP:thetiebar:header:logo"

  SEARCH_FIELD_IL = "//input[contains(@aria-label, 'Desktop Search')]"
  SEARCH_FIELD_TA = "thetiebar:header:search_field"
  SEARCH_FIELD_EP = "EP:thetiebar:header:search_field"

  CART_BTN_IL = "//button[contains(@aria-label, 'Cart')]"
  CART_BTN_TA = "thetiebar:header:cart_btn"
  CART_BTN_EP = "EP:thetiebar:header:cart_btn"

  SIGNIN_BTN_IL = "//span[contains(text(), 'Sign In')]"
  SIGNIN_BTN_TA = "thetiebar:header:signin_btn"
  SIGNIN_BTN_EP = "EP:thetiebar:header:signin_btn"

  ACCOUNT_BTN_IL = "//button[contains(@aria-label, 'Account')][1]"
  ACCOUNT_BTN_TA = "thetiebar:header:account_btn"
  ACCOUNT_BTN_EP = "EP:thetiebar:header:account_btn"

  REWARDS_LINK_IL = "//h4[contains(text(), 'Rewards Program!')]"
  REWARDS_LINK_TA = "thetiebar:header:rewards_program"
  REWARDS_LINK_EP = "EP:thetiebar:header:rewards_program"

  SHIRTS_CATEGORY_IL = "(//span[contains(text(), 'Shirts')])[1]"
  SHIRTS_CATEGORY_TA = "thetiebar:header:subcategory:Shirts"
  SHIRTS_CATEGORY_EP = "EP:thetiebar:header:subcategory:Shirts"

  PANTS_CATEGORY_IL = "(//span[contains(text(), 'Pants')])[1]"
  PANTS_CATEGORY_TA = "thetiebar:header:subcategory:Pants"
  PANTS_CATEGORY_EP = "EP:thetiebar:header:subcategory:Pants"

  NECKTIES_CATEGORY_IL = "(//span[contains(text(), 'Neckties')])[1]"
  NECKTIES_CATEGORY_TA = "thetiebar:header:subcategory:Neckties"
  NECKTIES_CATEGORY_EP = "EP:thetiebar:header:subcategory:Neckties"

  SKINNYTIES_CATEGORY_IL = "(//span[contains(text(), 'Skinny Ties')])[1]"
  SKINNYTIES_CATEGORY_TA = "thetiebar:header:subcategory:Skinny_ties"
  SKINNYTIES_CATEGORY_EP = "EP:thetiebar:header:subcategory:Skinny_ties"

  BOWTIES_CATEGORY_IL = "(//span[contains(text(), 'Bow Ties')])[1]"
  BOWTIES_CATEGORY_TA = "thetiebar:header:subcategory:Bow_ties"
  BOWTIES_CATEGORY_EP = "EP:thetiebar:header:subcategory:Bow_ties"

  TIEBARS_CATEGORY_IL = "(//span[contains(text(), 'Tie Bars')])[1]"
  TIEBARS_CATEGORY_TA = "thetiebar:header:subcategory:pants"
  TIEBARS_CATEGORY_EP = "EP:thetiebar:header:subcategory:pants"

  SOCKS_CATEGORY_IL = "(//span[contains(text(), 'Socks')])[1]"
  SOCKS_CATEGORY_TA = "thetiebar:header:subcategory:Socks"
  SOCKS_CATEGORY_EP = "EP:thetiebar:header:subcategory:Socks"

  POCKET_SQUARES_CATEGORY_IL = "(//span[contains(text(), 'Pocket Squares')])[1]"
  POCKET_SQUARES_CATEGORY_TA = "thetiebar:header:subcategory:Pocket_Squares"
  POCKET_SQUARES_CATEGORY_EP = "EP:thetiebar:header:subcategory:Pocket_Squares"

  ACCESSORIES_CATEGORY_IL = "(//span[contains(text(), 'Accessories')])[1]"
  ACCESSORIES_CATEGORY_TA = "thetiebar:header:subcategory:Accessories"
  ACCESSORIES_CATEGORY_EP = "EP:thetiebar:header:subcategory:Accessories"

  WEDDING_CATEGORY_IL = "(//span[contains(text(), 'Wedding')])[1]"
  WEDDING_CATEGORY_TA = "thetiebar:header:subcategory:Wedding"
  WEDDING_CATEGORY_EP = "EP:thetiebar:header:subcategory:Wedding"

  GIFTS_CATEGORY_IL = "(//span[contains(text(), 'Gifts')])[1]"
  GIFTS_CATEGORY_TA = "thetiebar:header:subcategory:Gifts"
  GIFTS_CATEGORY_EP = "EP:thetiebar:header:subcategory:Gifts"

  SIGN_OUT_LINK_IL = "//div[contains(text(), 'Sign Out')]"
  SIGN_OUT_LINK_TA = "thetiebar:header:sign_out"
  SIGN_OUT_LINK_EP = "EP:thetiebar:header:sign_out"

  ORDERS_ACCOUNT_MENU_IL = "//li//div[text()='Orders']"
  ORDERS_ACCOUNT_MENU_TA = "thetiebar:header:orders_acc_menu"
  ORDERS_ACCOUNT_MENU_EP = "EP:thetiebar:header:orders_acc_menu"

  ADDRESS_BOOK_ACCOUNT_MENU_IL = "//li//div[text()='Address Book']"
  ADDRESS_BOOK_ACCOUNT_MENU_TA = "thetiebar:header:address_book_acc_menu"
  ADDRESS_BOOK_ACCOUNT_MENU_EP = "EP:thetiebar:header:address_book_acc_menu"

  PAYMENT_ACCOUNT_MENU_IL = "//li//div[text()='Payment']"
  PAYMENT_ACCOUNT_MENU_TA = "thetiebar:header:payment_acc_menu"
  PAYMENT_ACCOUNT_MENU_EP = "EP:thetiebar:header:payment_acc_menu"

  WISH_LIST_ACCOUNT_MENU_IL = "//li//div[text()='Wish List']"
  WISH_LIST_ACCOUNT_MENU_TA = "thetiebar:header:wish_list_acc_menu"
  WISH_LIST_ACCOUNT_MENU_EP = "EP:thetiebar:header:wish_list_acc_menu"

  GIFT_CARDS_ACCOUNT_MENU_IL = "//li//div[text()='Gift Cards & Credit']"
  GIFT_CARDS_ACCOUNT_MENU_TA = "thetiebar:header:gift_cards_credit_acc_menu"
  GIFT_CARDS_ACCOUNT_MENU_EP = "EP:thetiebar:header:gift_cards_credit_acc_menu"

  PROFILE_ACCOUNT_MENU_IL = "//li//div[text()='Profile']"
  PROFILE_ACCOUNT_MENU_TA = "thetiebar:header:profile_acc_menu"
  PROFILE_ACCOUNT_MENU_EP = "EP:thetiebar:header:profile_acc_menu"

  PREFERENCE_ACCOUNT_MENU_IL = "//li//div[text()='Preferences']"
  PREFERENCE_ACCOUNT_MENU_TA = "thetiebar:header:preferences_acc_menu"
  PREFERENCE_ACCOUNT_MENU_EP = "EP:thetiebar:header:preferences_acc_menu"

  NEED_HELP_ACCOUNT_MENU_IL = "//li//div[text()='Need Help?']"
  NEED_HELP_ACCOUNT_MENU_TA = "thetiebar:header:need_help_acc_menu"
  NEED_HELP_ACCOUNT_MENU_EP = "EP:thetiebar:header:need_help_acc_menu"


  def click_orders_in_acc_menu(key = nil)
    post_processing key do
      return find(ta(ORDERS_ACCOUNT_MENU_EP)).click if key == :ep
      return find(:xpath, ORDERS_ACCOUNT_MENU_IL).click if key == :il
      find(:xpath, ta(ORDERS_ACCOUNT_MENU_TA, ORDERS_ACCOUNT_MENU_IL)).click
    end
  end

  def click_address_book_in_acc_menu(key = nil)
    post_processing key do
      return find(ta(ADDRESS_BOOK_ACCOUNT_MENU_EP)).click if key == :ep
      return find(:xpath, ADDRESS_BOOK_ACCOUNT_MENU_IL).click if key == :il
      find(:xpath, ta(ADDRESS_BOOK_ACCOUNT_MENU_TA, ADDRESS_BOOK_ACCOUNT_MENU_IL)).click
    end
  end

  def click_payment_in_acc_menu(key = nil)
    post_processing key do
      return find(ta(PAYMENT_ACCOUNT_MENU_EP)).click if key == :ep
      return find(:xpath, PAYMENT_ACCOUNT_MENU_IL).click if key == :il
      find(:xpath, ta(PAYMENT_ACCOUNT_MENU_TA, PAYMENT_ACCOUNT_MENU_IL)).click
    end
  end

  def click_wish_list_in_acc_menu(key = nil)
    post_processing key do
      return find(ta(WISH_LIST_ACCOUNT_MENU_EP)).click if key == :ep
      return find(:xpath, WISH_LIST_ACCOUNT_MENU_IL).click if key == :il
      find(:xpath, ta(WISH_LIST_ACCOUNT_MENU_TA, WISH_LIST_ACCOUNT_MENU_IL)).click
    end
  end

  def click_gift_cads_in_acc_menu(key = nil)
    post_processing key do
      return find(ta(GIFT_CARDS_ACCOUNT_MENU_EP)).click if key == :ep
      return find(:xpath, GIFT_CARDS_ACCOUNT_MENU_IL).click if key == :il
      find(:xpath, ta(GIFT_CARDS_ACCOUNT_MENU_TA, GIFT_CARDS_ACCOUNT_MENU_IL)).click
    end
  end

  def click_profile_in_acc_menu(key = nil)
    post_processing key do
      return find(ta(PROFILE_ACCOUNT_MENU_EP)).click if key == :ep
      return find(:xpath, PROFILE_ACCOUNT_MENU_IL).click if key == :il
      find(:xpath, ta(PROFILE_ACCOUNT_MENU_TA, PROFILE_ACCOUNT_MENU_IL)).click
    end
  end

  def click_preference_in_acc_menu(key = nil)
    post_processing key do
      return find(ta(PREFERENCE_ACCOUNT_MENU_EP)).click if key == :ep
      return find(:xpath, PREFERENCE_ACCOUNT_MENU_IL).click if key == :il
      find(:xpath, ta(PREFERENCE_ACCOUNT_MENU_TA, PREFERENCE_ACCOUNT_MENU_IL)).click
    end
  end

  def click_need_help_in_acc_menu(key = nil)
    post_processing key do
      return find(ta(NEED_HELP_ACCOUNT_MENU_EP)).click if key == :ep
      return find(:xpath, NEED_HELP_ACCOUNT_MENU_IL).click if key == :il
      find(:xpath, ta(NEED_HELP_ACCOUNT_MENU_TA, NEED_HELP_ACCOUNT_MENU_IL)).click
    end
  end

  def click_logo(key = nil)
    post_processing key do
      return find(ta(LOGO_EP)).click if key == :ep
      return find(:xpath, LOGO_IL).click if key == :il
      find(:xpath, ta(LOGO_TA, LOGO_IL)).click
    end
  end

  def click_sing_in_btn(key = nil)
    post_processing key do
      return find(ta(SIGNIN_BTN_EP)).click if key == :ep
      return find(:xpath, SIGNIN_BTN_IL).click if key == :il
      find(:xpath, ta(SIGNIN_BTN_TA, SIGNIN_BTN_IL)).click
    end
  end

  def click_account_btn(key = nil)
    post_processing key do
      return find(ta(ACCOUNT_BTN_EP)).click if key == :ep
      return find(:xpath, ACCOUNT_BTN_IL).click if key == :il
      find(:xpath, ta(ACCOUNT_BTN_TA, ACCOUNT_BTN_IL)).click
    end
  end

  def click_sing_out_link(key = nil)
    post_processing key do
      return find(ta(SIGN_OUT_LINK_EP)).click if key == :ep
      return find(:xpath, SIGN_OUT_LINK_IL).click if key == :il
      find(:xpath, ta(SIGN_OUT_LINK_TA, SIGN_OUT_LINK_IL)).click
    end
  end

  def click_shirts_category(key = nil)
    post_processing key do
      return find(ta(SHIRTS_CATEGORY_EP)).click if key == :ep
      return find(:xpath, SHIRTS_CATEGORY_IL).click if key == :il
      find(:xpath, ta(SHIRTS_CATEGORY_TA, SHIRTS_CATEGORY_IL)).click
    end
  end

  def click_pants_category(key = nil)
    post_processing key do
      return find(ta(PANTS_CATEGORY_EP)).click if key == :ep
      return find(:xpath, PANTS_CATEGORY_IL).click if key == :il
      find(:xpath, ta(PANTS_CATEGORY_TA, PANTS_CATEGORY_IL)).click
    end
  end

  def click_neckties_category(key = nil)
    post_processing key do
      return find(ta(NECKTIES_CATEGORY_EP)).click if key == :ep
      return find(:xpath, NECKTIES_CATEGORY_IL).click if key == :il
      find(:xpath, ta(NECKTIES_CATEGORY_TA, NECKTIES_CATEGORY_IL)).click
    end
  end

  def click_skinnyties_category(key = nil)
    post_processing key do
      return find(ta(SKINNYTIES_CATEGORY_EP)).click if key == :ep
      return find(:xpath, SKINNYTIES_CATEGORY_IL).click if key == :il
      find(:xpath, ta(SKINNYTIES_CATEGORY_TA, SKINNYTIES_CATEGORY_IL)).click
    end
  end

  def click_bowties_category(key = nil)
    post_processing key do
      return find(ta(BOWTIES_CATEGORY_EP)).click if key == :ep
      return find(:xpath, BOWTIES_CATEGORY_IL).click if key == :il
      find(:xpath, ta(BOWTIES_CATEGORY_TA, BOWTIES_CATEGORY_IL)).click
    end
  end

  def click_tiebars_category(key = nil)
    post_processing key do
      return find(ta(TIEBARS_CATEGORY_EP)).click if key == :ep
      return find(:xpath, TIEBARS_CATEGORY_IL).click if key == :il
      find(:xpath, ta(TIEBARS_CATEGORY_TA, TIEBARS_CATEGORY_IL)).click
    end
  end

  def click_socks_category(key = nil)
    post_processing key do
      return find(ta(SOCKS_CATEGORY_EP)).click if key == :ep
      return find(:xpath, SOCKS_CATEGORY_IL).click if key == :il
      find(:xpath, ta(SOCKS_CATEGORY_TA, SOCKS_CATEGORY_IL)).click
    end
  end

  def click_pocket_squares_category(key = nil)
    post_processing key do
      return find(ta(POCKET_SQUARES_CATEGORY_EP)).click if key == :ep
      return find(:xpath, POCKET_SQUARES_CATEGORY_IL).click if key == :il
      find(:xpath, ta(POCKET_SQUARES_CATEGORY_TA, POCKET_SQUARES_CATEGORY_IL)).click
    end
  end

  def click_accessories_category(key = nil)
    post_processing key do
      return find(ta(ACCESSORIES_CATEGORY_EP)).click if key == :ep
      return find(:xpath, ACCESSORIES_CATEGORY_IL).click if key == :il
      find(:xpath, ta(ACCESSORIES_CATEGORY_TA, ACCESSORIES_CATEGORY_IL)).click
    end
  end

  def click_wedding_category(key = nil)
    post_processing key do
      return find(ta(WEDDING_CATEGORY_EP)).click if key == :ep
      return find(:xpath, WEDDING_CATEGORY_IL).click if key == :il
      find(:xpath, ta(WEDDING_CATEGORY_TA, WEDDING_CATEGORY_IL)).click
    end
  end

  def click_gifts_category(key = nil)
    post_processing key do
      return find(ta(GIFTS_CATEGORY_EP)).click if key == :ep
      return find(:xpath, GIFTS_CATEGORY_IL).click if key == :il
      find(:xpath, ta(GIFTS_CATEGORY_TA, GIFTS_CATEGORY_IL)).click
    end
  end

  def fill_search_input(key = nil, value)
    post_processing key do
      return find(ta(SEARCH_FIELD_EP)).set(value) if key == :ep
      return find(:xpath, SEARCH_FIELD_IL).set(value) if key == :il
      find(:xpath, ta(SEARCH_FIELD_TA, SEARCH_FIELD_IL)).set(value)
    end
  end

  def click_enter_search_result(key = nil)
    post_processing key do
      return find(ta(SEARCH_FIELD_EP)).native.send_keys(:enter) if key == :ep
      return find(:xpath, SEARCH_FIELD_IL).native.send_keys(:enter) if key == :il
      find(:xpath, ta(SEARCH_FIELD_TA, SEARCH_FIELD_IL)).native.send_keys(:enter)
    end
  end

  def click_cart_icon(key = nil)
    post_processing key do
      return find(ta(CART_BTN_EP)).click if key == :ep
      return find(:xpath, CART_BTN_IL).click if key == :il
      find(:xpath, ta(CART_BTN_TA, CART_BTN_IL)).click
    end
  end

end