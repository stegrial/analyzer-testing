require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/24timezones'

it = TimeZones.new

feature 'TA-926 Analyzer returns wrong element in the languages section' do

  # Initial locators with Recording

  scenario 'Recording IL', il_run: true do

    step "User goes to the page", settings('24timezones')['page1'] do |url|
      page.visit url
    end

    step "User clicks on the russian language" do
      it.click_russian_lang
    end

    sleep 3
  end


  scenario 'Searching IL', il_run: true do

    step "User goes to the page", settings('24timezones')['page'] do |url|
      page.visit url
    end

    step "User clicks on the russian language" do
      check_element_path :xpath, TimeZones::RUSSIAN_LANG_TA, TimeZones::RUSSIAN_LANG_IL
      it.click_russian_lang
    end

    sleep 3
  end

  # Element Picker from Repository

  # Recording element
  # 1. Go to the site page: https://24timezones.com/karta-mira
  # 2. Record the element using Picker: "//div/*[text()='ru']"

  scenario 'Searching EP', ep_run: true do

    step "User goes to the page", settings('24timezones')['page'] do |url|
      page.visit url
    end

    step "User clicks on the russian language" do
      check_element_path :xpath, TimeZones::RUSSIAN_LANG_EP, TimeZones::RUSSIAN_LANG_IL
      it.click_russian_lang :ep
    end

    sleep 3
  end

  # Debug

  scenario 'Recording debug', rec_debug: true do

    step "User goes to the page", settings('24timezones')['page1'] do |url|
      page.visit url
    end

    step "User clicks on the russian language" do
      it.click_russian_lang
    end

    sleep 3
  end

  scenario 'Searching debug', search_debug: true do

    step "User goes to the page", settings('24timezones')['page'] do |url|
      page.visit url
    end

    step "User clicks on the russian language" do
      it.click_russian_lang
    end

    sleep 3
  end

end