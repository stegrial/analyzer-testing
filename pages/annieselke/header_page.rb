require 'spec_helper'
require_relative '../page_extension'

class HeaderPage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  CLOSE_BANNER_BTN = "//button[@title='Close Dialog']"
  CLOSE_CUPON_BANNER_BTN = "//button[@class='offer-control close']"


  def close_banner
    if page.has_xpath?("//iframe[contains(@title, 'Sign up and receive')]")
      within_frame(:xpath, "//iframe[contains(@title, 'Sign up and receive')]") do
      find(:xpath, CLOSE_BANNER_BTN).click
      end
    end
  rescue
    puts 'Banner doesnt exist'
  end

  def close_cupon_banner
    if page.has_xpath?("//iframe[@title='STG_Engagement Bar - Demo (Lightbox)']")
      within_frame(:xpath, "//iframe[@title='STG_Engagement Bar - Demo (Lightbox)']") do
      find(:xpath, CLOSE_CUPON_BANNER_BTN).click
      end
    end
  rescue
    puts 'Banner doesnt exist'
  end

end
