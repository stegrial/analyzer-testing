require_relative '../page_extension'

class DealsPage < PageExtension


  DEALS_AND_PROMOTIONS_PAGE_IL = "//h1/*[text()='Deals and Promotions']"
  DEALS_AND_PROMOTIONS_PAGE_TA = "amazon:deals_page:deals_and_promotions_page"

  FASHION_CHECKBOX_IL = "(//label/span[contains(text(), 'Fashion')])[1]"
  FASHION_CHECKBOX_TA = "amazon:deals_page:fashion_checkbox"

  BEAUTY_CHECKBOX_IL = "(//label/span[contains(text(), 'Beauty')])[1]"
  BEAUTY_CHECKBOX_TA = "amazon:deals_page:beauty_checkbox"

  SEE_MORE_IL = "//span[contains(text(), 'See more') and @class='a-expander-prompt']"
  SEE_MORE_TA = "amazon:deals_page:see_more"

  SEE_LESS_IL = "//span[contains(text(), 'See less') and @class='a-expander-prompt']"
  SEE_LESS_TA = "amazon:deals_page:see_less"

  CLEAR_AVAILABILITY_IL = "(//a[text()='Clear'])[2]"
  CLEAR_AVAILABILITY_TA = "amazon:deals_page:clear_availability"

  CLEAR_DEPARTMENT_IL = "(//a[text()='Clear'])[1]"
  CLEAR_DEPARTMENT_TA = "amazon:deals_page:clear_department"

  PRICE_50_100_IL = "//div[@data-value='50-100']"
  PRICE_50_100_TA = "amazon:deals_page:price_50_100"

  DISCOUNT_10_OFF_OR_MORE_IL = "//div[@data-value='10-25,25-50,50-70,70-']"
  DISCOUNT_10_OFF_OR_MORE_TA = "amazon:deals_page:discount_10_or_more"

  THREE_STARS_UP_IL = "//a[@aria-label='3 Stars & Up']"
  THREE_STARS_UP_TA = "amazon:deals_page:three_stars_up"


  def should_see_deals_page(key = nil)
    element = find_element(key, il_type: :xpath, tl: DEALS_AND_PROMOTIONS_PAGE_TA, il: DEALS_AND_PROMOTIONS_PAGE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_fashion_checkbox(key = nil)
    find_element(key, il_type: :xpath, tl: FASHION_CHECKBOX_TA, il: FASHION_CHECKBOX_IL, check_path: $check_path).click
  end

  def click_beauty_checkbox(key = nil)
    find_element(key, il_type: :xpath, tl: BEAUTY_CHECKBOX_TA, il: BEAUTY_CHECKBOX_IL, check_path: $check_path).click
  end

  def click_see_more(key = nil)
    find_element(key, il_type: :xpath, tl: SEE_MORE_TA, il: SEE_MORE_IL, check_path: $check_path).click
    end

  def click_see_less(key = nil)
    find_element(key, il_type: :xpath, tl: SEE_LESS_TA, il: SEE_LESS_IL, check_path: $check_path).click
  end

  def click_clear_availability(key = nil)
    find_element(key, il_type: :xpath, tl: CLEAR_AVAILABILITY_TA, il: CLEAR_AVAILABILITY_IL, check_path: $check_path).click
  end

  def click_clear_department(key = nil)
    find_element(key, il_type: :xpath, tl: CLEAR_DEPARTMENT_TA, il: CLEAR_DEPARTMENT_IL, check_path: $check_path).click
  end

  def click_price_50_100(key = nil)
    find_element(key, il_type: :xpath, tl: PRICE_50_100_TA, il: PRICE_50_100_IL, check_path: $check_path).click
  end

  def click_discount_10_or_more(key = nil)
    find_element(key, il_type: :xpath, tl: DISCOUNT_10_OFF_OR_MORE_TA, il: DISCOUNT_10_OFF_OR_MORE_IL, check_path: $check_path).click
    end

  def click_three_stars_up(key = nil)
    find_element(key, il_type: :xpath, tl: THREE_STARS_UP_TA, il: THREE_STARS_UP_IL, check_path: $check_path).click
  end

end
