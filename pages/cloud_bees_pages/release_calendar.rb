require_relative '../page_extension'

class CloudBeesReleasesCalendar < PageExtension

  SELECT_USER_TIMEZONE_IL = ".at-select-header-title"
  SELECT_USER_TIMEZONE_TA = "cloud_bees:releases_calendar:timezone_dropdown"

  SEARCH_TIMEZONE_DROPDOWN_IL = "(//input[contains(@class, 'at-search-collapsable-input')])[2]"
  SEARCH_TIMEZONE_DROPDOWN_TA = "cloud_bees:releases_calendar:search_timezone_dropdown"

  def timezone_name(locator, timezone)
    case locator
      when :il then "//span[contains(@title, '#{timezone}')]"
      when :tl then "cloud_bees:releases_calendar:select_timezone:#{timezone.tr('^A-Za-z0-9_', '')}"
      else p 'Locator type is not set'
    end
  end

  OK_BUTTON_MODAL_IL = ".at-ok-btn"
  OK_BUTTON_MODAL_TA = "cloud_bees:releases_calendar:ok_btn"

  WEEK_TAB_IL = ".fc-agendaWeek-button"
  WEEK_TAB_TA = "cloud_bees:releases_calendar:week_tab"

  DAY_TAB_IL = ".fc-agendaDay-button"
  DAY_TAB_TA = "cloud_bees:releases_calendar:day_tab"

  MONTH_TAB_IL = ".fc-month-button"
  MONTH_TAB_TA = "cloud_bees:releases_calendar:month_tab"


  def click_to_timezone_dropdown(key = nil)
    find_element(key, il_type: :css, tl: SELECT_USER_TIMEZONE_TA, il: SELECT_USER_TIMEZONE_IL, check_path: $check_path).click
  end

  def set_timezone_search_value(key = nil, value)
    find_element(key, il_type: :xpath, tl: SEARCH_TIMEZONE_DROPDOWN_TA, il: SEARCH_TIMEZONE_DROPDOWN_IL, check_path: $check_path).set(value)
  end

  def select_timezone(key = nil, timezone)
    find_element(key, il_type: :xpath, tl: timezone_name(:tl, timezone), il: timezone_name(:il, timezone), check_path: $check_path).click
  end

  def click_ok_button(key = nil)
    find_element(key, il_type: :css, tl: OK_BUTTON_MODAL_TA, il: OK_BUTTON_MODAL_IL, check_path: $check_path).click
  end

  def click_week_tab_button(key = nil)
    find_element(key, il_type: :css, tl: WEEK_TAB_TA, il: WEEK_TAB_IL, check_path: $check_path).click
  end

  def click_day_tab_button(key = nil)
    find_element(key, il_type: :css, tl: DAY_TAB_TA, il: DAY_TAB_IL, check_path: $check_path).click
  end

  def click_month_tab_button(key = nil)
    find_element(key, il_type: :css, tl: MONTH_TAB_TA, il: MONTH_TAB_IL, check_path: $check_path).click
  end
end
