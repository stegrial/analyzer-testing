require 'spec_helper'

class CloudBeesReleasesCalandar
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers


  SELECT_USER_TIMEZONE_IL = ".at-select-header-title"
  SELECT_USER_TIMEZONE_TA = "cloud_bees:releases_calendar:timezone_dropdown"
  SELECT_USER_TIMEZONE_EP = "EP:cloud_bees:releases_calendar:timezone_dropdown"

  SEARCH_TIMEZONE_DROPDOWN_IL = "(//input[contains(@class, 'at-search-collapsable-input')])[2]"
  SEARCH_TIMEZONE_DROPDOWN_TA = "cloud_bees:releases_calendar:search_timezone_dropdown"
  SEARCH_TIMEZONE_DROPDOWN_EP = "EP:cloud_bees:releases_calendar:search_timezone_dropdown"

  SELECT_KIEV_TIMEZONE_IL = "//span[contains(@title, '(GMT+03:00 EEST) Europe/Kiev')]"
  SELECT_KIEV_TIMEZONE_TA = "cloud_bees:releases_calendar:select_timezone"
  SELECT_KIEV_TIMEZONE_EP = "EP:cloud_bees:releases_calendar:select_timezone"

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

  def set_into_search_timezone_dropdown(key = nil)
    return find(ta(SEARCH_TIMEZONE_DROPDOWN_EP)).set('Kiev') if key == :ep
    return find(:xpath, SEARCH_TIMEZONE_DROPDOWN_IL).set('Kiev') if key == :il
    find(:xpath, ta(SEARCH_TIMEZONE_DROPDOWN_TA, SEARCH_TIMEZONE_DROPDOWN_IL)).set('Kiev')
  end

  def click_to_select_timezone(key = nil)
    return find(ta(SELECT_KIEV_TIMEZONE_EP)).click if key == :ep
    return find(:xpath, SELECT_KIEV_TIMEZONE_IL).click if key == :il
    find(:xpath, ta(SELECT_KIEV_TIMEZONE_TA, SELECT_KIEV_TIMEZONE_IL)).click
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