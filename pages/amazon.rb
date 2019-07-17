require 'spec_helper'

class Amazon

  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  MAIN_SEARCH_IL = "//input[@id='twotabsearchtextbox']"
  MAIN_SEARCH_TA = "amazon:search_input"
  MAIN_SEARCH_EP = "EP:amazon:search_input"

  SEARCH_BTN_IL = "//div/input[@value='Go']"
  SEARCH_BTN_TA = "amazon:search_btn"
  SEARCH_BTN_EP = "EP:amazon:search_btn"

  PRODUCT_FROM_SEARCH_IL = "(//img[@class='mediaCentralImage imageContainer__image'])[2]"
  PRODUCT_FROM_SEARCH_TA = "amazon:product_from_search"
  PRODUCT_FROM_SEARCH_EP = "EP:amazon:product_from_search"

  SIZE_LIST_IL = "//select[@name='dropdown_selected_size_name']"
  SIZE_LIST_TA = "amazon:size_list"
  SIZE_LIST_EP = "EP:amazon:size_list"

  ADD_TO_CART_IL = "//span[@id='submit.add-to-cart']"
  ADD_TO_CART_TA = "amazon:add_to_cart"
  ADD_TO_CART_EP = "EP:amazon:add_to_cart"

  def set_data_in_search(key = nil, data)
    return find(:xpath, ta(MAIN_SEARCH_EP)).set(data) if key ==:ep
    return find(:xpath, MAIN_SEARCH_IL).set(data) if key ==:il
    find(:xpath, ta(MAIN_SEARCH_TA, MAIN_SEARCH_IL)).set(data)
  end

  def click_search_btn(key = nil)
    return find(:xpath, ta(SEARCH_BTN_EP)).click if key ==:ep
    return find(:xpath, SEARCH_BTN_IL).click if key ==:il
    find(:xpath, ta(SEARCH_BTN_TA, SEARCH_BTN_IL)).click
  end

  def click_product_from_search_result(key = nil)
    return find(:xpath, ta(PRODUCT_FROM_SEARCH_EP)).click if key ==:ep
    return find(:xpath, PRODUCT_FROM_SEARCH_IL).click if key ==:il
    find(:xpath, ta(PRODUCT_FROM_SEARCH_TA, PRODUCT_FROM_SEARCH_IL)).click
  end

  def click_to_select_size_btn(key = nil)
    return find(:xpath, ta(SIZE_LIST_EP)).select('Large') if key ==:ep
    return find(:xpath, SIZE_LIST_IL).select('Large') if key ==:il
    find(:xpath, ta(SIZE_LIST_TA, SIZE_LIST_IL)).select('Large')
  end

  def click_for_add_to_cart(key = nil)
    return find(:xpath, ta(ADD_TO_CART_EP)).click if key ==:ep
    return find(:xpath, ADD_TO_CART_IL).click if key ==:il
    find(:xpath, ta(ADD_TO_CART_TA, ADD_TO_CART_IL)).click
  end

end
