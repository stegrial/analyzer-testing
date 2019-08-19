require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/revolve'

it = Revolve.new


describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'Select filters ' do

    scenario 'Recording IL', il_run: true do

      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on NEW link in top navigation menu" do
        it.click_new_in_top_navmenu
      end

      step "User clicks on filter button" do
       sleep 3
        it.click_filter_btn
      end
      step "User clicks on filter button" do
        it.click_to_expand_price_list
      end

      step "User select prise checkbox" do
        it.checkbox_for_price
      end

      step "User clicks on results button" do
        it.click_view_results_btn
        sleep 3
      end
    end

    scenario 'Searching IL', il_run: true do

      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on NEW link in top navigation menu" do
        check_element_path :xpath, Revolve::NEW_NAVMENU_TA, Revolve::NEW_NAVMENU_IL
        it.click_new_in_top_navmenu :il
      end

      step "User clicks on filter button" do
        check_element_path :xpath, Revolve::FILTER_BTN_TA, Revolve::FILTER_BTN_IL
        it.click_filter_btn :il
      end
      step "User clicks on filter button" do
        check_element_path :xpath, Revolve::PRICE_TA, Revolve::PRICE_IL
        it.click_to_expand_price_list :il
      end

      step "User select designer checkbox" do
        check_element_path :xpath, Revolve::CHECKBOX_FOR_PRICE_TA, Revolve::CHECKBOX_FOR_PRICE_IL
        it.checkbox_for_price :il
      end

      step "User clicks on results button" do
        check_element_path :xpath, Revolve::VIEW_RESULTS_BTN_TA, Revolve::VIEW_RESULTS_BTN_IL
        it.click_view_results_btn
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on NEW link in top navigation menu" do
        check_element_path :xpath, Revolve::NEW_NAVMENU_EP, Revolve::NEW_NAVMENU_IL
        it.click_new_in_top_navmenu :ep
      end

      step "User clicks on filter button" do
        check_element_path :xpath, Revolve::FILTER_BTN_EP, Revolve::FILTER_BTN_IL
        it.click_filter_btn :ep
      end
      step "User clicks on filter button" do
        check_element_path :xpath, Revolve::PRICE_EP, Revolve::PRICE_IL
        it.click_to_expand_price_list :ep
      end

      step "User select designer checkbox" do
        check_element_path :xpath, Revolve::CHECKBOX_FOR_PRICE_EP, Revolve::CHECKBOX_FOR_PRICE_IL
        it.checkbox_for_price :ep
      end

      step "User clicks on results button" do
        check_element_path :xpath, Revolve::VIEW_RESULTS_BTN_EP, Revolve::VIEW_RESULTS_BTN_IL
        it.click_view_results_btn :ep
      end
    end
  end
end
