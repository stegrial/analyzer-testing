require_relative '../page_extension'

class TheTiebarProductPage < PageExtension

  SECOND_SHIRT_PDP_IL = "(//img[contains(@alt, 'Shirt')])[2]"
  SECOND_SHIRT_PDP_TA = "thetiebar:header:shirts"

  SECOND_SQUARE_PDP_IL = "(//a[@data-th='product-link']/div)[2]"
  SECOND_SQUARE_PDP_TA = "thetiebar:header:square"

  SIZE_145_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='14.5']"
  SIZE_145_TA = "thetiebar:PDP:145_size_btn"

  SIZE_15_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='15']"
  SIZE_15_TA = "thetiebar:PDP:15_size_btn"

  SIZE_155_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='15.5']"
  SIZE_155_TA = "thetiebar:PDP:155_size_btn"

  SIZE_16_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='16']"
  SIZE_16_TA = "thetiebar:PDP:16_size_btn"

  SIZE_165_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='16.5']"
  SIZE_165_TA = "thetiebar:PDP:165_size_btn"

  SIZE_17_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='17']"
  SIZE_17_TA = "thetiebar:PDP:17_size_btn"

  SIZE_175_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='17.5']"
  SIZE_175_TA = "thetiebar:PDP:175_size_btn"

  SIZE_18_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='18']"
  SIZE_18_TA = "thetiebar:PDP:18_size_btn"

  SIZE_185_IL = "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//h5[text()='18.5']"
  SIZE_185_TA = "thetiebar:PDP:185_size_btn"

  SLEEVE_LENGTH_IL = "(//button[not(@disabled)]/span/h5[contains(text(), '/')])[1]"
  SLEEVE_LENGTH_TA = "thetiebar:PDP:sleeve_length"

  QUANTITY_IL = "(//button[contains(@aria-label, 'subtract')])[1]"
  QUANTITY_TA = "thetiebar:PDP:quantity"

  ADD_TO_CART_IL = "(//h6[contains(text(), 'Add to Cart')])[1]"
  # ADD_TO_CART_IL = "(//button[contains(@data-th, 'add-to-cart')])[1]"
  ADD_TO_CART_TA = "thetiebar:PDP:add_to_cart"

  FIT_TRIM_IL = "//button//p[text()='Trim']"
  FIT_TRIM_TA = "thetiebar:PDP:fit_trim"

  BLACK_COLOR_IL = "//div[@title='Black pants']"
  BLACK_COLOR_TA = "thetiebar:PDP:black_color"

  BLUE_COLOR_IL = "//div[@title='Blue pants']"
  BLUE_COLOR_TA = "thetiebar:PDP:blue_color"

  SLIM_FIT_IL = "//p[contains(text(), 'slim')]"
  SLIM_FIT_TA = "thetiebar:PDP:slim_fit"

  WOOL_MATERIAL_IL = "//p[contains(text(), 'wool')]"
  WOOL_MATERIAL_TA = "thetiebar:PDP:wool"

  WAIST_28_IL = "//div[contains(text(), '28')]"
  WAIST_28_TA = "thetiebar:PDP:waist28"

  SORT_BY_FILTER_IL = "//span[contains(text(), 'Sort By:')]"
  SORT_BY_FILTER_TA = "thetiebar:PDP:sort_by"

  NEWEST_IL = "//li[contains(text(), 'Newest')]"
  NEWEST_TA = "thetiebar:PDP:newest"

  VIEW_IL = "//span[contains(text(), 'View:')]"
  VIEW_TA = "thetiebar:PDP:view"

  VIEW_72_IL = "//li[contains(text(), '72')]"
  VIEW_72_TA = "thetiebar:PDP:72view"

  SHIRTS_H1_IL = "//h1[contains(text(),'dress shirts')]"
  SHIRTS_H1_TA = "thetiebar:PDP:shirts_h1"

  WEDDING_TIES_H1_IL = "//h1[contains(text(),'wedding ties')]"
  WEDDING_TIES_H1_TA = "thetiebar:PDP:wedding_shop_h1"


  def should_see_wedding_ties_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: WEDDING_TIES_H1_TA, il: WEDDING_TIES_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, WEDDING_TIES_H1_IL) if key == :il
    # assert_selector(:xpath, ta(WEDDING_TIES_H1_TA, WEDDING_TIES_H1_IL))
  end

  def should_see_shirts_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: SHIRTS_H1_TA, il: SHIRTS_H1_IL, check_path: $check_path)
    expect(element).to be_visible
    # return assert_selector(:xpath, SHIRTS_H1_IL) if key == :il
    # assert_selector(:xpath, ta(SHIRTS_H1_TA, SHIRTS_H1_IL))
  end

  def click_second_shirt_on_product(key = nil)
    find_element(key, il_type: :xpath, tl: SECOND_SHIRT_PDP_TA, il: SECOND_SHIRT_PDP_IL, check_path: $check_path).click
  end

  def click_fit_trim_btn(key = nil)
    find_element(key, il_type: :xpath, tl: FIT_TRIM_TA, il: FIT_TRIM_IL, check_path: $check_path).click
  end

  def click_add_quantity_btn(key = nil)
    find_element(key, il_type: :xpath, tl: QUANTITY_TA, il: QUANTITY_IL, check_path: $check_path).click
  end

  def click_add_to_cart_btn(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_CART_TA, il: ADD_TO_CART_IL, check_path: $check_path).click
  end

  def click_to_select_color_blue(key = nil)
    find_element(key, il_type: :xpath, tl: BLUE_COLOR_TA, il: BLUE_COLOR_IL, check_path: $check_path).click
  end

  def click_to_select_color_black(key = nil)
    find_element(key, il_type: :xpath, tl: BLACK_COLOR_TA, il: BLACK_COLOR_IL, check_path: $check_path).click
  end

  def click_slim_fit(key = nil)
    find_element(key, il_type: :xpath, tl: SLIM_FIT_TA, il: SLIM_FIT_IL, check_path: $check_path).click
  end

  def click_wool_material(key = nil)
    find_element(key, il_type: :xpath, tl: WOOL_MATERIAL_TA, il: WOOL_MATERIAL_IL, check_path: $check_path).click
  end

  def click_28_waist(key = nil)
    find_element(key, il_type: :xpath, tl: WAIST_28_TA, il: WAIST_28_IL, check_path: $check_path).click
  end

  def click_sort_by(key = nil)
    find_element(key, il_type: :xpath, tl: SORT_BY_FILTER_TA, il: SORT_BY_FILTER_IL, check_path: $check_path).click
  end

  def click_newest_soring(key = nil)
    find_element(key, il_type: :xpath, tl: NEWEST_TA, il: NEWEST_IL, check_path: $check_path).click
  end

  def click_view(key = nil)
    find_element(key, il_type: :xpath, tl: VIEW_TA, il: VIEW_IL, check_path: $check_path).click
  end

  def click_view72(key = nil)
    find_element(key, il_type: :xpath, tl: VIEW_72_TA, il: VIEW_72_IL, check_path: $check_path).click
  end

  def click_to_select_neck_size
    if page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//p[text()='14.5']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//p[text()='14.5']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//p[text()='15']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//p[text()='15']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//p[text()='15.5']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//p[text()='15.5']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//p[text()='16']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//p[text()='16']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//p[text()='16.5']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//p[text()='16.5']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//p[text()='17']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//p[text()='17.7']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//p[text()='17.5']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//p[text()='17']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//p[text()='18']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//p[text()='17']").click

    elsif page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//p[text()='18.5']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//p[text()='17']").click
    else
      p "No sizes available"
    end
  end

  def click_sleeve_length_btn
    if page.has_xpath?("//button[not(contains(@tabindex, '-1'))]//p[text()='32/33']")
      find(:xpath, "//button[not(contains(@tabindex, '-1'))]//p[text()='32/33']").click

    elsif page.has_xpath?("//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//p[text()='34/35']")
      find(:xpath, "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//p[text()='34/35']").click

    elsif page.has_xpath?("//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//p[text()='36/37']")
      find(:xpath, "//div[@id='SizeWidget']//button[not(contains(@tabindex, '-1'))]//p[text()='36/37']").click
    else
      p "No sleeve length sizes available"

    end
  end

  def click_second_square(key = nil)
    find_element(key, il_type: :xpath, tl: SECOND_SQUARE_PDP_TA, il: SECOND_SQUARE_PDP_IL, check_path: $check_path).click
  end

end
