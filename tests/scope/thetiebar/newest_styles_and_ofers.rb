require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

main_page = TheTiebarMainPage.new
header_page = TheTiebarHeader.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Newest styles and offers' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks terms to use link" do
        main_page.click_terms_to_use
      end

      step "User clicks for redirecting on main pag" do
        header_page.click_logo
      end

      step "User clicks terms to use link" do
        main_page.click_privacy_police
      end

      step "User clicks for redirecting on main page" do
        header_page.click_logo
      end

      step "User fills search query field", "testtest@test.com" do |email|
        main_page.fill_singup_field email
      end

      step "User click join button" do
        main_page.click_join_btn
      end

      step "User check congrats text" do
        main_page.check_congrats_text
      end

    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks terms to use link" do
        check_element_path :xpath, TheTiebarMainPage::TERMS_TO_USE_LINK_TA, TheTiebarMainPage::TERMS_TO_USE_LINK_IL
        main_page.click_terms_to_use
      end

      step "User clicks for redirecting on main pag" do
        check_element_path :xpath, TheTiebarHeader::LOGO_TA, TheTiebarHeader::LOGO_IL
        header_page.click_logo
      end

      step "User clicks terms to use link" do
        check_element_path :xpath, TheTiebarMainPage::PRIVACY_POLICE_LINK_TA, TheTiebarMainPage::PRIVACY_POLICE_LINK_IL
        main_page.click_privacy_police
      end

      step "User clicks for redirecting on main page" do
        check_element_path :xpath, TheTiebarHeader::LOGO_TA, TheTiebarHeader::LOGO_IL
        header_page.click_logo
      end

      step "User fills search query field", "testtest@test.com" do |email|
        check_element_path :xpath, TheTiebarMainPage::SING_UP_INPUT_TA, TheTiebarMainPage::SING_UP_INPUT_IL
        main_page.fill_singup_field email
      end

      step "User click join button" do
        check_element_path :xpath, TheTiebarMainPage::JOIN_BTN_TA, TheTiebarMainPage::JOIN_BTN_IL
        main_page.click_join_btn
      end

      step "User check congrats text" do
        check_element_path :xpath, TheTiebarMainPage::CLOSE_CONGRAT_MODAL_TA, TheTiebarMainPage::CONGRATS_TEXT_IL
        main_page.check_congrats_text
      end
    end

    # Element Picker

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['main_page'] do |url|
        page.visit url
      end

      step "User clicks terms to use link" do
        check_element_path :xpath, TheTiebarMainPage::TERMS_TO_USE_LINK_EP, TheTiebarMainPage::TERMS_TO_USE_LINK_IL
        main_page.click_terms_to_use :ep
      end

      step "User clicks for redirecting on main pag" do
        check_element_path :xpath, TheTiebarHeader::LOGO_EP, TheTiebarHeader::LOGO_IL
        header_page.click_logo :ep
      end

      step "User clicks terms to use link" do
        check_element_path :xpath, TheTiebarMainPage::PRIVACY_POLICE_LINK_EP, TheTiebarMainPage::PRIVACY_POLICE_LINK_IL
        main_page.click_privacy_police :ep
      end

      step "User clicks for redirecting on main page" do
        check_element_path :xpath, TheTiebarHeader::LOGO_EP, TheTiebarHeader::LOGO_IL
        header_page.click_logo :ep
      end

      step "User fills search query field", "testtest@test.com" do |email|
        check_element_path :xpath, TheTiebarMainPage::SING_UP_INPUT_EP, TheTiebarMainPage::SING_UP_INPUT_IL
        main_page.fill_singup_field :ep, email
      end

      step "User click join button" do
        check_element_path :xpath, TheTiebarMainPage::JOIN_BTN_EP, TheTiebarMainPage::JOIN_BTN_IL
        main_page.click_join_btn :ep
      end

      step "User check congrats text" do
        check_element_path :xpath, TheTiebarMainPage::CLOSE_CONGRAT_MODAL_EP, TheTiebarMainPage::CONGRATS_TEXT_IL
        main_page.check_congrats_text :ep
      end
    end
  end
end
