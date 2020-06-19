require_relative '../page_extension'

class TheTiebarAboutUs < PageExtension

  NEXT_IMG_SLIDER_IL = "//*[contains(@class, 'main-carousel-next')]"
  NEXT_IMG_SLIDER_TA = "thetiebar:about_us:next_btn"

  PREVIOUS_IMG_SLIDER_IL = "//*[contains(@class, 'main-carousel-previous')]"
  PREVIOUS_IMG_SLIDER_TA = "thetiebar:about_us:previous_btn"

  NEXT_HISTORY_SLIDER_IL = "(//*[contains(@class, 'history-carousel-next')])[1]"
  NEXT_HISTORY_SLIDER_TA = "thetiebar:about_us:next_history_btn"

  PREVIOUS_HISTORY_SLIDER_IL = "(//*[contains(@class, 'history-carousel-previous')])[1]"
  PREVIOUS_HISTORY_SLIDER_TA = "thetiebar:about_us:previous_history_btn"

  FIND_STORE_BTN_IL = "//a[text()='Find a store near you']"
  FIND_STORE_BTN_TA = "thetiebar:about_us:find_store_btn"

  ABOUT_OUR_STORES_H1_IL = "//h1[text()='about our tie bar stores']"
  ABOUT_OUR_STORES_H1_TA = "thetiebar:returns_page:about_our_stores_h1"

  COOKIES_CLOSE_DIV_IL = "//div[contains(@class, 'cookie-x')]"
  COOKIES_CLOSE_DIV_TA = "thetiebar:main_page:cookies_close_div"


  def click_next_slider(key = nil)
    find_element(key, il_type: :xpath, tl: NEXT_IMG_SLIDER_TA, il: NEXT_IMG_SLIDER_IL, check_path: $check_path).click
  end

  def click_previous_slider(key = nil)
    find_element(key, il_type: :xpath, tl: PREVIOUS_IMG_SLIDER_TA, il: PREVIOUS_IMG_SLIDER_IL, check_path: $check_path).click
  end

  def click_next_history_slider(key = nil)
    find_element(key, il_type: :xpath, tl: NEXT_HISTORY_SLIDER_TA, il: NEXT_HISTORY_SLIDER_IL, check_path: $check_path).click
  end

  def click_previous_history_slider(key = nil)
    find_element(key, il_type: :xpath, tl: PREVIOUS_HISTORY_SLIDER_TA, il: PREVIOUS_HISTORY_SLIDER_IL, check_path: $check_path).click
  end

  def click_find_store_btn(key = nil)
    find_element(key, il_type: :xpath, tl: FIND_STORE_BTN_TA, il: FIND_STORE_BTN_IL, check_path: $check_path).click
  end

  def should_see_about_our_stores_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: ABOUT_OUR_STORES_H1_TA, il: ABOUT_OUR_STORES_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, ABOUT_OUR_STORES_H1_IL) if key == :il
    # assert_selector(:xpath, ta(ABOUT_OUR_STORES_H1_TA, ABOUT_OUR_STORES_H1_IL))
  end

  def click_close_coolies_div(key = nil)
    find_element(key, il_type: :xpath, tl: COOKIES_CLOSE_DIV_TA, il: COOKIES_CLOSE_DIV_IL, check_path: $check_path).click
  end

end
