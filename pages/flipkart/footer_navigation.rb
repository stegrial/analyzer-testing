
require_relative '../page_extension'

class FooterNavigationFlipkart < PageExtension


  FOOTER_COLUMN_IL = { about: "//div[text()='ABOUT']",
                       help: "//div[text()='HELP']",
                       policy: "//div[text()='POLICY']",
                       social: "//div[text()='SOCIAL']" }
  FOOTER_COLUMN_TA = { about: "flipkart:footer_nav:about",
                       help:"flipkart:footer_nav:help",
                       policy: "flipkart:footer_nav:policy",
                       social: "flipkart:footer_nav:social" }

  ABOUT_LINKS_IL = { contactus: "//a[text()='Contact Us']",
                     aboutus: "//a[text()='About Us']",
                     careers: "//a[text()='Careers']",
                     flipkartstories: "//a[text()='Flipkart Stories']",
                     press: "//a[text()='Press']" }

  ABOUT_LINKS_TA = { contactus: "flipkart:footer_nav:contact_us",
                     aboutus: "flipkart:footer_nav:about_us",
                     careers: "flipkart:footer_nav:careers",
                     flipkartstories: "flipkart:footer_nav:flipkart_stories",
                     press: "flipkart:footer_nav:press" }

  FOOTER_ROW_IL = { advertise: "//span[text()='Advertise']",
                    giftcards: "//span[text()='Gift Cards']",
                    helpcenter: "//span[text()='Help Center']"}

  FOOTER_ROW_TA = { advertise: "flipkart:footer_nav:advertise",
                    giftcards: "flipkart:footer_nav:gift_cards",
                    helpcenter: "flipkart:footer_nav:help_center"}


  def should_see_about(key = nil)
    element = find_element(key, il_type: :xpath, tl: FOOTER_COLUMN_TA[:about], il: FOOTER_COLUMN_IL[:about], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_help(key = nil)
    element = find_element(key, il_type: :xpath, tl: FOOTER_COLUMN_TA[:help], il: FOOTER_COLUMN_IL[:help], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_policy(key = nil)
    element = find_element(key, il_type: :xpath, tl: FOOTER_COLUMN_TA[:policy], il: FOOTER_COLUMN_IL[:policy], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_social(key = nil)
    element = find_element(key, il_type: :xpath, tl: FOOTER_COLUMN_TA[:social], il: FOOTER_COLUMN_IL[:social], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_contact_us_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: ABOUT_LINKS_TA[:contactus], il: ABOUT_LINKS_IL[:contactus], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_about_us_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: ABOUT_LINKS_TA[:aboutus], il: ABOUT_LINKS_IL[:aboutus], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_careers_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: ABOUT_LINKS_TA[:careers], il: ABOUT_LINKS_IL[:careers], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_flipkart_stories_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: ABOUT_LINKS_TA[:flipkartstories], il: ABOUT_LINKS_IL[:flipkartstories], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_press_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: ABOUT_LINKS_TA[:press], il: ABOUT_LINKS_IL[:press], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_advertise_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: FOOTER_ROW_TA[:advertise], il: FOOTER_ROW_IL[:advertise], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_gift_cards_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: FOOTER_ROW_TA[:giftcards], il: FOOTER_ROW_IL[:giftcards], check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_help_center_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: FOOTER_ROW_TA[:helpcenter], il: FOOTER_ROW_IL[:helpcenter], check_path: $check_path)
    expect(element).to be_visible
  end

end