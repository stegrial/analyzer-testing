require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = HomePage.new
banner_page = BannerPage.new
footer_page = FooterPage.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Subscribe to news via email' do

    # Initial locators with Recording

    scenario 'Recording IL', record: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url
      end

      step "Close banners" do
        banner_page.close_banner
        banner_page.close_cupon_banner
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        footer_page.fill_email_subscription_name(email)
      end

      step "User clicks Submit button" do
        footer_page.click_email_subscription_btn
      end

      sleep 3
    end

    scenario 'Searching IL', search: true do
      step "User goes to the page", settings('annieselke')['page'] do |url|
        home_page.visit url

      end
      step "Close banners" do
        banner_page.close_banner
        banner_page.close_cupon_banner
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        check_element_path :xpath, FooterPage::EMAIL_SUBSCRIPTION_TA, FooterPage::EMAIL_SUBSCRIPTION_IL
        footer_page.fill_email_subscription_name(email)
      end

      step "User clicks Submit button" do
        check_element_path :xpath, FooterPage::EMAIL_SUBSCRIPTION_BTN_TA, FooterPage::EMAIL_SUBSCRIPTION_BTN_IL
        footer_page.click_email_subscription_btn
      end

      sleep 3
    end
  end
end
