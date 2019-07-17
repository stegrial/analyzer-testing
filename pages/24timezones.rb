require 'spec_helper'

class TimeZones
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  RUSSIAN_LANG_IL = "//div/*[text()='ru']"
  RUSSIAN_LANG_TA = "24timezones:ru_lang"
  RUSSIAN_LANG_EP = "EP:24timezones:ru_lang"

  ENGLISH_LANG_IL = "//a[contains(.,'en')]"
  ENGLISH_LANG_TA = "24timezones:en_lang"
  ENGLISH_LANG_EP = "EP:24timezones:en_lang"

  def click_english_lang(key = nil)
    return find(:xpath, ta(ENGLISH_LANG_EP)).click if key == :ep
    return find(:xpath, ENGLISH_LANG_IL).click if key == :il
    find(:xpath, ta(ENGLISH_LANG_TA, ENGLISH_LANG_IL)).click
  end

  def click_russian_lang(key = nil)
    return find(:xpath, ta(RUSSIAN_LANG_EP)).click if key == :ep
    return find(:xpath, RUSSIAN_LANG_IL).click if key == :il
    find(:xpath, ta(RUSSIAN_LANG_TA, RUSSIAN_LANG_IL)).click
  end

end