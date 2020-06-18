require 'spec_helper'
require_relative '../page_extension'

class CardSignUpPage < PageExtension

  def fill_email_field(key = nil, value)
    find_element(key, il_type: :css, tl: "card_sign_up_page:email_field",
                 il: "[name='ctl00$Body1$loginemail']", check_path: $check_path).fill_in with: value
  end

  def fill_password_field(key = nil, value)
    find_element(key, il_type: :css, tl: "card_sign_up_page:password_field",
                 il: "[name='ctl00$Body1$loginpassword']", check_path: $check_path).fill_in with: value
  end

  def click_sign_in_button(key = nil)
    find_element(key, il_type: :css, tl: "card_sign_up_page:sign_in_button",
                 il: "[name='ctl00$Body1$loginbutton']", check_path: $check_path).click
  end

end