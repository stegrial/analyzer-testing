require 'spec_helper'

class VenusClothingSale
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  SIZE_8_IL = "//button/span[text()='8']"
  SIZE_8_TA = 'venus:clothing_sale_page:size_8'
  SIZE_8_EP = 'EP:venus:clothing_sale_page:size_8'


  def get_text_button_size_8(key = nil)
    return find(ta(SIZE_8_EP)).text if key == :ep
    return find(:xpath, SIZE_8_IL).text if key == :il
    find(:xpath, ta(SIZE_8_TA, SIZE_8_IL)).text
  end

  def click_to_choose_size_8(key = nil)
    return find(ta(SIZE_8_EP)).click if key == :ep
    return find(:xpath, SIZE_8_IL).click if key == :il
    find(:xpath, ta(SIZE_8_TA, SIZE_8_IL)).click
  end

end
