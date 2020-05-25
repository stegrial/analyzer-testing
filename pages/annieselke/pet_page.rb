require_relative '../page_extension'

class PetPage < PageExtension

  PET_H1_IL = "//div[@class='header']/h1"
  PET_H1_TA = "annieselke:pet_page:pet_h1"

  SIZE_MEDIUM_LINK_IL = "(//a[contains(@href, 'Amedium')])[1]"
  SIZE_MEDIUM_LINK_TA = "annieselke:pet_page:size_medium_link"

  SEARCH_SIZE_MEDIUM_IL = "//span[text()='medium']"
  SEARCH_SIZE_MEDIUM_TA = "annieselke:pet_page:search_size_medium"

  SIZE_MEDIUM_LARGE_LINK_IL = "//a[contains(@href, 'Flarge')]"
  SIZE_MEDIUM_LARGE_LINK_TA = "annieselke:pet_page:size_medium_large_link"

  SEARCH_SIZE_MEDIUM_LARGE_IL = "//span[text()='medium/large']"
  SEARCH_SIZE_MEDIUM_LARGE_TA = "annieselke:pet_page:search_size_medium_large"

  DROPDOWN_COLORS_IL = "//div[contains(@class, 'current-filter') and @data-filter='colors']"
  DROPDOWN_COLORS_TA = "annieselke:pet_page:dropdown_colors"

  GREY_COLOR_IL = "//a[contains(@class, 'grey')]"
  GREY_COLOR_TA = "annieselke:pet_page:grey_colors"

  SEARCH_GREY_IL = "//span[text()='grey']"
  SEARCH_GREY_TA = "annieselke:pet_page:search_grey"

  DROPDOWN_PATTERN_IL = "//div[contains(@class, 'current-filter') and @data-filter='pattern']"
  DROPDOWN_PATTERN_TA = "annieselke:pet_page:dropdown_pattern"

  STRIPE_PATTERN_IL = "//a[contains(@href, 'AStripe')]"
  STRIPE_PATTERN_TA = "annieselke:pet_page:stripe_pattern"

  SEARCH_STRIPE_IL = "//span[text()='Stripe']"
  SEARCH_STRIPE_TA = "annieselke:pet_page:search_stripe"

  DROPDOWN_MATERIAL_IL = "//div[contains(@class, 'current-filter') and @data-filter='material']"
  DROPDOWN_MATERIAL_TA = "annieselke:pet_page:dropdown_material"

  POLYPROPYLENE_MATERIAL_IL = "//a[contains(@href, 'APolypropylene')]"
  POLYPROPYLENE_MATERIAL_TA = "annieselke:pet_page:polypropylene_material"

  SEARCH_POLYPROPYLENE_IL = "//span[text()='Polypropylene']"
  SEARCH_POLYPROPYLENE_TA = "annieselke:pet_page:search_polypropylene"

  FIRST_PRODUCT_LINK_IL = "(//div[@class='product-details']/a)[2]"
  FIRST_PRODUCT_LINK_TA = "annieselke:pet_page:first_product_link"


  def should_see_pet_h1(key = nil)
    element = find_element(key, il_type: :xpath, tl: PET_H1_TA, il: PET_H1_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_filter_size_medium(key = nil)
    find_element(key, il_type: :xpath, tl: SIZE_MEDIUM_LINK_TA, il: SIZE_MEDIUM_LINK_IL, check_path: $check_path).click
  end

  def should_see_filter_size_medium(key = nil)
    element = find_element(key, il_type: :xpath, tl: SEARCH_SIZE_MEDIUM_TA, il: SEARCH_SIZE_MEDIUM_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_filter_size_med_lar(key = nil)
    find_element(key, il_type: :xpath, tl: SIZE_MEDIUM_LARGE_LINK_TA, il: SIZE_MEDIUM_LARGE_LINK_IL, check_path: $check_path).click
  end

  def should_see_filter_size_med_lar(key = nil)
    element = find_element(key, il_type: :xpath, tl: SEARCH_SIZE_MEDIUM_LARGE_TA, il: SEARCH_SIZE_MEDIUM_LARGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_dropdown_colors(key = nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_COLORS_TA, il: DROPDOWN_COLORS_IL, check_path: $check_path).click
  end

  def click_on_grey_color(key = nil)
    find_element(key, il_type: :xpath, tl: GREY_COLOR_TA, il: GREY_COLOR_IL, check_path: $check_path).click
  end

  def should_see_filter_color_grey(key = nil)
    element = find_element(key, il_type: :xpath, tl: SEARCH_GREY_TA, il: SEARCH_GREY_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_dropdown_pattern(key = nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_PATTERN_TA, il: DROPDOWN_PATTERN_IL, check_path: $check_path).click
  end

  def click_on_stripe_pattern(key = nil)
    find_element(key, il_type: :xpath, tl: STRIPE_PATTERN_TA, il: STRIPE_PATTERN_IL, check_path: $check_path).click
  end

  def should_see_filter_pat_stripe(key = nil)
    element = find_element(key, il_type: :xpath, tl: SEARCH_STRIPE_TA, il: SEARCH_STRIPE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_dropdown_material(key = nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_MATERIAL_TA, il: DROPDOWN_MATERIAL_IL, check_path: $check_path).click
  end

  def click_on_polypropylene_mater(key = nil)
    find_element(key, il_type: :xpath, tl: POLYPROPYLENE_MATERIAL_TA, il: POLYPROPYLENE_MATERIAL_IL, check_path: $check_path).click
  end

  def should_see_filter_mater_polyp(key = nil)
    element = find_element(key, il_type: :xpath, tl: SEARCH_POLYPROPYLENE_TA, il: SEARCH_POLYPROPYLENE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_on_first_product(key = nil)
    find_element(key, il_type: :xpath, tl: FIRST_PRODUCT_LINK_TA, il: FIRST_PRODUCT_LINK_IL, check_path: $check_path).click
  end

end
