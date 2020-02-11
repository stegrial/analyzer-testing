require 'spec_helper'
require_relative '../helpers/special_methods'

class Olx
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  ANIMAL_CATEGORY_IL = "(//a[@data-id='35'])[1]"
  ANIMAL_CATEGORY_TA = "olx:animal_category"
  ANIMAL_CATEGORY_EP = "EP:olx:animal_category"

  FREE_ANIMAL_MATING_IL = "//a[@data-id='1520']"
  FREE_ANIMAL_MATING_TA = "olx:free_animal_mating"
  FREE_ANIMAL_MATING_EP = "EP:olx:free_animal_mating"

  GALLERY_VIEW_IL = "(//ul[@id='viewSelector']/li)[3]"
  GALLERY_VIEW_TA = "olx:gallery_view"
  GALLERY_VIEW_EP = "EP:olx:gallery_view"

  PRODUCT_IL = "//li[@data-adnumber='17']"
  PRODUCT_TA = "olx:product"
  PRODUCT_EP = "EP:olx:product"

  MY_ACCOUNT_IL = "//span[@data-cy='common_link_header_myaccount']"
  MY_ACCOUNT_TA = "olx:my_account"
  MY_ACCOUNT_EP = "EP:olx:my_account"

  REGISTER_TAB_IL = "a#register_tab"
  REGISTER_TAB_TA = "olx:register_tab"
  REGISTER_TAB_EP = "EP:olx:register_tab"

  SEARCH_INPUT_IL = "input#headerSearch"
  SEARCH_INPUT_TA = "olx:main_search_input"
  SEARCH_INPUT_EP = "EP:olx:main_search_input"

  RESULT_OF_SEARCH_IL = "(//li[@class='rel'])[1]/a"
  RESULT_OF_SEARCH_TA = "olx:search_result"
  RESULT_OF_SEARCH_EP = "EP:olx:search_result"

  CLEAR_SEARCH_BTN_IL = "(//a[@class='clear-input-button'])[1]"
  CLEAR_SEARCH_BTN_TA = "olx:clear_search_btn"
  CLEAR_SEARCH_BTN_EP = "EP:olx:clear_search_btn"

  CLEAR_REGION_BTN_IL = "(//a[@class='clear-input-button'])[2]"
  CLEAR_REGION_BTN_TA = "olx:clear_region_btn"
  CLEAR_REGION_BTN_EP = "EP:olx:clear_region_btn"

  EXAMPLE_RESULT_IL = "(//table[1]//div[@class='space rel'])[5]"
  EXAMPLE_RESULT_TA = "olx:some_result"
  EXAMPLE_RESULT_EP = "EP:olx:some_result"

  def click_animal_category(key = nil)
    post_processing key do
      return find(:xpath, ta(ANIMAL_CATEGORY_EP)).click if key == :ep
      return find(:xpath, ANIMAL_CATEGORY_IL).click if key == :il
      find(:xpath, ta(ANIMAL_CATEGORY_TA, ANIMAL_CATEGORY_IL)).click
    end
  end

  def click_free_animal_matting(key = nil)
    post_processing key do
      return find(:xpath, ta(FREE_ANIMAL_MATING_EP)).click if key == :ep
      return find(:xpath, FREE_ANIMAL_MATING_IL).click if key == :il
      find(:xpath, ta(FREE_ANIMAL_MATING_TA, FREE_ANIMAL_MATING_IL)).click
    end
  end

  def click_gallery_view(key = nil)
    post_processing key do
      return find(:xpath, ta(GALLERY_VIEW_EP)).click if key == :ep
      return find(:xpath, GALLERY_VIEW_IL).click if key == :il
      find(:xpath, ta(GALLERY_VIEW_TA, GALLERY_VIEW_IL)).click
    end
  end

  def click_to_select_product(key = nil)
    post_processing key do
      return find(:xpath, ta(PRODUCT_EP)).click if key == :ep
      return find(:xpath, PRODUCT_IL).click if key == :il
      find(:xpath, ta(PRODUCT_TA, PRODUCT_IL)).click
    end
  end

  def click_my_acc_btn(key = nil)
    post_processing key do
      return find(:xpath, ta(MY_ACCOUNT_EP)).click if key == :ep
      return find(:xpath, MY_ACCOUNT_IL).click if key == :il
      find(:xpath, ta(MY_ACCOUNT_TA, MY_ACCOUNT_IL)).click
    end
  end

  def click_register_tab(key = nil)
    post_processing key do
      return find(:xpath, ta(REGISTER_TAB_EP)).click if key == :ep
      return find(:css, REGISTER_TAB_IL).click if key == :il
      find(:css, ta(REGISTER_TAB_TA, REGISTER_TAB_IL)).click
    end
  end

  def set_search_input(key = nil, searchTExt)
    post_processing key do
      return find(:xpath, ta(SEARCH_INPUT_EP)).set(searchTExt) if key == :ep
      return find(:css, SEARCH_INPUT_IL).set(searchTExt) if key == :il
      find(:css, ta(SEARCH_INPUT_TA, SEARCH_INPUT_IL)).set(searchTExt)
    end
  end

  def click_to_clear_search(key = nil)
    post_processing key do
      return find(:xpath, ta(CLEAR_SEARCH_BTN_EP)).click if key == :ep
      return find(:xpath, CLEAR_SEARCH_BTN_IL).click if key == :il
      find(:xpath, ta(CLEAR_SEARCH_BTN_TA, CLEAR_SEARCH_BTN_IL)).click
    end
  end

  def click_to_clear_region(key = nil)
    post_processing key do
      return find(:xpath, ta(CLEAR_REGION_BTN_EP)).click if key == :ep
      return find(:xpath, CLEAR_REGION_BTN_IL).click if key == :il
      find(:xpath, ta(CLEAR_REGION_BTN_TA, CLEAR_REGION_BTN_IL)).click
    end
  end

  def click_to_select_some_result(key = nil)
    post_processing key do
      return find(:xpath, ta(EXAMPLE_RESULT_EP)).click if key == :ep
      return find(:xpath, EXAMPLE_RESULT_IL).click if key == :il
      find(:xpath, ta(EXAMPLE_RESULT_TA, EXAMPLE_RESULT_IL)).click
    end
  end
end