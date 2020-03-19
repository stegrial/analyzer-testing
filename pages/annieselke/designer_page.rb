require 'spec_helper'
require_relative '../page_extension'

class DesignerPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  CLOSE_BANNER_BTN = "//button[@class='offer-control close']"

  SIGN_UP_TODAY_IL = "//a[text()='SIGN UP TODAY!']"
  SIGN_UP_TODAY_TA = "annieselke:home_page:designer_page:sign_up_today"

  def select_size_item(key)
    locator_by key,
               "//select[@name='productCodePost']/option[2]",
               "annieselke:home_page:press_page:#{ta_name('item_option')}"
  end

  def close_banner
    within_frame(:xpath,"//div[@class='fcopt_modal'") do
      find(:xpath, CLOSE_BANNER_BTN).click
    end
  rescue
    puts 'Banner doesnt exist'
  end

  def click_sign_up(key=nil)
    find_element_path(key, :xpath, SIGN_UP_TODAY_TA, SIGN_UP_TODAY_IL).click
  end
end

