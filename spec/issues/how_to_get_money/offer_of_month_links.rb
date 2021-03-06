require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/how_to_get_money'

include ElementSearchValidation

it = HowToGetMoney.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'AT-54 Analyzer returns the wrong element (link) in the Offer of month section' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('how_to_get_money')['page'] do |url|
        page.visit url
      end

      step "User clicks on the link - First loan" do
        it.click_first_loan_link
      end
      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User resizes browser window to maximum" do
        Capybara.current_session.driver.browser.manage.window.maximize
      end

      step "User goes to the page", settings('how_to_get_money')['page'] do |url|
        page.visit url
      end

      step "User clicks on the link - First loan" do
        check_element_path :xpath, HowToGetMoney::FIRST_LOAN_TA, HowToGetMoney::FIRST_LOAN_IL
        it.click_first_loan_link
      end
      sleep 3
    end

  # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User resizes browser window to maximum" do
        Capybara.current_session.driver.browser.manage.window.maximize
      end

      step "User goes to the page", settings('how_to_get_money')['page'] do |url|
        page.visit url
      end

      step "User clicks on the link - First loan" do
        check_element_path :xpath, HowToGetMoney::FIRST_LOAN_EP, HowToGetMoney::FIRST_LOAN_IL
        it.click_first_loan_link :ep
      end
      sleep 3
    end

  # Debug

    scenario 'Recording debug', rec_debug: true do
      step "User goes to the page", settings('how_to_get_money')['page'] do |url|
        page.visit url
      end

      step "User clicks on the link - First loan" do
        it.click_first_loan_link
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User resizes browser window to maximum" do
        Capybara.current_session.driver.browser.manage.window.maximize
      end

      step "User goes to the page", settings('how_to_get_money')['page'] do |url|
        page.visit url
      end

      step "User clicks on the link - First loan" do
        it.click_first_loan_link
      end
      sleep 3
    end
  end
end
