require 'spec_helper'
require_relative '../page_extension'

class AboutUsPage < PageExtension

  def should_see_about_us_text(key = nil, text)
    element = find_element(key, il_type: :xpath, tl: "venus:about_us:text", il: "//*[contains(@class, 'container-about-us')]/p[text()='#{text}']", check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_about_us_image(key = nil)
    element = find_element(key, il_type: :css, tl: "venus:about_us:image", il: "img[title='About Venus']", check_path: $check_path)
    expect(element).to be_visible
  end

end






