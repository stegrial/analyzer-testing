require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/pinterest'

it = Pinterest.new

describe 'Preconditions' do


  feature 'Pinterest - open pin' do

  # Initial locators with Recording

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('pinterest')['page'] do |url|
        page.visit url
      end

      step "User set email", settings('pinterest')['email'] do  |email|
        it.set_email(email)
      end

      step "User set password",  settings('pinterest')['password'] do  |pass|
        it.set_password(pass)
      end

      step "User clicks on OK button"  do
        it.click_ok_btn
      end

      step "User clicks on pin" do
        it.click_to_open_pin
      end

    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('pinterest')['page'] do |url|
        page.visit url
      end

      step "User set email", settings('pinterest')['email'] do  |email|
        check_element_path :xpath, Pinterest::EMAIL_TA, Pinterest::EMAIL_IL
        it.set_email(email)
      end

      step "User set password",  settings('pinterest')['password'] do  |pass|
        check_element_path :xpath, Pinterest::PASSWORD_TA, Pinterest::PASSWORD_IL
        it.set_password(pass)
      end

      step "User clicks on OK button"  do
        check_element_path :xpath, Pinterest::OK_BTN_TA, Pinterest::OK_BTN_IL
        it.click_ok_btn
      end

      step "User clicks on pin" do
        check_element_path :xpath, Pinterest::SOME_PIN_TA, Pinterest::SOME_PIN_IL
        it.click_to_open_pin
      end

    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('pinterest')['page'] do |url|
        page.visit url
      end

      step "User set email", settings('pinterest')['email'] do  |email|
        check_element_path :xpath, Pinterest::EMAIL_EP, Pinterest::EMAIL_IL
        it.set_email(email)
      end

      step "User set password",  settings('pinterest')['password'] do  |pass|
        check_element_path :xpath, Pinterest::PASSWORD_EP, Pinterest::PASSWORD_IL
        it.set_password(pass)
      end

      step "User clicks on OK button"  do
        check_element_path :xpath, Pinterest::OK_BTN_EP, Pinterest::OK_BTN_IL
        it.click_ok_btn
      end

      step "User clicks on pin" do
        check_element_path :xpath, Pinterest::SOME_PIN_EP, Pinterest::SOME_PIN_IL
        it.click_to_open_pin
      end
    end
  end
end
