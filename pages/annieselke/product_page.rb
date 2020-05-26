require_relative '../page_extension'

class ProductPage < PageExtension

  TIA_MIRROR_LINK_IL = "(//a[@title='Tia Mirror'])[1]"
  TIA_MIRROR_LINK_TA = "annieselke:product_page:tia_mirror"

  DROPDOWN_ARROW_IL = "//select[@id='variant']"
  DROPDOWN_ARROW_TA = "annieselke:product_page:size_dropdown_arrow"

  GALLERY_IMG_IL = "(//div[@class='gallery-images']//img)[2]"
  GALLERY_IMG_TA = "annieselke:product_page:gallery_img"

  ADDITIONAL_DETAILS_IL = "//div[@class='product-information']//h4"
  ADDITIONAL_DETAILS_TA = "annieselke:product_page:additional_details"

  QUANTITY_IL = "(//input[@id='qty'])[1]"
  QUANTITY_TA = "annieselke:product_page:qty"

  ADD_TO_CART_IL = "(//button[@id='addToCartButton'])[1]"
  ADD_TO_CART_TA = "annieselke:product_page:add_to_cart"

  SOCIAL_NETWORKS_IL = {facebook: "//a[@id='share_facebook']",
                        twitter: "//a[@id='share_twitter']",
                        pinterest: "//a[@id='share_pinterest']",
                        houzz: "//a[@id='share_houzz']"}

  SOCIAL_NETWORKS_TA = {facebook: "annieselke:product_page:social_networks:facebook",
                        twitter: "annieselke:product_page:social_networks:twitter",
                        pinterest: "annieselke:product_page:social_networks:pinterest",
                        houzz: "annieselke:product_page:social_networks:houzz"}


  def search_item(key, name)
    locator_by key,
               "//select[@id='variant']/option[@value='#{name}']",
               "annieselke:product_page:#{ta_name(name)}"
  end

  def click_tia_mirror_link(key = nil)
    find_element(key, il_type: :xpath, tl: TIA_MIRROR_LINK_TA, il: TIA_MIRROR_LINK_IL, check_path: $check_path).click
    sleep 4 #wait until page is load
  end

  def click_dropdown_arrow(key=nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_ARROW_TA, il: DROPDOWN_ARROW_IL, check_path: $check_path).click
  end

  def select_dropdown(key=nil, name)
    find_element(key, il_type: :xpath, tl: search_item(:ta, name), il: search_item(:il, name), check_path: $check_path).click
  end

  def click_to_change_gallery_img(key=nil)
    find_element(key, il_type: :xpath, tl: GALLERY_IMG_TA, il: GALLERY_IMG_IL, check_path: $check_path).click
  end

  def click_on_facebook_icon(key = nil)
    find_element(key, il_type: :xpath, tl: SOCIAL_NETWORKS_TA[:facebook], il: SOCIAL_NETWORKS_IL[:facebook], check_path: $check_path).click
  end

  def click_on_twitter_icon(key = nil)
    find_element(key, il_type: :xpath, tl: SOCIAL_NETWORKS_TA[:twitter], il: SOCIAL_NETWORKS_IL[:twitter], check_path: $check_path).click
  end

  def click_on_pinterest_icon(key = nil)
    find_element(key, il_type: :xpath, tl: SOCIAL_NETWORKS_TA[:pinterest], il: SOCIAL_NETWORKS_IL[:pinterest], check_path: $check_path).click
  end

  def click_on_houzz_icon(key = nil)
    find_element(key, il_type: :xpath, tl: SOCIAL_NETWORKS_TA[:houzz], il: SOCIAL_NETWORKS_IL[:houzz], check_path: $check_path).click
  end

  def click_on_additional_details(key = nil)
    find_element(key, il_type: :xpath, tl: ADDITIONAL_DETAILS_TA, il: ADDITIONAL_DETAILS_IL, check_path: $check_path).click
  end

  def fill_qty(key = nil, value)
    find_element(key, il_type: :xpath, tl: QUANTITY_TA, il: QUANTITY_IL, check_path: $check_path).set(value)
  end

  def click_add_to_cart(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_TO_CART_TA, il: ADD_TO_CART_IL, check_path: $check_path).click
  end

end
