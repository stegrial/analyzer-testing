require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/annieselke/*.rb"

include ElementSearchValidation

home_page = Home_Page.new

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
        home_page.close_banner
      end

      step "User fills email", settings('annieselke')['email'] do |email|
        home_page.close_cupon_banner
        home_page.fill_email_subscription_name(email)
      end

      step "User clicks Submit button" do
        home_page.click_email_subscription_btn
      end
    end

    # scenario 'Searching IL', search: true do
    #   step "User goes to the page", settings('annieselke')['page'] do |url|
    #     home_page.visit url
    #     home_page.close_banner
    #   end
    #
    #   step "User fills email", settings('annieselke')['email'] do |email|
    #     home_page.close_cupon_banner
    #     check_element_path :xpath, Home_Page::EMAIL_SUBSCRIPTION_TA, Home_Page::EMAIL_SUBSCRIPTION_IL
    #     home_page.fill_email_name(email)
    #   end
    #   step "User clicks Submit button" do
    #     check_element_path :xpath, Home_Page::EMAIL_SUBSCRIPTION_BTN_TA, Home_Page::EMAIL_SUBSCRIPTION_BTN_IL
    #     home_page.click_email_subscription_btn
    #   end
    # end
  end
end