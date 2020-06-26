require_relative '../page_extension'

class WalmartMediaPage < PageExtension


  HERE_FOR_YOU_IL = "//h3[text()='Here for you.']"
  HERE_FOR_YOU_TA =  "walmart:walmartmedia_page:here_for_you"

  GET_STARTED_BTN_IL = "//a[contains(@class, 'MuiButton-outlinedPrimary')]"
  GET_STARTED_BTN_TA = "walmart:walmartmedia_page:get_started_btn"

  NEXT_ARROW_IL = "(//button[contains(@class, 'MuiButton-text')])[2]"
  NEXT_ARROW_TA = "walmart:walmartmedia_page:next_arrow"

  MASSIVE_SCALE_IL = "//h2[contains(text(), 'Massive scale')]"
  MASSIVE_SCALE_TA = "walmart:walmartmedia_page:massive_scale_h2"

  SOURCE_1ST_IL = "(//span[contains(text(), 'Source')])[1]"
  SOURCE_1ST_TA = "walmart:walmartmedia_page:source1"

  SOURCE_2ND_IL = "(//span[contains(text(), 'Source')])[2]"
  SOURCE_2ND_TA = "walmart:walmartmedia_page:source2"

  INFLUENCE_CUSTOMERS_H2_IL = "//h2[contains(text(), 'Influence Walmart customers')]"
  INFLUENCE_CUSTOMERS_H2_TA = "walmart:walmartmedia_page:influence_customers"

  GET_DISCOVERED_TODAY_IL = "//span[contains(text(),  'Get discovered today')]"
  GET_DISCOVERED_TODAY_TA = "walmart:walmartmedia_page:get_discovered_today"

  CLOSE_OMNICHANNEL_LOOP_IL = "//span[contains(text(),  'Close the omnichannel loop')]"
  CLOSE_OMNICHANNEL_LOOP_TA = "walmart:walmartmedia_page:close_omnichannel_loop"

  PUT_THE_POWER_IL = "//span[contains(text(),  'Put the power of Walmart to work')]"
  PUT_THE_POWER_TA = "walmart:walmartmedia_page:put_the_power"

  READ_MORE_BTN_IL = "//button/span[contains(text(),  'Read more')]"
  READ_MORE_BTN_TA = "walmart:walmartmedia_page:read_more_btn"


  def should_see_here_for_you(key = nil)
    element = find_element(key, il_type: :xpath, tl: HERE_FOR_YOU_TA, il: HERE_FOR_YOU_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_get_started_btn(key = nil)
    find_element(key, il_type: :xpath, tl: GET_STARTED_BTN_TA, il: GET_STARTED_BTN_IL, check_path: $check_path).click
  end

  def click_next_arrow(key = nil)
    find_element(key, il_type: :xpath, tl: NEXT_ARROW_TA, il: NEXT_ARROW_IL, check_path: $check_path).click
  end

  def should_see_massive_scale_h2(key = nil)
    element = find_element(key, il_type: :xpath, tl: MASSIVE_SCALE_TA, il: MASSIVE_SCALE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_source1(key = nil)
    find_element(key, il_type: :xpath, tl: SOURCE_1ST_TA, il: SOURCE_1ST_IL, check_path: $check_path).click
  end

  def click_source2(key = nil)
    find_element(key, il_type: :xpath, tl: SOURCE_2ND_TA, il: SOURCE_2ND_IL, check_path: $check_path).click
  end

  def should_see_influence_customers(key = nil)
    element = find_element(key, il_type: :xpath, tl: INFLUENCE_CUSTOMERS_H2_TA, il: INFLUENCE_CUSTOMERS_H2_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_discovered_today(key = nil)
    find_element(key, il_type: :xpath, tl: GET_DISCOVERED_TODAY_TA, il: GET_DISCOVERED_TODAY_IL, check_path: $check_path).click
  end

  def click_close_omnichannel_loop(key = nil)
    find_element(key, il_type: :xpath, tl: CLOSE_OMNICHANNEL_LOOP_TA, il: CLOSE_OMNICHANNEL_LOOP_IL, check_path: $check_path).click
  end

  def click_put_the_power(key = nil)
    find_element(key, il_type: :xpath, tl: PUT_THE_POWER_TA, il: PUT_THE_POWER_IL, check_path: $check_path).click
  end

  def click_read_more_btn(key = nil)
    find_element(key, il_type: :xpath, tl: READ_MORE_BTN_TA, il: READ_MORE_BTN_IL, check_path: $check_path).click
  end

end