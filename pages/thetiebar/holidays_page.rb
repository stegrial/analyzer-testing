require_relative '../page_extension'

class TheTiebarHolidaysPage < PageExtension

  BOYS_CHRISTMAS_TIES_IL = "//img[contains(@alt, 'Boys Christmas Ties and bow ties')]"
  BOYS_CHRISTMAS_TIES_TA = "thetiebar:holiday_page:boys_christmas_ties"

  THANKSGIVING_TIES_IL = "//img[contains(@alt, 'Thanksgiving Ties')]"
  THANKSGIVING_TIES_TA = "thetiebar:holiday_page:thanksgiving_ties"

  BOYS_EASTER_TIES_IL = "//img[contains(@alt, 'Boys Easter Ties')]"
  BOYS_EASTER_TIES_TA = "thetiebar:holiday_page:easter_ties"

  NAUTICAL_TIES_IL = "//img[contains(@alt, 'Nautical Ties and Accessories')]"
  NAUTICAL_TIES_TA = "thetiebar:holiday_page:Nautical_ties"

  BOYS_CHRISTMAS_TIES_H1_IL = "//h1[contains(text(),'christmas ties')]"
  BOYS_CHRISTMAS_TIES_H1_TA = "thetiebar:holiday_page:pdp:christmas_h1"

  THANKSGIVING_TIES_H1_IL = "//h1[contains(text(),'thanksgiving ties & accessories')]"
  THANKSGIVING_TIES_H1_TA = "thetiebar:holiday_page:pdp:thanksgiving_ties_h1"

  BOYS_EASTER_TIES_H1_IL = "//h1[contains(text(),'easter ties & bow ties for boys')]"
  BOYS_EASTER_TIES_H1_TA = "thetiebar:holiday_page:pdp:easter_ties_h1"

  NAUTICAL_TIES_H1_IL = "//h1[contains(text(),'nautical ties & accessories')]"
  NAUTICAL_TIES_H1_TA = "thetiebar:holiday_page:pdp:Nautical_ties_h1"


  def click_boys_christmas_ties_icon(key = nil)
    find_element(key, il_type: :xpath, tl: BOYS_CHRISTMAS_TIES_TA, il: BOYS_CHRISTMAS_TIES_IL, check_path: $check_path).click
  end

  def click_thanksgiving_ties_icon(key = nil)
    find_element(key, il_type: :xpath, tl: THANKSGIVING_TIES_TA, il: THANKSGIVING_TIES_IL, check_path: $check_path).click
  end

  def click_boys_easter_ties_icon(key = nil)
    find_element(key, il_type: :xpath, tl: BOYS_EASTER_TIES_TA, il: BOYS_EASTER_TIES_IL, check_path: $check_path).click
  end

  def click_nautical_ties_icon(key = nil)
    find_element(key, il_type: :xpath, tl: NAUTICAL_TIES_TA, il: NAUTICAL_TIES_IL, check_path: $check_path).click
  end

  def should_see_boys_christmas_h1(key = nil)
    return assert_selector(:xpath, BOYS_CHRISTMAS_TIES_H1_IL) if key == :il
    assert_selector(:xpath, ta(BOYS_CHRISTMAS_TIES_H1_TA, BOYS_CHRISTMAS_TIES_H1_IL))
  end

  def should_see_thanksgiving_h1(key = nil)
    return assert_selector(:xpath, THANKSGIVING_TIES_H1_IL) if key == :il
    assert_selector(:xpath, ta(THANKSGIVING_TIES_H1_TA, THANKSGIVING_TIES_H1_IL))
  end

  def should_see_boys_easter_h1(key = nil)
    return assert_selector(:xpath, BOYS_EASTER_TIES_H1_IL) if key == :il
    assert_selector(:xpath, ta(BOYS_EASTER_TIES_H1_TA, BOYS_EASTER_TIES_H1_IL))
  end

  def should_see_nautical_h1(key = nil)
    return assert_selector(:xpath, NAUTICAL_TIES_H1_IL) if key == :il
    assert_selector(:xpath, ta(NAUTICAL_TIES_H1_TA, NAUTICAL_TIES_H1_IL))
  end

end
