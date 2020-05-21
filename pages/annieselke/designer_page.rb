require_relative '../page_extension'

class DesignerPage < PageExtension


  SIGN_UP_TODAY_IL = "//a[text()='SIGN UP TODAY!']"
  SIGN_UP_TODAY_TA = "annieselke:home_page:designer_page:sign_up_today"

  def select_size_item(key)
    locator_by key,
               "//select[@name='productCodePost']/option[2]",
               "annieselke:home_page:press_page:#{ta_name('item_option')}"
  end

  def click_sign_up(key=nil)
    find_element(key, il_type: :xpath, tl: SIGN_UP_TODAY_TA, il: SIGN_UP_TODAY_IL, check_path: $check_path).click
  end
end


