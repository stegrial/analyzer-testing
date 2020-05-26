require_relative '../page_extension'

class CloudBeesChangeHistory < PageExtension

  SECOND_ITEM_IN_TABLE_IL = "(//span[contains(@title, 'Access')])[1]"
  SECOND_ITEM_IN_TABLE_TA = 'cloud_bees:change_history:second_item'

  DROPDOWN_LAST_CHANGES_IL = "//div[text()='Last changes']"
  DROPDOWN_LAST_CHANGES_TA = 'cloud_bees:change_history:dropdown_last_changes'

  PAST_24_HOURS_IL = "//span[text()='Past 24 hours']"
  PAST_24_HOURS_TA = 'cloud_bees:change_history:part_24_hours'

  DROPDOWN_PAST_24_HOURS_IL = "//div[text()='Past 24 hours']"
  DROPDOWN_PAST_24_HOURS_TA = 'cloud_bees:change_history:dropdown_part_24_hours'

  BETWEEN_BTN_IL = "//span[text()='Between...']"
  BETWEEN_BTN_TA = 'cloud_bees:change_history:between_btn'

  SET_HOURS_TIME_IL = "(//input[contains(@class, 'hours-input')])[1]"
  SET_HOURS_TIME_TA = 'cloud_bees:change_history:set_hours_time'

  SET_MINUTES_TIME_IL = "(//input[contains(@class, 'minutes-input')])[1]"
  SET_MINUTES_TIME_TA = 'cloud_bees:change_history:set_minutes_time'

  CONFIRM_TIME_IL = "(//div[text()='OK'])[1]"
  CONFIRM_TIME_TA = 'cloud_bees:change_history:confirm_time'

  AND_SET_HOURS_TIME_IL = "(//input[contains(@class, 'hours-input')])[2]"
  AND_SET_HOURS_TIME_TA = 'cloud_bees:change_history:and_set_hours_time'

  AND_SET_MINUTES_TIME_IL = "(//input[contains(@class, 'minutes-input')])[2]"
  AND_SET_MINUTES_TIME_TA = 'cloud_bees:change_history:and_set_minutes_time'

  AND_CONFIRM_TIME_IL = "(//div[text()='OK'])[2]"
  AND_CONFIRM_TIME_TA = 'cloud_bees:change_history:and_confirm_time'

  SEARCH_BTN_IL = "//div[@title='Search']"
  SEARCH_BTN_TA = 'cloud_bees:change_history:search_btn'

  LAST_CHANGES_DROPDOWN_IL = "(//span[text()='Last changes'])[1]"
  LAST_CHANGES_DROPDOWN_TA = 'cloud_bees:change_history:last_changes_dropdown'

  PAST_3_DAYS_IL = "//span[text()='Past 3 Days']"
  PAST_3_DAYS_TA = 'cloud_bees:change_history:past_3_days'

  ALL_DROPDOWN_IL = "//span[text()='All...']"
  ALL_DROPDOWN_TA = 'cloud_bees:change_history:all_dropdown'

  ALL_OBJECTS_IL = "//span[text()='All Objects']"
  ALL_OBJECTS_TA = 'cloud_bees:change_history:all_object'

  APPLICATION_IL = "(//span[text()='Application'])[1]"
  APPLICATION_TA = 'cloud_bees:change_history:application'

  COMPONENT_IL = "(//span[text()='Component'])[1]"
  COMPONENT_TA = 'cloud_bees:change_history:component'

  SEARCH_FIELD_IL = "//input[@class='search-input change-history-search-input at-history-search-input']"
  SEARCH_FIELD_TA = 'cloud_bees:change_history:search_field'


  def click_second_item_in_table(key = nil)
    find_element(key, il_type: :xpath, tl: SECOND_ITEM_IN_TABLE_TA, il: SECOND_ITEM_IN_TABLE_IL, check_path: $check_path).click
  end

  def click_dropdown_last_changes(key = nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_LAST_CHANGES_TA, il: DROPDOWN_LAST_CHANGES_IL, check_path: $check_path).click
  end

  def click_past_24_hours(key = nil)
    find_element(key, il_type: :xpath, tl: PAST_24_HOURS_TA, il: PAST_24_HOURS_IL, check_path: $check_path).click
  end

  def click_dropdown_past_24_hours(key = nil)
    find_element(key, il_type: :xpath, tl: DROPDOWN_PAST_24_HOURS_TA, il: DROPDOWN_PAST_24_HOURS_IL, check_path: $check_path).click
  end

  def click_between_btn(key = nil)
    find_element(key, il_type: :xpath, tl: BETWEEN_BTN_TA, il: BETWEEN_BTN_IL, check_path: $check_path).click
  end

  def fill_hours_time(key = nil, hours_time)
    find_element(key, il_type: :xpath, tl: SET_HOURS_TIME_TA, il: SET_HOURS_TIME_IL, check_path: $check_pathL).set(hours_time)
  end

  def fill_minutes_time(key = nil, minutes_time)
    find_element(key, il_type: :xpath, tl: SET_MINUTES_TIME_TA, il: SET_MINUTES_TIME_IL, check_path: $check_path).set(minutes_time)
  end

  def confirm_time(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_TIME_TA, il: CONFIRM_TIME_IL, check_path: $check_path).click
  end

  def fill_and_hours_time(key = nil, hours_time)
    find_element(key, il_type: :xpath, tl: AND_SET_HOURS_TIME_TA, il: AND_SET_HOURS_TIME_IL, check_path: $check_path).set(hours_time)
  end

  def fill_and_minutes_time(key = nil, minutes_time)
    find_element(key, il_type: :xpath, tl: AND_SET_MINUTES_TIME_TA, il: AND_SET_MINUTES_TIME_IL, check_path: $check_path).set(minutes_time)
  end

  def and_confirm_time(key = nil)
    find_element(key, il_type: :xpath, tl: AND_CONFIRM_TIME_TA, il: AND_CONFIRM_TIME_IL, check_path: $check_path).click
  end

  def click_search_btn(key = nil)
    find_element(key, il_type: :xpath, tl: SEARCH_BTN_TA, il: SEARCH_BTN_IL, check_path: $check_path).click
  end

  def click_last_changes_dropdown(key = nil)
    find_element(key, il_type: :xpath, tl: LAST_CHANGES_DROPDOWN_TA, il: LAST_CHANGES_DROPDOWN_IL, check_path: $check_path).click
  end

  def click_past_3_days(key = nil)
    find_element(key, il_type: :xpath, tl: PAST_3_DAYS_TA, il: PAST_3_DAYS_IL, check_path: $check_path).click
  end

  def click_all_dropdown(key = nil)
    find_element(key, il_type: :xpath, tl: ALL_DROPDOWN_TA, il: ALL_DROPDOWN_IL, check_path: $check_path).click
  end

  def click_all_object(key = nil)
    find_element(key, il_type: :xpath, tl: ALL_OBJECTS_TA, il: ALL_OBJECTS_IL, check_path: $check_path).click
  end

  def click_application(key = nil)
    find_element(key, il_type: :xpath, tl: APPLICATION_TA, il: APPLICATION_IL, check_path: $check_path).click
  end

  def click_component(key = nil)
    find_element(key, il_type: :xpath, tl: COMPONENT_TA, il: COMPONENT_IL, check_path: $check_path).click
  end

  def click_on_search_field(key = nil)
    find_element(key, il_type: :xpath, tl: SEARCH_FIELD_TA, il: SEARCH_FIELD_IL, check_path: $check_path).click
  end

end
