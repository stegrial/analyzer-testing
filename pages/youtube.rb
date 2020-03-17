require 'spec_helper'
require_relative 'page_extension'

class Youtube
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  YOUTUBE_SEARCH_IL = "//input[@id='search']"
  YOUTUBE_SEARCH_TA = "youtube:search_input"
  YOUTUBE_SEARCH_EP = "EP:youtube:search_input"

  YOUTUBE_BUTTON_SEARCH_IL = "//button[@id='search-icon-legacy']"
  YOUTUBE_BUTTON_SEARCH_TA = "youtube:search_btn"
  YOUTUBE_BUTTON_SEARCH_EP = "EP:youtube:search_btn"

  VIDEO_FROM_SEARCH_IL = "(//ytd-video-renderer)[1]/div[@id='dismissable']/ytd-thumbnail/a[@id='thumbnail']"
  VIDEO_FROM_SEARCH_TA = "youtube"
  VIDEO_FROM_SEARCH_EP = "EP:youtube"

  def set_data_in_search(key = nil, data)
    post_processing key do
      return find(:xpath, ta(YOUTUBE_SEARCH_EP)).set(data) if key ==:ep
      return find(:xpath, YOUTUBE_SEARCH_IL).set(data) if key ==:il
      find(:xpath, ta(YOUTUBE_SEARCH_TA, YOUTUBE_SEARCH_IL)).set(data)
    end
  end

  def click_search_btn(key = nil)
    post_processing key do
      return find(:xpath, ta(YOUTUBE_BUTTON_SEARCH_EP)).click if key ==:ep
      return find(:xpath, YOUTUBE_BUTTON_SEARCH_IL).click if key ==:il
      find(:xpath, ta(YOUTUBE_BUTTON_SEARCH_TA, YOUTUBE_BUTTON_SEARCH_IL)).click
    end
  end

  def click_on_video_from_search_result(key = nil)
    post_processing key do
      return find(:xpath, ta(VIDEO_FROM_SEARCH_EP)).click if key ==:ep
      return find(:xpath, VIDEO_FROM_SEARCH_IL).click if key ==:il
      find(:xpath, ta(VIDEO_FROM_SEARCH_TA, VIDEO_FROM_SEARCH_IL)).click
    end
  end
  

end
