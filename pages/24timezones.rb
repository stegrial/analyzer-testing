require 'spec_helper'
require_relative 'page_extension'

class TimeZones
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  RUSSIAN_LANG_IL = "//div/*[text()='ru']"
  RUSSIAN_LANG_TA = "24timezones:ru_lang"
  RUSSIAN_LANG_EP = "EP:24timezones:ru_lang"

  def click_russian_lang(key = nil)
    post_processing key do
      return find(:xpath, ta(RUSSIAN_LANG_EP)).click if key == :ep
      return find(:xpath, RUSSIAN_LANG_IL).click if key == :il
      find(:xpath, ta(RUSSIAN_LANG_TA, RUSSIAN_LANG_IL)).click
    end
  end

end