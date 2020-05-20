require_relative '../page_extension'

class TheTiebarAccount_page < PageExtension

  MY_ACC_BREADCRUMB_IL = "//a[contains(text(), 'My Account')]"
  MY_ACC_BREADCRUMB_TA = "thetiebar:my_acc_page:my_account"

  EDIT_PROFILE_IL = "//a[contains(text(), 'Edit Profile')]"
  EDIT_PROFILE_TA = "thetiebar:my_acc_page:edit_profile"

  CLOSE_EDIT_BTN_IL = "//img[contains(@class, 'modal-close')]"
  CLOSE_EDIT_BTN_TA = "thetiebar:my_acc_page:close_edit_profile"

  PREFERENCES_IL = "//a[contains(text(), 'Preferences')]"
  PREFERENCES_TA = "thetiebar:my_acc_page:preferences"

  CHANGE_PASSWORD_IL = "//a[contains(text(), 'Change Password')]"
  CHANGE_PASSWORD_TA = "thetiebar:my_acc_page:change_password"

  CLOSE_PASSWORD_MODAL_IL = "//span[contains(@class, 'modal-close-text')]"
  CLOSE_PASSWORD_MODAL_TA = "thetiebar:my_acc_page:close_password_modal"

  ORDERS_IL = "//a[contains(@href, '/Customer/Orders')]/div"
  ORDERS_TA = "thetiebar:my_acc_page:orders"

  PAYMENT_IL = "(//img[contains(@alt, 'Payment')])[1]"
  PAYMENT_TA = "thetiebar:my_acc_page:payment"

  ADDRESS_BOOK_IL = "//img[contains(@alt, 'Address Book')]"
  ADDRESS_BOOK_TA = "thetiebar:my_acc_page:address_book"

  WISHLIST_IL = "//img[contains(@alt, 'Wishlist')]"
  WISHLIST_TA = "thetiebar:my_acc_page:wishlist"

  GIFTCARDS_CREDIT_IL = "//div[contains(text(), 'Gift Cards & Credit')]"
  GIFTCARDS_CREDIT_TA = "thetiebar:my_acc_page:gift_credit"

  SIGN_OUT_LINK_IL = "//a[contains(text(), 'Sign Out')]"
  SIGN_OUT_LINK_TA = "thetiebar:my_acc_page:sing_out"

  SUBSCRIBE_EMAIL_IL = "(//span[contains(@class, 'mbsc-switch-track')])[1]"
  SUBSCRIBE_EMAIL_TA = "thetiebar:preferences_page:subscribe_email"

  NEWSLETTER_REASON_IL = "//select[@id='NewsletterUnsubscribeReason']/option[@value='Other']"
  NEWSLETTER_REASON_TA = "thetiebar:preferences_page:other_newsletter"

  # SUBSCRIBE_PRINT_CATALOG_IL = "(//span[contains(@class, 'mbsc-switch-track')])[2]"
  SUBSCRIBE_PRINT_CATALOG_IL = "(//span[contains(@class, 'mbsc-slider-handle-cont')])[2]"
  SUBSCRIBE_PRINT_CATALOG_TA = "thetiebar:preferences_page:print_catalog"

  CATALOG_REASON_IL = "//select[@id='NewsletterUnsubscribeReason']/option[@value='Other']"
  CATALOG_REASON_TA = "thetiebar:preferences_page:other_catalog"

  SAVE_CHANGES_BTN_IL = "//button[@id='preferences-save-changes-btn']"
  SAVE_CHANGES_BTN_TA = "thetiebar:preferences_page:save_changes_btn"

  CLOSE_SAVE_CHANGES_MODAL_IL = "//img[contains(@class, 'x-icon')]"
  CLOSE_SAVE_CHANGES_MODAL_TA = "thetiebar:preferences_page:close_save_changes_modal"

  VIEW_PRIVACY_POLICY_IL = "//a[contains(text(), 'View Privacy Policy')]"
  VIEW_PRIVACY_POLICY_TA = "thetiebar:preferences_page:view_privacy_policy"

  MAIN_TEXT_PRIVACY_POLICY_IL = "//h1[contains(text(),'privacy policy')]"
  MAIN_TEXT_PRIVACY_POLICY_TA = "thetiebar:preferences_page:privacy_policy_page"

  DELETE_ACCOUNT_BTN_IL = "//a[contains(@id, 'preferences-delete-account')]"
  DELETE_ACCOUNT_BTN_TA = "thetiebar:preferences_page:delete_acc_btn"

  CANCEL_DELETE_BTN_IL = "(//a[contains(text(), 'Cancel')])[2]"
  CANCEL_DELETE_BTN_TA = "thetiebar:preferences_page:cancel_delete_acc_btn"

  CLOSE_DELETE_MODAL_ICON_IL = "(//img[contains(@alt, 'close icon')])[1]"
  CLOSE_DELETE_MODAL_ICON_TA = "thetiebar:preferences_page:close_modal_icon"


  def click_sing_out_link(key = nil)
    find_element(key, il_type: :xpath, tl: SIGN_OUT_LINK_TA, il: SIGN_OUT_LINK_IL, check_path: $check_path).click
  end

  def click_my_acc_breadcrumb(key = nil)
    find_element(key, il_type: :xpath, tl: MY_ACC_BREADCRUMB_TA, il: MY_ACC_BREADCRUMB_IL, check_path: $check_path).click
  end

  def click_close_edit_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_EDIT_BTN_TA, il: CLOSE_EDIT_BTN_IL, check_path: $check_path).click
  end

  def click_preferences_btn(key = nil)
    find_element(key, il_type: :xpath, tl: PREFERENCES_TA, il: PREFERENCES_IL, check_path: $check_path).click
  end

  def click_edit_profile_btn(key = nil)
    find_element(key, il_type: :xpath, tl: EDIT_PROFILE_TA, il: EDIT_PROFILE_IL, check_path: $check_path).click
  end

  def click_change_password_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CHANGE_PASSWORD_TA, il: CHANGE_PASSWORD_IL, check_path: $check_path).click
  end

  def click_close_password_modal_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_PASSWORD_MODAL_TA, il: CLOSE_PASSWORD_MODAL_IL, check_path: $check_path).click
  end

  def click_orders_btn(key = nil)
    find_element(key, il_type: :xpath, tl: ORDERS_TA, il: ORDERS_IL, check_path: $check_path).click
  end

  def click_payment_btn(key = nil)
    find_element(key, il_type: :xpath, tl: PAYMENT_TA, il: PAYMENT_IL, check_path: $check_path).click
  end

  def click_address_book_btn(key = nil)
    find_element(key, il_type: :xpath, tl: ADDRESS_BOOK_TA, il: ADDRESS_BOOK_IL, check_path: $check_path).click
  end

  def click_wishlist_btn(key = nil)
    find_element(key, il_type: :xpath, tl: WISHLIST_TA, il: WISHLIST_IL, check_path: $check_path).click
  end

  def click_gift_cards_btn(key = nil)
    find_element(key, il_type: :xpath, tl: GIFTCARDS_CREDIT_TA, il: GIFTCARDS_CREDIT_IL, check_path: $check_path).click
  end

  def click_subscribe_email_togler(key = nil)
    find_element(key, il_type: :xpath, tl: SUBSCRIBE_EMAIL_TA, il: SUBSCRIBE_EMAIL_IL, check_path: $check_path).click
  end

  def click_other_newsletter(key = nil)
    find_element(key, il_type: :xpath, tl: NEWSLETTER_REASON_TA, il: NEWSLETTER_REASON_IL, check_path: $check_path).click
  end

  def click_print_catalog_togler(key = nil)
    find_element(key, il_type: :xpath, tl: SUBSCRIBE_PRINT_CATALOG_TA, il: SUBSCRIBE_PRINT_CATALOG_IL, check_path: $check_path).click
  end

  def click_other_catalog(key = nil)
    find_element(key, il_type: :xpath, tl: CATALOG_REASON_TA, il: CATALOG_REASON_IL, check_path: $check_path).click
  end

  def click_save_changes_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SAVE_CHANGES_BTN_TA, il: SAVE_CHANGES_BTN_IL, check_path: $check_path).click
  end

  def click_close_save_changes_modal(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_SAVE_CHANGES_MODAL_TA, il: CLOSE_SAVE_CHANGES_MODAL_IL, check_path: $check_path).click
  end

  def click_view_privacy_policy_btn(key = nil)
    find_element(key, il_type: :xpath, tl: VIEW_PRIVACY_POLICY_TA, il: VIEW_PRIVACY_POLICY_IL, check_path: $check_path).click
  end

  def should_see_privacy_policy_page(key = nil)
    return assert_selector(:xpath, MAIN_TEXT_PRIVACY_POLICY_IL) if key == :il
    assert_selector(:xpath, ta(MAIN_TEXT_PRIVACY_POLICY_TA, MAIN_TEXT_PRIVACY_POLICY_IL))
  end

  def click_delete_account_btn(key = nil)
    find_element(key, il_type: :xpath, tl: DELETE_ACCOUNT_BTN_TA, il: DELETE_ACCOUNT_BTN_IL, check_path: $check_path).click
  end

  def click_cancel_delete_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CANCEL_DELETE_BTN_TA, il: CANCEL_DELETE_BTN_IL, check_path: $check_path).click
  end

  def click_close_delete_modal_icon(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_DELETE_MODAL_ICON_TA, il: CLOSE_DELETE_MODAL_ICON_IL, check_path: $check_path).click
  end

end
