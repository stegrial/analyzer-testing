require_relative '../page_extension'

class TheTiebarPromoPage < PageExtension

  SHOP_NEW_ARRIVALS_BTN_IL = "(//a[contains(@href, '/whats-new')])[1]"
  SHOP_NEW_ARRIVALS_BTN_TA = "thetiebar:promo_page:shop_new_arrivals_btn"

  WHATS_NEW_H1_IL = "(//h1[text()='new arrivals'])[2]"
  WHATS_NEW_H1_TA = "thetiebar:whats_new_page:whats_new"


  def should_see_whats_new_h1(key = nil)
    return assert_selector(:xpath, WHATS_NEW_H1_IL) if key == :il
    assert_selector(:xpath, ta(WHATS_NEW_H1_TA, WHATS_NEW_H1_IL))
  end

  def click_new_arrivals_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SHOP_NEW_ARRIVALS_BTN_TA, il: SHOP_NEW_ARRIVALS_BTN_IL, check_path: $check_path).click
  end

end
