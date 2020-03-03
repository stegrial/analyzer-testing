require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/sport_life'

include ElementSearchValidation

it = SportLife.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  after(:all) do
    Capybara.current_session.driver.quit
  end

  feature 'AT-44, Analyzer returns not found element in the languages section' do

    # Element Picker from Repository

    scenario 'Searching EP', ep_run: true do

      step "User goes to the page", settings('sportlife')['page'] do |url|
        page.visit url
      end

      step "User clicks on the ukraine language" do
        check_element_path :xpath, SportLife::UKRAINE_LANG_EP, SportLife::UKRAINE_LANG_IL
        it.click_ukraine_lang :ep
      end

      step "User clicks on the russian language" do
        check_element_path :xpath, SportLife::RUSSIAN_LANG_EP, SportLife::RUSSIAN_LANG_IL
        it.click_russian_lang :ep
      end

      sleep 3
    end

    # Debug

    scenario 'Searching debug', search_debug: true do

      step "User goes to the page", settings('sportlife')['page'] do |url|
        page.visit url
      end

      step "User clicks on the ukraine language" do
        it.click_ukraine_lang :il
      end


      step "User clicks on the russian language" do
        it.click_russian_lang :ep
      end

      sleep 3
    end
end
end