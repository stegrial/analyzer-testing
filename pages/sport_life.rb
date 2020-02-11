require 'spec_helper'
require_relative '../helpers/special_methods'

class SportLife
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  RUSSIAN_LANG_IL = "//a[contains(.,'рус')]"
  RUSSIAN_LANG_TA = "sport_life:rus_lang"
  RUSSIAN_LANG_EP = "EP:sport_life:rus_lang"

  UKRAINE_LANG_IL = "//a[contains(.,'укр')]"
  UKRAINE_LANG_TA = "sport_life:ukr_lang"
  UKRAINE_LANG_EP = "EP:sport_life:ukr_lang"

  def click_ukraine_lang(key = nil)
    post_processing key do
      return find(:xpath, ta(UKRAINE_LANG_EP)).click if key == :ep
      return find(:xpath, UKRAINE_LANG_IL).click if key == :il
      find(:xpath, ta(UKRAINE_LANG_TA, UKRAINE_LANG_IL)).click
    end
  end

  def click_russian_lang(key = nil)
    post_processing key do
      return find(:xpath, ta(RUSSIAN_LANG_EP)).click if key == :ep
      return find(:xpath, RUSSIAN_LANG_IL).click if key == :il
      find(:xpath, ta(RUSSIAN_LANG_TA, RUSSIAN_LANG_IL)).click
    end
  end

end