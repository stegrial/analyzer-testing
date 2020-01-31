require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/thetiebar/*.rb"

login_page = TheTiebarLoginPage.new
rewards_page = TheTiebarRewardsPage.new
header_page = TheTiebarHeader.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  feature 'Loyalty rewards program' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('thetiebar')['loyalty_rewards_program_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        header_page.click_sing_in_btn :il
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |email|
        login_page.fill_username_field  :il,email
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        login_page.fill_login_password :il, pass
      end

      step "User clicks on the Sign In button" do
        login_page.click_sing_in :il
      end

      step "User click the view my rewards button" do
        rewards_page.click_view_my_rewards
      end

      step "User click the learn more link" do
        rewards_page.click_learn_more_link
      end

      step "User click the faq section link" do
        rewards_page.click_faq_section_link
      end


    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('thetiebar')['loyalty_rewards_program_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGNIN_BTN_TA, TheTiebarLoginPage::SIGNIN_BTN_IL
        header_page.click_sing_in_btn :il
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |email|
        check_element_path :xpath, TheTiebarLoginPage::USERNAME_TA, TheTiebarLoginPage::USERNAME_IL
        login_page.fill_username_field  :il,email
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::LOGIN_PASS_TA, TheTiebarLoginPage::LOGIN_PASS_IL
        login_page.fill_login_password :il, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGNIN_BTN_TA, TheTiebarLoginPage::SIGNIN_BTN_IL
        login_page.click_sing_in :il
      end

      step "User click the view my rewards button" do
        check_element_path :xpath, TheTiebarRewardsPage::VIEW_MY_REWARDS_TA, TheTiebarRewardsPage::VIEW_MY_REWARDS_IL
        rewards_page.click_view_my_rewards
      end

      step "User click the learn more link" do
        check_element_path :xpath, TheTiebarRewardsPage::LEARN_MORE_HERE_TA, TheTiebarRewardsPage::LEARN_MORE_HERE_IL
        rewards_page.click_learn_more_link
      end

      step "User click the faq section link" do
        check_element_path :xpath, TheTiebarRewardsPage::FAQ_SECTION_TA, TheTiebarRewardsPage::FAQ_SECTION_IL
        rewards_page.click_faq_section_link
      end
    end

    # Element Picker from Repository
    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('thetiebar')['loyalty_rewards_program_page'] do |url|
        page.visit url
      end

      step "User click the account button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGNIN_BTN_EP, TheTiebarLoginPage::SIGNIN_BTN_IL
        header_page.click_sing_in_btn :ep
      end

      step "User fills the Username field", settings('thetiebar')['email'] do |email|
        check_element_path :xpath, TheTiebarLoginPage::USERNAME_EP, TheTiebarLoginPage::USERNAME_IL
        login_page.fill_username_field  :ep, email
      end

      step "User fills the Password field", settings('thetiebar')['password'] do |pass|
        check_element_path :xpath, TheTiebarLoginPage::LOGIN_PASS_EP, TheTiebarLoginPage::LOGIN_PASS_IL
        login_page.fill_login_password :ep, pass
      end

      step "User clicks on the Sign In button" do
        check_element_path :xpath, TheTiebarLoginPage::SIGNIN_BTN_EP, TheTiebarLoginPage::SIGNIN_BTN_IL
        login_page.click_sing_in :ep
      end

      step "User click the view my rewards button" do
        check_element_path :xpath, TheTiebarRewardsPage::VIEW_MY_REWARDS_EP, TheTiebarRewardsPage::VIEW_MY_REWARDS_IL
        rewards_page.click_view_my_rewards :ep
      end

      step "User click the learn more link" do
        check_element_path :xpath, TheTiebarRewardsPage::LEARN_MORE_HERE_EP, TheTiebarRewardsPage::LEARN_MORE_HERE_IL
        rewards_page.click_learn_more_link :ep
      end

      step "User click the faq section link" do
        check_element_path :xpath, TheTiebarRewardsPage::FAQ_SECTION_EP, TheTiebarRewardsPage::FAQ_SECTION_IL
        rewards_page.click_faq_section_link :ep
      end
    end
  end
end