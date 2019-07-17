require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
require_relative '../../../pages/24timezones'

it = TimeZones.new

feature 'TA-926 Analyzer returns wrong element in the languages section' do

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do

    step "User goes to the page", settings('24timezones')['page'] do |url|
      page.visit url
    end

    step "User clicks on the english language" do
      check_element_path :xpath, TimeZones::ENGLISH_LANG_EP, TimeZones::ENGLISH_LANG_IL
      it.click_english_lang :ep
    end

    step "User clicks on the russian language" do
      check_element_path :xpath, TimeZones::RUSSIAN_LANG_EP, TimeZones::RUSSIAN_LANG_IL
      it.click_russian_lang :ep
    end

    sleep 3
  end

  # Debug

  scenario 'Searching debug', search_debug: true do

    step "User goes to the page", settings('24timezones')['page'] do |url|
      page.visit url
    end

    step "User clicks on the english language" do
      it.click_english_lang :il
    end

    step "User clicks on the russian language" do
      it.click_russian_lang :ep
    end

    sleep 3
  end

end