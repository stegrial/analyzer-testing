require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/revolve'

include ElementSearchValidation

it = Revolve.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'TA-688 / MOOVWEB BUG / Revolve - Account button' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on hamburger menu button" do
        it.click_hamburger_menu
      end

      step "User clicks on the Account button" do
        sleep 3
        it.click_account_button :il
      end

      step "User fills the Email field", settings('revolve')['email'] do |email|
        it.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('revolve')['pass'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on hamburger menu button" do
        sleep 3
        it.click_hamburger_menu
      end

      step "User clicks on the Account button" do
        sleep 3
        it.click_account_button
      end

      sleep 3
    end

    scenario 'Searching IL', il_run: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      2.times do

        step "User clicks on hamburger menu button" do
          it.click_hamburger_menu
        end

        step "User clicks on the Account button two times (for different pages)" do
          check_element_path :xpath, Revolve::ACCOUNT_BUTTON_TA, Revolve::ACCOUNT_BUTTON_IL
          it.click_account_button
        end
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do
      step "User goes to the page", settings('revolve')['home_page'] do |url|
        page.visit url
      end



      2.times do
        step "User clicks on hamburger menu button" do
          it.click_hamburger_menu
        end

        step "User clicks on the Account button two times (for different pages)" do
          check_element_path :xpath, Revolve::ACCOUNT_BUTTON_EP, Revolve::ACCOUNT_BUTTON_IL
          it.click_account_button :ep
        end
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on hamburger menu button" do
        it.click_hamburger_menu
      end

      step "User clicks on the Account button" do
        it.click_account_button :il
      end

      step "User fills the Email field", settings('revolve')['email'] do |email|
        it.fill_email_field :il, email
      end

      step "User fills the Pass field", settings('revolve')['pass'] do |pass|
        it.fill_pass_field :il, pass
      end

      step "User clicks on the Sign In button" do
        it.click_sign_in_button :il
      end

      step "User clicks on the Account button" do
        it.click_account_button
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      1.times do

        step "User clicks on hamburger menu button" do
          it.click_hamburger_menu :il
        end

        step "User clicks on the Account button" do
          it.click_account_button
        end
      end

      sleep 3
    end
  end
end
