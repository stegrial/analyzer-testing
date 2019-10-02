require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/pinterest'

it = Pinterest.new

describe 'Preconditions' do
  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Pinterest - select new subscription' do

  # Initial locators with Recording

    scenario 'Recording IL', il: true do

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

      step "User clicks on subscriptions" do
        it.click_subscriptions
      end

      step "User clicks to look recomendations" do
        it.click_to_find_recomendations
      end

      step "User clicks to look more" do
        it.click_to_look_more
      end

      step "User clicks to look tattoo category" do
        it.click_to_look_tattoo
      end

      step "User clicks to select category" do
        it.click_to_select_category
      end
    end

    scenario 'Searching IL', il: true do

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
      step "User clicks on subscriptions" do
        sleep 3
        check_element_path :xpath, Pinterest::SUBSCRIOTIONS_TA, Pinterest::SUBSCRIOTIONS_IL
        it.click_subscriptions
      end

      step "User clicks to look recomendations" do
        check_element_path :xpath, Pinterest::FIND_RECOMENDATION_TA, Pinterest::FIND_RECOMENDATION_IL
        it.click_to_find_recomendations
      end

      step "User clicks to look more" do
        check_element_path :xpath, Pinterest::MORE_DROPDOWN_TA, Pinterest::MORE_DROPDOWN_IL
        it.click_to_look_more
      end

      step "User clicks to look tattoo category" do
        check_element_path :xpath, Pinterest::TATTOO_TA, Pinterest::TATTOO_IL
        it.click_to_look_tattoo
      end

      step "User clicks to select category" do
        check_element_path :xpath, Pinterest::FOURTH_CATEGORY_TA, Pinterest::FOURTH_CATEGORY_IL
        it.click_to_select_category
      end

    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('pinterest')['page'] do |url|
        page.visit url
      end

      step "User set email", settings('pinterest')['email'] do  |email|
        check_element_path :xpath, Pinterest::EMAIL_EP, Pinterest::EMAIL_IL
        it.set_email(:ep,email)
      end

      step "User set password",  settings('pinterest')['password'] do  |pass|
        check_element_path :xpath, Pinterest::PASSWORD_EP, Pinterest::PASSWORD_IL
        it.set_password(:ep,pass)
      end

      step "User clicks on OK button"  do
        check_element_path :xpath, Pinterest::OK_BTN_EP, Pinterest::OK_BTN_IL
        it.click_ok_btn :ep
      end
      step "User clicks on subscriptions" do
        sleep 3
        check_element_path :xpath, Pinterest::SUBSCRIOTIONS_EP, Pinterest::SUBSCRIOTIONS_IL
        it.click_subscriptions :ep
      end

      step "User clicks to look recomendations" do
        check_element_path :xpath, Pinterest::FIND_RECOMENDATION_EP, Pinterest::FIND_RECOMENDATION_IL
        it.click_to_find_recomendations  :ep
      end

      step "User clicks to look more" do
        check_element_path :xpath, Pinterest::MORE_DROPDOWN_EP, Pinterest::MORE_DROPDOWN_IL
        it.click_to_look_more :ep
      end

      step "User clicks to look tattoo category" do
        check_element_path :xpath, Pinterest::TATTOO_EP, Pinterest::TATTOO_IL
        it.click_to_look_tattoo :ep
      end

      step "User clicks to select category" do
        check_element_path :xpath, Pinterest::FOURTH_CATEGORY_EP, Pinterest::FOURTH_CATEGORY_IL
        it.click_to_select_category :ep
      end
    end
  end
end
