require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/youtube.rb'

include ElementSearchValidation

youtube = Youtube.new

describe 'Preconditions' do


  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  feature 'Youtube - open trending movies' do

    scenario 'Recording IL', record: true do

      step "User goes to the page", settings('youtube')['page'] do |url|
        page.visit url
      end

      step "User clicks on settings" do
        youtube.click_setting_menu
      end

      step "User changes theme to the dark" do
      	youtube.click_theme_menu
        youtube.change_theme
        youtube.click_back_button_in_settings
      end

      step "User changes language" do
        youtube.click_language_menu
        youtube.select_deutsch
      end

      step "User with new setting search video", "bogiem rhapsody" do |data|
      	youtube.set_data_in_search(data)
      	youtube.click_search_btn
      	youtube.click_on_video_from_search_result
      end

    end  	

    scenario 'Searching IL', search: true do

      step "User goes to the page", settings('youtube')['page'] do |url|
        page.visit url
      end

      step "User clicks on settings" do
      	check_element_path :xpath, Youtube::SETTINGS_MENU_BUTTON_TA, Youtube::SETTINGS_MENU_BUTTON_IL
        youtube.click_setting_menu
      end

      step "User changes theme to the dark" do
      	check_element_path :xpath, Youtube::DARK_THEME_MENU_TA, Youtube::DARK_THEME_MENU_IL
      	youtube.click_theme_menu
      	check_element_path :xpath, Youtube::DARK_THEME_BUTTON_TA, Youtube::DARK_THEME_BUTTON_IL
        youtube.change_theme
        check_element_path :xpath, Youtube::MENU_BACK_ARROW_TA, Youtube::MENU_BACK_ARROW_IL
        youtube.click_back_button_in_settings
      end

      step "User changes language" do
      	check_element_path :xpath, Youtube::LANGUAGE_MENU_TA, Youtube::LANGUAGE_MENU_IL
        youtube.click_language_menu
      	check_element_path :xpath, Youtube::DEUTSCH_BUTTON_TA, Youtube::DEUTSCH_BUTTON_IL
        youtube.select_deutsch
      end

      step "User with new setting search video", "bogiem rhapsody" do |data|
      	check_element_path :xpath, Youtube::YOUTUBE_SEARCH_TA, Youtube::YOUTUBE_SEARCH_IL
      	youtube.set_data_in_search(data)
      	check_element_path :xpath, Youtube::YOUTUBE_BUTTON_SEARCH_TA, Youtube::YOUTUBE_BUTTON_SEARCH_IL
      	youtube.click_search_btn
      	check_element_path :xpath, Youtube::VIDEO_FROM_SEARCH_TA, Youtube::VIDEO_FROM_SEARCH_IL
      	youtube.click_on_video_from_search_result
      end
    end  

  end
end