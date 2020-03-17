require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
require_relative '../../../pages/youtube.rb'

include ElementSearchValidation

it = Youtube.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
  end

  feature 'Youtube - search video' do

    scenario 'Recording IL', record: true do

      step "User goes to the page", settings('youtube')['page'] do |url|
        page.visit url
      end

      step "User inputs into the search ", "bogiem rhapsody" do |data|
        it.set_data_in_search(data)
      end

      step "User clicks on search button " do
        it.click_search_btn
      end

      step "User clicks on the desired search result" do
        it.click_on_video_from_search_result
      end
    end  	

    scenario 'Searching IL', search: true do

      step "User goes to the page", settings('youtube')['page'] do |url|
        page.visit url
      end

      step "User inputs into the search ", "bogiem rhapsody" do |data|
      	check_element_path :xpath, Youtube::YOUTUBE_SEARCH_TA, Youtube::YOUTUBE_SEARCH_IL
        it.set_data_in_search(data)
      end

      step "User clicks on search button " do
        check_element_path :xpath, Youtube::YOUTUBE_BUTTON_SEARCH_TA, Youtube::YOUTUBE_BUTTON_SEARCH_IL
        it.click_search_btn
      end

      step "User clicks on the desired search result" do
      	check_element_path :xpath, Youtube::VIDEO_FROM_SEARCH_TA, Youtube::VIDEO_FROM_SEARCH_IL
        it.click_on_video_from_search_result
      end
    end  


    scenario 'Searching EP', ep: true do

      step "User goes to the page", settings('youtube')['page'] do |url|
        page.visit url
      end

      step "User inputs into the search ", "bogiem rhapsody" do |data|
      	check_element_path :xpath, Youtube::YOUTUBE_SEARCH_EP, Youtube::YOUTUBE_SEARCH_IL
        it.set_data_in_search(:ep, data)
      end

      step "User clicks on search button " do
        check_element_path :xpath, Youtube::YOUTUBE_BUTTON_SEARCH_EP, Youtube::YOUTUBE_BUTTON_SEARCH_IL
        it.click_search_btn :ep
      end

      step "User clicks on the desired search result" do
      	check_element_path :xpath, Youtube::VIDEO_FROM_SEARCH_EP, Youtube::VIDEO_FROM_SEARCH_IL
        it.click_on_video_from_search_result 
      end
    end  

  end
end
