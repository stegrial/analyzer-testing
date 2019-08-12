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

  feature 'TA-699 Revolve / MOOVWEB BUG/ redirect from hot list on logo page is going on wrong link / Clicking by the hot list banner on the main page' do

    # Initial locators with Recording

    scenario 'Recording IL', il_run: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end
      sleep 5
      step "User clicks on the hot list  banner" do
        it.click_hot_list_banner
      end

      step "User clicks on the Revolve logo" do
        it.click_revolve_logo
      end

    end

    scenario 'Searching IL', il_run: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

        step "User clicks on the hot list  banner" do
          check_element_path :xpath, Revolve::HOT_LIST_BANNER_TA, Revolve::HOT_LIST_BANNER_IL
          it.click_hot_list_banner
        end

        step "User clicks on the Revolve logo" do
          check_element_path :xpath, Revolve::REVOLVE_LOGO_TA, Revolve::REVOLVE_LOGO_IL
          it.click_revolve_logo
        end

      sleep 3
    end
    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on the hot list  banner" do
        check_element_path :xpath, Revolve::HOT_LIST_BANNER_EP, Revolve::HOT_LIST_BANNER_IL
        it.click_hot_list_banner :ep
      end

      step "User clicks on the Revolve logo" do
        check_element_path :xpath, Revolve::REVOLVE_LOGO_EP, Revolve::REVOLVE_LOGO_IL
        it.click_revolve_logo :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Recording debug', rec_debug: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on the hot list  banner" do
        it.click_hot_list_banner :il
      end

      step "User clicks on the Revolve logo" do
        it.click_revolve_logo
      end

      sleep 3
    end

    scenario 'Searching debug', search_debug: true do
      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on the hot list  banner" do
        it.click_hot_list_banner :il
      end

      step "User clicks on the Revolve logo" do
        it.click_revolve_logo
      end

      sleep 3
    end


  end
end
