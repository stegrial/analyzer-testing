require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/revolve'

it = Revolve.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Select categories and product' do

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on NEW link in top navigation menu" do
        it.click_search_btn
      end

      step "User clicks on sort button", "dress" do |data|
        it.set_search_data(data)
      end

      step "User clicks to select sorting" do
        sleep 5
        it.click_second_search_result

      end
    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on categories link in top navigation menu" do
        check_element_path :xpath, Revolve::SEARCH_BTN_TA, Revolve::SEARCH_BTN_IL
        it.click_search_btn
      end

      step "User clicks on dresses categories button", "dress" do |data|
        check_element_path :xpath, Revolve::DATA_INPUT_TA, Revolve::DATA_INPUT_IL
        it.set_search_data(data)
      end

      step "User clicks on product item 4" do
        check_element_path :xpath, Revolve::SEARCH_RESULT_TA, Revolve::SEARCH_RESULT_IL
        it.click_second_search_result
      end

    end

    # Element Picker from Repository
    # # # # #  NOT ADDED

    scenario 'Searching EP', ep_run: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on categories link in top navigation menu" do
        check_element_path :xpath, Revolve::NEW_NAVMENU_EP, Revolve::NEW_NAVMENU_IL
        it.click_new_in_top_navmenu :ep
      end

      step "User clicks on dresses categories button" do
        check_element_path :xpath, Revolve::SORT_BTN_EP, Revolve::SORT_BTN_IL
        it.click_sort_by :ep
      end

      step "User clicks on product item 4" do
        check_element_path :xpath, Revolve::SORT_BY_PRICE_EP, Revolve::SORT_BY_PRICE_IL
        it.click_sort_by_price :ep
      end

      step "Checking sorting" do
        it.check_sorting
      end

    end
  end
end
