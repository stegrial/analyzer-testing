require_relative '../page_extension'

class FooterNavigation < PageExtension


  DOCUMENTATION_IL = "(//a[contains(@class, 'menu-item-link-top') and @href='https://trueautomation.io/docs/'])[2]"
  DOCUMENTATION_TA = "ta:footer:documentation_link"

  HOME_BTN_IL = "(//a[contains(@class, 'menu-item-link-top') and @href='https://trueautomation.io/'])[2]"
  HOME_BTN_TA = "ta:footer:home_btn"

  FOOTER_LOGO_IL = "(//a[contains(@class, 'jet-logo__link')])[2]"
  FOOTER_LOGO_TA = "ta:footer:footer_logo"

  LINKEDIN_LINK_IL = "//a[contains(@class, 'icon-linkedin')]"
  LINKEDIN_LINK_TA = "ta:footer:linkedin"

  FACEBOOK_LINK_IL = "//a[contains(@class, 'icon-facebook')]"
  FACEBOOK_LINK_TA = "ta:footer:facebook"


  def click_documentation_link(key = nil)
    find_element(key, il_type: :xpath, tl: DOCUMENTATION_TA, il: DOCUMENTATION_IL, check_path: $check_path).click
  end

  def click_home_btn(key = nil)
    find_element(key, il_type: :xpath, tl: HOME_BTN_TA, il: HOME_BTN_IL, check_path: $check_path).click
  end

  def click_footer_logo(key = nil)
    find_element(key, il_type: :xpath, tl: FOOTER_LOGO_TA, il: FOOTER_LOGO_IL, check_path: $check_path).click
  end

  def click_linkedin_icon(key = nil)
    find_element(key, il_type: :xpath, tl: LINKEDIN_LINK_TA, il: LINKEDIN_LINK_IL, check_path: $check_path).click
  end

  def click_facebook_icon(key = nil)
    find_element(key, il_type: :xpath, tl: FACEBOOK_LINK_TA, il: FACEBOOK_LINK_IL, check_path: $check_path).click
  end

end