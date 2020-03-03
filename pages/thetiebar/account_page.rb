require 'spec_helper'
require_relative '../page_extension'


class TheTiebarAccount_page
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension


  MY_ACC_BREADCRUMB_IL = "//a[contains(text(), 'My Account')]"
  MY_ACC_BREADCRUMB_TA = "thetiebar:my_acc_page:my_account"
  MY_ACC_BREADCRUMB_EP = "EP:thetiebar:my_acc_page:my_account"

  EDIT_PROFILE_IL = "//a[contains(text(), 'Edit Profile')]"
  EDIT_PROFILE_TA = "thetiebar:my_acc_page:edit_profile"
  EDIT_PROFILE_EP = "EP:thetiebar:my_acc_page:edit_profile"

  CLOSE_EDIT_BTN_IL = "//img[contains(@class, 'modal-close')]"
  CLOSE_EDIT_BTN_TA = "thetiebar:my_acc_page:close_edit_profile"
  CLOSE_EDIT_BTN_EP = "EP:thetiebar:my_acc_page:close_edit_profile"

  PREFERENCES_IL = "//a[contains(text(), 'Preferences')]"
  PREFERENCES_TA = "thetiebar:my_acc_page:preferences"
  PREFERENCES_EP = "EP:thetiebar:my_acc_page:preferences"

  CHANGE_PASSWORD_IL = "//a[contains(text(), 'Change Password')]"
  CHANGE_PASSWORD_TA = "thetiebar:my_acc_page:change_password"
  CHANGE_PASSWORD_EP = "EP:thetiebar:my_acc_page:change_password"

  CLOSE_PASSWORD_MODAL_IL = "//span[contains(@class, 'modal-close-text')]"
  CLOSE_PASSWORD_MODAL_TA = "thetiebar:my_acc_page:close_password_modal"
  CLOSE_PASSWORD_MODAL_EP = "EP:thetiebar:my_acc_page:close_password_modal"

  ORDERS_IL = "//a[contains(@href, '/Customer/Orders')]/div"
  ORDERS_TA = "thetiebar:my_acc_page:orders"
  ORDERS_EP = "EP:thetiebar:my_acc_page:orders"

  PAYMENT_IL = "(//img[contains(@alt, 'Payment')])[1]"
  PAYMENT_TA = "thetiebar:my_acc_page:payment"
  PAYMENT_EP = "EP:thetiebar:my_acc_page:payment"

  ADDRESS_BOOK_IL = "//img[contains(@alt, 'Address Book')]"
  ADDRESS_BOOK_TA = "thetiebar:my_acc_page:address_book"
  ADDRESS_BOOK_EP = "EP:thetiebar:my_acc_page:address_book"

  WISHLIST_IL = "//img[contains(@alt, 'Wishlist')]"
  WISHLIST_TA = "thetiebar:my_acc_page:wishlist"
  WISHLIST_EP = "EP:thetiebar:my_acc_page:wishlist"

  GIFTCARDS_CREDIT_IL =  "//div[contains(text(), 'Gift Cards & Credit')]"
  GIFTCARDS_CREDIT_TA = "thetiebar:my_acc_page:gift_credit"
  GIFTCARDS_CREDIT_EP = "EP:thetiebar:my_acc_page:gift_credit"

  SIGN_OUT_LINK_IL = "//a[contains(text(), 'Sign Out')]"
  SIGN_OUT_LINK_TA = "thetiebar:my_acc_page:sing_out"
  SIGN_OUT_LINK_EP = "EP:thetiebar:my_acc_page:sing_out"

  SUBSCRIBE_EMAIL_IL = "(//span[contains(@class, 'mbsc-switch-track')])[1]"
  SUBSCRIBE_EMAIL_TA = "thetiebar:preferences_page:subscribe_email"
  SUBSCRIBE_EMAIL_EP = "EP:thetiebar:preferences_page:subscribe_email"

  NEWSLETTER_REASON_IL = "//select[@id='NewsletterUnsubscribeReason']/option[@value='Other']"
  NEWSLETTER_REASON_TA = "thetiebar:preferences_page:other_newsletter"
  NEWSLETTER_REASON_EP = "EP:thetiebar:preferences_page:other_newsletter"

  SUBSCRIBE_PRINT_CATALOG_IL = "(//span[contains(@class, 'mbsc-switch-track')])[2]"
  SUBSCRIBE_PRINT_CATALOG_TA = "thetiebar:preferences_page:print_catalog"
  SUBSCRIBE_PRINT_CATALOG_EP = "EP:thetiebar:preferences_page:print_catalog"

  CATALOG_REASON_IL = "//select[@id='NewsletterUnsubscribeReason']/option[@value='Other']"
  CATALOG_REASON_TA = "thetiebar:preferences_page:other_catalog"
  CATALOG_REASON_EP = "EP:thetiebar:preferences_page:other_catalog"

  SAVE_CHANGES_BTN_IL = "//button[@id='preferences-save-changes-btn']"
  SAVE_CHANGES_BTN_TA = "thetiebar:preferences_page:save_changes_btn"
  SAVE_CHANGES_BTN_EP = "EP:thetiebar:preferences_page:save_changes_btn"

  CLOSE_SAVE_CHANGES_MODAL_IL = "//span[contains(@class, 'modal-close-text')]"
  CLOSE_SAVE_CHANGES_MODAL_TA = "thetiebar:preferences_page:close_save_changes_modal"
  CLOSE_SAVE_CHANGES_MODAL_EP = "EP:thetiebar:preferences_page:close_save_changes_modal"

  VIEW_PRIVACY_POLICY_IL = "//a[contains(text(), 'View Privacy Policy')]"
  VIEW_PRIVACY_POLICY_TA = "thetiebar:preferences_page:view_privacy_policy"
  VIEW_PRIVACY_POLICY_EP = "EP:thetiebar:preferences_page:view_privacy_policy"

  MAIN_TEXT_PRIVACY_POLICY_IL = "//h1[contains(text(),'PRIVACY POLICY')]"
  MAIN_TEXT_PRIVACY_POLICY_TA = "thetiebar:preferences_page:privacy_policy_page"
  MAIN_TEXT_PRIVACY_POLICY_EP = "EP:thetiebar:preferences_page:privacy_policy_page"

  DELETE_ACCOUNT_BTN_IL = "//a[contains(@id, 'preferences-delete-account')]"
  DELETE_ACCOUNT_BTN_TA = "thetiebar:preferences_page:delete_acc_btn"
  DELETE_ACCOUNT_BTN_EP = "EP:thetiebar:preferences_page:delete_acc_btn"

  CANCEL_DELETE_BTN_IL = "(//a[contains(text(), 'Cancel')])[2]"
  CANCEL_DELETE_BTN_TA = "thetiebar:preferences_page:cancel_delete_acc_btn"
  CANCEL_DELETE_BTN_EP = "EP:thetiebar:preferences_page:cancel_delete_acc_btn"

  CLOSE_DELETE_MODAL_ICON_IL = "(//img[contains(@alt, 'close icon')])[1]"
  CLOSE_DELETE_MODAL_ICON_TA = "thetiebar:preferences_page:close_modal_icon"
  CLOSE_DELETE_MODAL_ICON_EP = "EP:thetiebar:preferences_page:close_modal_icon"


  def click_sing_out_link(key = nil)
    post_processing key do
      return find(ta(SIGN_OUT_LINK_EP)).click if key == :ep
      return find(:xpath, SIGN_OUT_LINK_IL).click if key == :il
      find(:xpath, ta(SIGN_OUT_LINK_TA, SIGN_OUT_LINK_IL)).click
    end
  end

  def click_my_acc_breadcrumb(key = nil)
    post_processing key do
      return find(ta(MY_ACC_BREADCRUMB_EP)).click if key == :ep
      return find(:xpath, MY_ACC_BREADCRUMB_IL).click if key == :il
      find(:xpath, ta(MY_ACC_BREADCRUMB_TA, MY_ACC_BREADCRUMB_IL)).click
    end
  end

  def click_close_edit_btn(key = nil)
    post_processing key do
      return find(ta(CLOSE_EDIT_BTN_EP)).click if key == :ep
      return find(:xpath, CLOSE_EDIT_BTN_IL).click if key == :il
      find(:xpath, ta(CLOSE_EDIT_BTN_TA, CLOSE_EDIT_BTN_IL)).click
    end
  end

  def click_preferences_btn(key = nil)
    post_processing key do
      return find(ta(PREFERENCES_EP)).click if key == :ep
      return find(:xpath, PREFERENCES_IL).click if key == :il
      find(:xpath, ta(PREFERENCES_TA, PREFERENCES_IL)).click
    end
  end

  def click_edit_profile_btn(key = nil)
    post_processing key do
      return find(ta(EDIT_PROFILE_EP)).click if key == :ep
      return find(:xpath, EDIT_PROFILE_IL).click if key == :il
      find(:xpath, ta(EDIT_PROFILE_TA, EDIT_PROFILE_IL)).click
    end
  end

  def click_change_password_btn(key = nil)
    post_processing key do
      return find(ta(CHANGE_PASSWORD_EP)).click if key == :ep
      return find(:xpath, CHANGE_PASSWORD_IL).click if key == :il
      find(:xpath, ta(CHANGE_PASSWORD_TA, CHANGE_PASSWORD_IL)).click
    end
  end

  def click_close_password_modal_btn(key = nil)
    post_processing key do
      return find(ta(CLOSE_PASSWORD_MODAL_EP)).click if key == :ep
      return find(:xpath, CLOSE_PASSWORD_MODAL_IL).click if key == :il
      find(:xpath, ta(CLOSE_PASSWORD_MODAL_TA, CLOSE_PASSWORD_MODAL_IL)).click
    end
  end

  def click_orders_btn(key = nil)
    post_processing key do
      return find(ta(ORDERS_EP)).click if key == :ep
      return find(:xpath, ORDERS_IL).click if key == :il
      find(:xpath, ta(ORDERS_TA, ORDERS_IL)).click
    end
  end

  def click_payment_btn(key = nil)
    post_processing key do
      return find(ta(PAYMENT_EP)).click if key == :ep
      return find(:xpath, PAYMENT_IL).click if key == :il
      find(:xpath, ta(PAYMENT_TA, PAYMENT_IL)).click
    end
  end

  def click_address_book_btn(key = nil)
    post_processing key do
      return find(ta(ADDRESS_BOOK_EP)).click if key == :ep
      return find(:xpath, ADDRESS_BOOK_IL).click if key == :il
      find(:xpath, ta(ADDRESS_BOOK_TA, ADDRESS_BOOK_IL)).click
    end
  end

  def click_wishlist_btn(key = nil)
    post_processing key do
      return find(ta(WISHLIST_EP)).click if key == :ep
      return find(:xpath, WISHLIST_IL).click if key == :il
      find(:xpath, ta(WISHLIST_TA, WISHLIST_IL)).click
    end
  end

  def click_gift_cards_btn(key = nil)
    post_processing key do
      return find(ta(GIFTCARDS_CREDIT_EP)).click if key == :ep
      return find(:xpath, GIFTCARDS_CREDIT_IL).click if key == :il
      find(:xpath, ta(GIFTCARDS_CREDIT_TA, GIFTCARDS_CREDIT_IL)).click
    end
  end

  def click_subscribe_email_togler(key = nil)
    post_processing key do
      return find(ta(SUBSCRIBE_EMAIL_EP)).click if key == :ep
      return find(:xpath, SUBSCRIBE_EMAIL_IL).click if key == :il
      find(:xpath, ta(SUBSCRIBE_EMAIL_TA, SUBSCRIBE_EMAIL_IL)).click
    end
  end

  def click_other_newsletter(key = nil)
    post_processing key do
      return find(ta(NEWSLETTER_REASON_EP)).click if key == :ep
      return find(:xpath, NEWSLETTER_REASON_IL).click if key == :il
      find(:xpath, ta(NEWSLETTER_REASON_TA, NEWSLETTER_REASON_IL)).click
    end
  end

  def click_print_catalog_togler(key = nil)
    post_processing key do
      return find(ta(SUBSCRIBE_PRINT_CATALOG_EP)).click if key == :ep
      return find(:xpath, SUBSCRIBE_PRINT_CATALOG_IL).click if key == :il
      find(:xpath, ta(SUBSCRIBE_PRINT_CATALOG_TA, SUBSCRIBE_PRINT_CATALOG_IL)).click
    end
  end

  def click_other_catalog(key = nil)
    post_processing key do
      return find(ta(CATALOG_REASON_EP)).click if key == :ep
      return find(:xpath, CATALOG_REASON_IL).click if key == :il
      find(:xpath, ta(CATALOG_REASON_TA, CATALOG_REASON_IL)).click
    end
  end

  def click_save_changes_btn(key = nil)
    post_processing key do
      return find(ta(SAVE_CHANGES_BTN_EP)).click if key == :ep
      return find(:xpath, SAVE_CHANGES_BTN_IL).click if key == :il
      find(:xpath, ta(SAVE_CHANGES_BTN_TA, SAVE_CHANGES_BTN_IL)).click
    end
  end

  def click_close_save_changes_modal(key = nil)
    post_processing key do
      return find(ta(CLOSE_SAVE_CHANGES_MODAL_EP)).click if key == :ep
      return find(:xpath, CLOSE_SAVE_CHANGES_MODAL_IL).click if key == :il
      find(:xpath, ta(CLOSE_SAVE_CHANGES_MODAL_TA, CLOSE_SAVE_CHANGES_MODAL_IL)).click
    end
  end

  def click_view_privacy_policy_btn(key = nil)
    post_processing key do
      return find(ta(VIEW_PRIVACY_POLICY_EP)).click if key == :ep
      return find(:xpath, VIEW_PRIVACY_POLICY_IL).click if key == :il
      find(:xpath, ta(VIEW_PRIVACY_POLICY_TA, VIEW_PRIVACY_POLICY_IL)).click
    end
  end

  def should_see_privacy_policy_page(key = nil)
    post_processing key do
      return assert_selector(ta(MAIN_TEXT_PRIVACY_POLICY_EP)) if key == :ep
      return assert_selector(:xpath, MAIN_TEXT_PRIVACY_POLICY_IL) if key == :il
      assert_selector(:xpath, ta(MAIN_TEXT_PRIVACY_POLICY_TA, MAIN_TEXT_PRIVACY_POLICY_IL))
    end
  end

  def click_delete_account_btn(key = nil)
    post_processing key do
      return find(ta(DELETE_ACCOUNT_BTN_EP)).click if key == :ep
      return find(:xpath, DELETE_ACCOUNT_BTN_IL).click if key == :il
      find(:xpath, ta(DELETE_ACCOUNT_BTN_TA, DELETE_ACCOUNT_BTN_IL)).click
    end
  end

  def click_cancel_delete_btn(key = nil)
    post_processing key do
      return find(ta(CANCEL_DELETE_BTN_EP)).click if key == :ep
      return find(:xpath, CANCEL_DELETE_BTN_IL).click if key == :il
      find(:xpath, ta(CANCEL_DELETE_BTN_TA, CANCEL_DELETE_BTN_IL)).click
    end
  end

  def click_close_delete_modal_icon(key = nil)
    post_processing key do
      return find(ta(CLOSE_DELETE_MODAL_ICON_EP)).click if key == :ep
      return find(:xpath, CLOSE_DELETE_MODAL_ICON_IL).click if key == :il
      find(:xpath, ta(CLOSE_DELETE_MODAL_ICON_TA, CLOSE_DELETE_MODAL_ICON_IL)).click
    end
  end

end