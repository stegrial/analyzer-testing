require 'spec_helper'
require_relative 'page_extension'

class Amazon
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  MAIN_SEARCH_IL = "//input[@id='twotabsearchtextbox']"
  MAIN_SEARCH_TA = "amazon:search_input"
  MAIN_SEARCH_EP = "EP:amazon:search_input"

  SEARCH_BTN_IL = "//div/input[@value='Go']"
  SEARCH_BTN_TA = "amazon:search_btn"
  SEARCH_BTN_EP = "EP:amazon:search_btn"

  PRODUCT_FROM_SEARCH_IL = "(//div[@class='a-section a-spacing-medium'])[5]" # old atribute section is miss
  PRODUCT_FROM_SEARCH_TA = "amazon:product_from_search"
  PRODUCT_FROM_SEARCH_EP = "EP:amazon:product_from_search"

  SIZE_LIST_IL = "(//span[@class='a-button-text a-declarative'])[1]"
  SIZE_LIST_TA = "amazon:size_list"
  SIZE_LIST_EP = "EP:amazon:size_list"

  SIZE_IL = "//ul[@class='a-nostyle a-list-link']/li[2]"
  SIZE_TA = "amazon:size"
  SIZE_EP = "EP:amazon:size"

  ADD_TO_CART_IL = "//span[@id='submit.add-to-cart']"
  ADD_TO_CART_TA = "amazon:add_to_cart"
  ADD_TO_CART_EP = "EP:amazon:add_to_cart"


  DEPARTMENS_LINK_IL = "a#nav-link-shopall"
  DEPARTMENS_LINK_TA = "amazon:departments"
  DEPARTMENS_LINK_EP = "EP:amazon:departments"

  BABY_LINK_IL = "//span[text()='Baby']"
  BABY_LINK_TA = "amazon:baby"
  BABY_LINK_EP = "EP:amazon:baby"

  NURSERY_IMG_IL= "//a/img[@alt='Nursery']"
  NURSERY_IMG_TA = "amazon:nursery"
  NURSERY_IMG_EP = "EP:amazon:nursery"

  PRODUCT_IL = "(//span[@class='rush-component']/a[@class='a-link-normal']/div)[6]"
  PRODUCT_TA = "amazon:product_from_category"
  PRODUCT_EP = "EP:amazon:product_from_category"

  def hover_departments(key = nil)
    post_processing key do
      return find(:xpath, ta(DEPARTMENS_LINK_EP)).hover if key ==:ep
      return find(:css, DEPARTMENS_LINK_IL).hover if key ==:il
      find(:css, ta(DEPARTMENS_LINK_TA, DEPARTMENS_LINK_IL)).hover
    end
  end

  def click_baby_link(key = nil)
    post_processing key do
      return find(:xpath, ta(BABY_LINK_EP)).click if key ==:ep
      return find(:xpath, BABY_LINK_IL).click if key ==:il
      find(:xpath, ta(BABY_LINK_TA, BABY_LINK_IL)).click
    end
  end

  def click_nursery(key = nil)
    post_processing key do
      return find(:xpath, ta(NURSERY_IMG_EP)).click if key ==:ep
      return find(:xpath, NURSERY_IMG_IL).click if key ==:il
      find(:xpath, ta(NURSERY_IMG_TA, NURSERY_IMG_IL)).click
    end
  end

  def click_product(key = nil)
    post_processing key do
      return find(:xpath, ta(PRODUCTY_EP)).click if key ==:ep
      return find(:xpath, PRODUCT_IL).click if key ==:il
      find(:xpath, ta(PRODUCT_TA, PRODUCT_IL)).click
    end
  end

  def set_data_in_search(key = nil, data)
    post_processing key do
      return find(:xpath, ta(MAIN_SEARCH_EP)).set(data) if key ==:ep
      return find(:xpath, MAIN_SEARCH_IL).set(data) if key ==:il
      find(:xpath, ta(MAIN_SEARCH_TA, MAIN_SEARCH_IL)).set(data)
    end
  end

  def click_search_btn(key = nil)
    post_processing key do
      return find(:xpath, ta(SEARCH_BTN_EP)).click if key ==:ep
      return find(:xpath, SEARCH_BTN_IL).click if key ==:il
      find(:xpath, ta(SEARCH_BTN_TA, SEARCH_BTN_IL)).click
    end
  end

  def click_product_from_search_result(key = nil)
    post_processing key do
      return find(:xpath, ta(PRODUCT_FROM_SEARCH_EP)).click if key ==:ep
      return find(:xpath, PRODUCT_FROM_SEARCH_IL).click if key ==:il
      find(:xpath, ta(PRODUCT_FROM_SEARCH_TA, PRODUCT_FROM_SEARCH_IL)).click
    end
  end

  def click_to_select_size_btn(key = nil)
    post_processing key do
      return find(:xpath, ta(SIZE_LIST_EP)).click if key ==:ep
      return find(:xpath, SIZE_LIST_IL).click if key ==:il
      find(:xpath, ta(SIZE_LIST_TA, SIZE_LIST_IL)).click
    end
  end

  def click_to_select_size(key = nil)
    post_processing key do
      return find(:xpath, ta(SIZE_EP)).click if key ==:ep
      return find(:xpath, SIZE_IL).click if key ==:il
      find(:xpath, ta(SIZE_TA, SIZE_IL)).click
    end
  end

  def click_for_add_to_cart(key = nil)
    post_processing key do
      return find(:xpath, ta(ADD_TO_CART_EP)).click if key ==:ep
      return find(:xpath, ADD_TO_CART_IL).click if key ==:il
      find(:xpath, ta(ADD_TO_CART_TA, ADD_TO_CART_IL)).click
    end
  end

end
