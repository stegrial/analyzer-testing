require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/olx'

it = Olx.new
describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'OLX - search results' do

  # Initial locators with Recording

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('olx')['page'] do |url|
        page.visit url
      end

      step "User clicks on my account button" do
        it.click_my_acc_btn
      end

      step "User clicks on registration tab" do
        it.click_register_tab
      end

      step "User clicks twice to go back on previous page" do
        page.driver.go_back
        page.driver.go_back
      end

      step "User set search query for searching", "iphone\n" do |searchTExt|
        it.set_search_input(searchTExt)
      end

      step "User clicks X for clear search input" do
        it.click_to_clear_search
      end

      step "User clicks to select search result" do
        sleep 5
        it.click_to_select_some_result
      end
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page", settings('olx')['page'] do |url|
        page.visit url
      end

      step "User clicks on my account button" do
        check_element_path :xpath, Olx::MY_ACCOUNT_TA, Olx::MY_ACCOUNT_IL
        it.click_my_acc_btn
      end

      step "User clicks on registration tab" do
        check_element_path :css, Olx::REGISTER_TAB_TA, Olx::REGISTER_TAB_IL
        it.click_register_tab
      end

      step "User clicks on animal category button" do
        page.driver.go_back
        page.driver.go_back
      end

      step "User set search query for searching", "iphone\n" do |searchTExt|
        check_element_path :css, Olx::SEARCH_INPUT_TA, Olx::SEARCH_INPUT_IL
        it.set_search_input(searchTExt)
      end

      step "User clicks X for clear search input" do
        check_element_path :xpath, Olx::CLEAR_SEARCH_BTN_TA, Olx::CLEAR_SEARCH_BTN_IL
        it.click_to_clear_search
      end

      step "User clicks to select search result" do
        check_element_path :xpath, Olx::EXAMPLE_RESULT_TA, Olx::EXAMPLE_RESULT_IL
        it.click_to_select_some_result
      end
    end

  # Element Picker from Repository

    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('olx')['page'] do |url|
        page.visit url
      end

      step "User clicks on my account button" do
        check_element_path :xpath, Olx::MY_ACCOUNT_EP, Olx::MY_ACCOUNT_IL
        it.click_my_acc_btn :ep
      end

      step "User clicks on registration tab" do
        check_element_path :css, Olx::REGISTER_TAB_EP, Olx::REGISTER_TAB_IL
        it.click_register_tab :ep
      end

      step "User clicks on animal category button" do
        page.driver.go_back
        page.driver.go_back
      end

      step "User set search query for searching", "iphone\n" do |searchTExt|
        check_element_path :css, Olx::SEARCH_INPUT_EP, Olx::SEARCH_INPUT_IL
        it.set_search_input(:ep, searchTExt)
      end

      step "User clicks X for clear search input" do
        check_element_path :xpath, Olx::CLEAR_SEARCH_BTN_EP, Olx::CLEAR_SEARCH_BTN_IL
        it.click_to_clear_search :ep
      end

      step "User clicks to select search result" do
        check_element_path :xpath, Olx::EXAMPLE_RESULT_EP, Olx::EXAMPLE_RESULT_IL
        it.click_to_select_some_result :ep
      end
    end
  end
end