require 'spec_helper'
require_relative '../../pages/sport_life.rb'
require_relative '../../helpers/special_methods'

include SportLife

feature 'Analyzer returns not found element in the languages section' do

  # Element Picker from Repository

  scenario 'Searching EP', ep_run: true do

    step "User goes to the page", settings('sportlife')['page'] do |url|
      page.visit url
    end

    step "User clicks on the ukraine language" do
      ep_click_ukraine_lang
    end

    step "User clicks on the russian language" do
      ep_click_russian_lang
    end

    sleep 3
  end

  # Debug

  scenario 'Searching debug', search_debug: true do

    step "User goes to the page", settings('sportlife')['page'] do |url|
      page.visit url
    end

    step "User clicks on the ukraine language" do
      click_ukraine_lang_il
    end

    step "User clicks on the russian language" do
      ep_click_russian_lang
    end

    sleep 3
  end

end