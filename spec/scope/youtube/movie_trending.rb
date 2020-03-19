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

      step "User clicks on trending" do
        youtube.click_trending
      end

      step "User clicks on movies section " do
        youtube.click_on_movie_button
      end

      step "User clicks on first trailer" do
        youtube.click_on_movie_from_search_result
      end
    end  	

    scenario 'Searching IL', search: true do

      step "User goes to the page", settings('youtube')['page'] do |url|
        page.visit url
      end

      step "User clicks on trending" do
        check_element_path :xpath, Youtube::TRENDING_LINK_TA, Youtube::TRENDING_LINK_IL
        youtube.click_trending
      end

      step "User clicks on movies section " do
        check_element_path :xpath, Youtube::MOVIE_BUTTON_TA, Youtube::MOVIE_BUTTON_IL
        youtube.click_on_movie_button
      end

      step "User clicks on first trailer" do
        check_element_path :xpath, Youtube::VIDEO_FROM_SEARCH_2_TA, Youtube::VIDEO_FROM_SEARCH_2_IL
        youtube.click_on_movie_from_search_result
      end
    end  

  end
end