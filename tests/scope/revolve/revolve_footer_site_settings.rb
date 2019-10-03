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

  feature 'Select categories and product' do

    scenario 'Recording IL', il: true do

      step "User goes to the page", settings('revolve')['page'] do |url|
        page.visit url
      end

      step "User clicks on categories link in top navigation menu" do
        sleep 5
        it.click_language
      end

      step "User clicks on dresses categories button" do
       sleep 5
        it.click_italiano_language
      end


      sleep 5
    end

    scenario 'Searching IL', il: true do

      step "User goes to the page" do
        visit 'https://revolve-pwa.moovweb.cloud/mobile/s?s=c&c=Clothing&sc=&d=Womens&fw=false'
      end

      step "User clicks on categories link in top navigation menu" do
        check_element_path :xpath, Revolve::LANGUAGE_DROPDOWN_TA, Revolve::LANGUAGE_DROPDOWN_IL
        it.click_language
        sleep 3
      end

      step "User clicks on dresses categories button" do
        check_element_path :xpath, Revolve::ITALIANO_LG_TA, Revolve::ITALIANO_LG_IL
        it.click_italiano_language
      end
      sleep 3

    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page" do
        visit 'https://revolve-pwa.moovweb.cloud/mobile/s?s=c&c=Clothing&sc=&d=Womens&fw=false'
      end

      step "User clicks on categories link in top navigation menu" do
        check_element_path :xpath, Revolve::LANGUAGE_DROPDOWN_EP, Revolve::LANGUAGE_DROPDOWN_IL
        it.click_language :ep
        sleep 3
      end

      step "User clicks on dresses categories button" do
        check_element_path :xpath, Revolve::ITALIANO_LG_EP, Revolve::ITALIANO_LG_IL
        it.click_italiano_language :ep
      end
      sleep 3
    end
  end
end
