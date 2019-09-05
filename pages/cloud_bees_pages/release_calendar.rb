require 'spec_helper'

class CloudBeesReleasesCalendar
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers


  SELECT_USER_TIMEZONE_IL = ".at-select-header-title"
  SELECT_USER_TIMEZONE_TA = "cloud_bees:releases_calendar:timezone_dropdown"
  SELECT_USER_TIMEZONE_EP = "EP:cloud_bees:releases_calendar:timezone_dropdown"

  SEARCH_TIMEZONE_DROPDOWN_IL = "(//input[contains(@class, 'at-search-collapsable-input')])[2]"
  SEARCH_TIMEZONE_DROPDOWN_TA = "cloud_bees:releases_calendar:search_timezone_dropdown"
  SEARCH_TIMEZONE_DROPDOWN_EP = "EP:cloud_bees:releases_calendar:search_timezone_dropdown"

  def timezone_name(locator, timezone)
    case locator
      when :il then "//span[contains(@title, '#{timezone}')]"
      when :ta then "cloud_bees:releases_calendar:select_timezone:#{timezone.tr('^A-Za-z0-9_', '')}"
      when :ep then "EP:cloud_bees:releases_calendar:select_timezone:#{timezone.tr('^A-Za-z0-9_', '')}"
      else p 'Locator type is not set'
    end
  end

  OK_BUTTON_MODAL_IL = ".at-ok-btn"
  OK_BUTTON_MODAL_TA = "cloud_bees:releases_calendar:ok_btn"
  OK_BUTTON_MODAL_EP = "EP:cloud_bees:releases_calendar:ok_btn"

  WEEK_TAB_IL = ".fc-agendaWeek-button"
  WEEK_TAB_TA = "cloud_bees:releases_calendar:week_tab"
  WEEK_TAB_EP = "EP:cloud_bees:releases_calendar:week_tab"

  DAY_TAB_IL = ".fc-agendaDay-button"
  DAY_TAB_TA = "cloud_bees:releases_calendar:day_tab"
  DAY_TAB_EP = "EP:cloud_bees:releases_calendar:day_tab"

  MONTH_TAB_IL = ".fc-month-button"
  MONTH_TAB_TA = "cloud_bees:releases_calendar:month_tab"
  MONTH_TAB_EP = "EP:cloud_bees:releases_calendar:month_tab"


  def click_to_timezone_dropdown(key = nil)
    return find(ta(SELECT_USER_TIMEZONE_EP)).click if key == :ep
    return find(:css, SELECT_USER_TIMEZONE_IL).click if key == :il
    find(:css, ta(SELECT_USER_TIMEZONE_TA, SELECT_USER_TIMEZONE_IL)).click
  end

  def set_timezone_search_value(key = nil, value)
    return find(ta(SEARCH_TIMEZONE_DROPDOWN_EP)).set(value) if key == :ep
    return find(:xpath, SEARCH_TIMEZONE_DROPDOWN_IL).set(value) if key == :il
    find(:xpath, ta(SEARCH_TIMEZONE_DROPDOWN_TA, SEARCH_TIMEZONE_DROPDOWN_IL)).set(value)
  end

  def select_timezone(key = nil, timezone)
    return find(ta(timezone_name(:ep, timezone))).click if key == :ep
    return find(:xpath, timezone_name(:il, timezone)).click if key == :il
    find(:xpath, ta(timezone_name(:ta, timezone), timezone_name(:il, timezone))).click
  end

  def click_ok_button(key = nil)
    return find(ta(OK_BUTTON_MODAL_EP)).click if key == :ep
    return find(:css, OK_BUTTON_MODAL_IL).click if key == :il
    find(:css, ta(OK_BUTTON_MODAL_TA, OK_BUTTON_MODAL_IL)).click
  end

  def click_week_tab_button(key = nil)
    return find(ta(WEEK_TAB_EP)).click if key == :ep
    return find(:css, WEEK_TAB_IL).click if key == :il
    find(:css, ta(WEEK_TAB_TA, WEEK_TAB_IL)).click
  end

  def click_day_tab_button(key = nil)
    return find(ta(DAY_TAB_EP)).click if key == :ep
    return find(:css, DAY_TAB_IL).click if key == :il
    find(:css, ta(DAY_TAB_TA, DAY_TAB_IL)).click
  end

  def click_month_tab_button(key = nil)
    return find(ta(MONTH_TAB_EP)).click if key == :ep
    return find(:css, MONTH_TAB_IL).click if key == :il
    find(:css, ta(MONTH_TAB_TA, MONTH_TAB_IL)).click
  end
end