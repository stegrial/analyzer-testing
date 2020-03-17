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
  VIDEO_FROM_SEARCH_TA = "youtube:first_video"
  VIDEO_FROM_SEARCH_EP = "EP:youtube:first_video"

  TRENDING_LINK_IL = "//div[@id='items']//a[@title='Trending']"
  TRENDING_LINK_TA = "youtube:trending_link"
  TRENDING_LINK_EP = "EP:youtube:trending_link"

  MOVIE_BUTTON_IL = "//div[@id='sub-menu']//div[text()='Movies']"
  MOVIE_BUTTON_TA = "youtube:movie_button"
  MOVIE_BUTTON_EP = "EP:youtube:movie_button"

  VIDEO_FROM_SEARCH_2_IL = "(//div[@id='grid-container']/ytd-video-renderer)[1]/div[@id='dismissable']/ytd-thumbnail/a[@id='thumbnail']"
  VIDEO_FROM_SEARCH_2_TA = "youtube:first_video2"
  VIDEO_FROM_SEARCH_2_EP = "EP:youtube:first_video2"

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
  
  def click_trending(key = nil)
    post_processing key do
      return find(:xpath, ta(TRENDING_LINK_EP)).click if key ==:ep
      return find(:xpath, TRENDING_LINK_IL).click if key ==:il
      find(:xpath, ta(TRENDING_LINK_TA, TRENDING_LINK_IL)).click
    end
  end

  def click_on_movie_button(key = nil)
    post_processing key do
      return find(:xpath, ta(MOVIE_BUTTON_EP)).click if key ==:ep
      return find(:xpath, MOVIE_BUTTON_IL).click if key ==:il
      find(:xpath, ta(MOVIE_BUTTON_TA, MOVIE_BUTTON_IL)).click
    end
  end

  def click_on_movie_from_search_result(key = nil)
    post_processing key do
      return find(:xpath, ta(VIDEO_FROM_SEARCH_2_EP)).click if key ==:ep
      return find(:xpath, VIDEO_FROM_SEARCH_2_IL).click if key ==:il
      find(:xpath, ta(VIDEO_FROM_SEARCH_2_TA, VIDEO_FROM_SEARCH_2_IL)).click
    end
  end

end
