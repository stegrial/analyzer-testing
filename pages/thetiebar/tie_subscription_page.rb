require_relative '../page_extension'

class TheTiebarSubscriptionPage < PageExtension

  SKINNY_TIES_25_IL = "//input[@id='SCTIE2512']"
  SKINNY_TIES_25_TA = "thetiebar:custom_page:skinny_ties_25"

  NECK_TIES_325_IL = "//input[@id='SCTIE32506']"
  NECK_TIES_325_TA = "thetiebar:custom_page:neck_ties_325"

  BOW_TIES_12_IL = "//input[@id='SCBWTST12']"
  BOW_TIES_12_TA = "thetiebar:custom_page:bow_ties_12"

  PAIRS_SOCKS_12_IL = "//input[@id='SCSCK12']"
  PAIRS_SOCKS_12_TA = "thetiebar:custom_page:pairs_socks_12"

  ADD_TO_CART1_IL = "(//button[@name='add'])[1]"
  ADD_TO_CART1_TA = "thetiebar:custom_page:add1"

  ADD_TO_CART2_IL = "(//button[@name='add'])[2]"
  ADD_TO_CART2_TA = "thetiebar:custom_page:add2"

  ADD_TO_CART3_IL = "(//button[@name='add'])[3]"
  ADD_TO_CART3_TA = "thetiebar:custom_page:add3"

  ADD_TO_CART4_IL = "(//button[@name='add'])[4]"
  ADD_TO_CART4_TA = "thetiebar:custom_page:add4"

  CLICK_FREE_PLACE_IL = "//body"
  CLICK_FREE_PLACE_TA = "thetiebar:custom_page:free_place"


  def click_skinny_ties_25(key = nil)
    find_element(key, il_type: :xpath, tl: SKINNY_TIES_25_TA, il: SKINNY_TIES_25_IL, check_path: $check_path).click
  end

  def click_neck_ties_325(key = nil)
    find_element(key, il_type: :xpath, tl: NECK_TIES_325_TA, il: NECK_TIES_325_IL, check_path: $check_path).click
  end

  def click_bow_ties_12(key = nil)
    find_element(key, il_type: :xpath, tl: BOW_TIES_12_TA, il: BOW_TIES_12_IL, check_path: $check_path).click
  end

  def click_pairs_socks_12(key = nil)
    find_element(key, il_type: :xpath, tl: PAIRS_SOCKS_12_TA, il: PAIRS_SOCKS_12_IL, check_path: $check_path).click
  end

  def click_add_1(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_CART1_TA, il: ADD_TO_CART1_IL, check_path: $check_path).click
  end

  def click_add_2(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_CART2_TA, il: ADD_TO_CART2_IL, check_path: $check_path).click
  end

  def click_add_3(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_CART3_TA, il: ADD_TO_CART3_IL, check_path: $check_path).click
  end

  def click_add_4(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_CART4_TA, il: ADD_TO_CART4_IL, check_path: $check_path).click
  end

  def click_free_place(key = nil)
    find_element(key, il_type: :xpath, tl: CLICK_FREE_PLACE_TA, il: CLICK_FREE_PLACE_IL, check_path: $check_path).click
  end

end
