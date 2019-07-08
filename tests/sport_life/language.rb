require 'spec_helper'
require_relative '../../pages/sport_life.rb'
require_relative '../../helpers/special_methods'

include PathCheck
include SportLife

feature 'TA-908 Analyzer returns not found element in the languages section' do

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do

    step "User goes to the page", settings('sportlife')['page'] do |url|
      page.visit url
    end

    step "User clicks on the ukraine language" do
      check_element_path @ukraine_lang_ep, @ukraine_lang_il
      click_ukraine_lang :ep
    end

    step "User clicks on the russian language" do
      check_element_path @russian_lang_ep, @russian_lang_il
      click_russian_lang :ep
    end

    sleep 3
  end

  # Debug

  scenario 'Searching debug', search_debug: true do

    step "User goes to the page", settings('sportlife')['page'] do |url|
      page.visit url
    end

    step "User clicks on the ukraine language" do
      click_ukraine_lang :il
    end

    step "User clicks on the russian language" do
      click_russian_lang :ep
    end

    sleep 3
  end

end