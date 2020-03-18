require 'spec_helper'
require_relative 'page_extension'

class Youtube
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  YOUTUBE_SEARCH_IL = "//input[@id='search']"
  YOUTUBE_SEARCH_TA = "youtube:search_input"

  YOUTUBE_BUTTON_SEARCH_IL = "//button[@id='search-icon-legacy']"
  YOUTUBE_BUTTON_SEARCH_TA = "youtube:search_btn"

  VIDEO_FROM_SEARCH_IL = "(//ytd-video-renderer)[1]/div[@id='dismissable']/ytd-thumbnail/a[@id='thumbnail']"
  VIDEO_FROM_SEARCH_TA = "youtube:first_video"

  TRENDING_LINK_IL = "//div[@id='items']//a[@title='Trending']"
  TRENDING_LINK_TA = "youtube:trending_link"

  MOVIE_BUTTON_IL = "//div[@id='sub-menu']//div[text()='Movies']"
  MOVIE_BUTTON_TA = "youtube:movie_button"

  VIDEO_FROM_SEARCH_2_IL = "(//div[@id='grid-container']/ytd-video-renderer)[1]/div[@id='dismissable']/ytd-thumbnail/a[@id='thumbnail']"
  VIDEO_FROM_SEARCH_2_TA = "youtube:first_video2"

  def set_data_in_search(key = nil, data)
    find_element_path(key, :xpath, YOUTUBE_SEARCH_TA, YOUTUBE_SEARCH_IL).fill_in with: data
  end

  def click_search_btn(key = nil)
    find_element_path(key, :xpath, YOUTUBE_BUTTON_SEARCH_TA, YOUTUBE_BUTTON_SEARCH_IL).click
  end

  def click_on_video_from_search_result(key = nil)
    find_element_path(key, :xpath, VIDEO_FROM_SEARCH_TA, VIDEO_FROM_SEARCH_IL).click
  end
  
  def click_trending(key = nil)
    find_element_path(key, :xpath, TRENDING_LINK_TA, TRENDING_LINK_IL).click
  end

  def click_on_movie_button(key = nil)
    find_element_path(key, :xpath, MOVIE_BUTTON_TA, MOVIE_BUTTON_IL).click
  end

  def click_on_movie_from_search_result(key = nil)
    find_element_path(key, :xpath, VIDEO_FROM_SEARCH_2_TA, VIDEO_FROM_SEARCH_2_IL).click
  end

  def use_element(key = nil, element)
    find_element_path(key, :xpath, YOUTUBE_BUTTON_SEARCH_TA, YOUTUBE_BUTTON_SEARCH_IL).click
  end

end
