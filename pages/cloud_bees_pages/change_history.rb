require 'spec_helper'

class CloudBeesChangeHistory
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  SECOND_ITEM_IN_TABLE_IL = "//div[text()='2.']"
  SECOND_ITEM_IN_TABLE_TA = 'cloud_bees:change_history:second_item'
  SECOND_ITEM_IN_TABLE_EP = 'EP:cloud_bees:change_history:second_item'

  DROPDOWN_LAST_CHANGES_IL = "//div[text()='Last changes']"
  DROPDOWN_LAST_CHANGES_TA = 'cloud_bees:change_history:dropdown_last_changes'
  DROPDOWN_LAST_CHANGES_EP = 'EP:cloud_bees:change_history:dropdown_last_changes'

  PAST_24_HOURS_IL = "//span[text()='Past 24 hours']"
  PAST_24_HOURS_TA = 'cloud_bees:change_history:part_24_hours'
  PAST_24_HOURS_EP = 'EP:cloud_bees:change_history:part_24_hours'

  DROPDOWN_PAST_24_HOURS_IL = "//div[text()='Past 24 hours']"
  DROPDOWN_PAST_24_HOURS_TA = 'cloud_bees:change_history:dropdown_part_24_hours'
  DROPDOWN_PAST_24_HOURS_EP = 'EP:cloud_bees:change_history:dropdown_part_24_hours'

  BETWEEN_BTN_IL = "//span[text()='Between...']"
  BETWEEN_BTN_TA = 'cloud_bees:change_history:between_btn'
  BETWEEN_BTN_EP = 'EP:cloud_bees:change_history:between_btn'

  SET_HOURS_TIME_IL = "(//input[contains(@class, 'hours-input')])[1]"
  SET_HOURS_TIME_TA = 'cloud_bees:change_history:set_hours_time'
  SET_HOURS_TIME_EP = 'EP:cloud_bees:change_history:set_hours_time'

  SET_MINUTES_TIME_IL = "(//input[contains(@class, 'minutes-input')])[1]"
  SET_MINUTES_TIME_TA = 'cloud_bees:change_history:set_minutes_time'
  SET_MINUTES_TIME_EP = 'EP:cloud_bees:change_history:set_minutes_time'

  CONFIRM_TIME_IL = "(//div[text()='OK'])[1]"
  CONFIRM_TIME_TA = 'cloud_bees:change_history:confirm_time'
  CONFIRM_TIME_EP = 'EP:cloud_bees:change_history:confirm_time'

  AND_SET_HOURS_TIME_IL = "(//input[contains(@class, 'hours-input')])[2]"
  AND_SET_HOURS_TIME_TA = 'cloud_bees:change_history:and_set_hours_time'
  AND_SET_HOURS_TIME_EP = 'EP:cloud_bees:change_history:and_set_hours_time'

  AND_SET_MINUTES_TIME_IL = "(//input[contains(@class, 'minutes-input')])[2]"
  AND_SET_MINUTES_TIME_TA = 'cloud_bees:change_history:and_set_minutes_time'
  AND_SET_MINUTES_TIME_EP = 'EP:cloud_bees:change_history:and_set_minutes_time'

  AND_CONFIRM_TIME_IL = "(//div[text()='OK'])[2]"
  AND_CONFIRM_TIME_TA = 'cloud_bees:change_history:and_confirm_time'
  AND_CONFIRM_TIME_EP = 'EP:cloud_bees:change_history:and_confirm_time'

  SEARCH_BTN_IL = "//div[@title='Search']"
  SEARCH_BTN_TA = 'cloud_bees:change_history:search_btn'
  SEARCH_BTN_EP = 'EP:cloud_bees:change_history:search_btn'

  LAST_CHANGES_DROPDOWN_IL = "(//span[text()='Last changes'])[1]"
  LAST_CHANGES_DROPDOWN_TA = 'cloud_bees:change_history:last_changes_dropdown'
  LAST_CHANGES_DROPDOWN_EP = 'EP:cloud_bees:change_history:last_changes_dropdown'

  PAST_3_DAYS_IL = "//span[text()='Past 3 Days']"
  PAST_3_DAYS_TA = 'cloud_bees:change_history:past_3_days'
  PAST_3_DAYS_EP = 'EP:cloud_bees:change_history:past_3_days'

  ALL_DROPDOWN_IL = "//span[text()='All...']"
  ALL_DROPDOWN_TA = 'cloud_bees:change_history:all_dropdown'
  ALL_DROPDOWN_EP = 'EP:cloud_bees:change_history:all_dropdown'

  ALL_OBJECTS_IL = "//span[text()='All Objects']"
  ALL_OBJECTS_TA = 'cloud_bees:change_history:all_object'
  ALL_OBJECTS_EP = 'EP:cloud_bees:change_history:all_object'

  APPLICATION_IL = "(//span[text()='Application'])[1]"
  APPLICATION_TA = 'cloud_bees:change_history:application'
  APPLICATION_EP = 'EP:cloud_bees:change_history:application'

  COMPONENT_IL = "//span[text()='Component']"
  COMPONENT_TA = 'cloud_bees:change_history:component'
  COMPONENT_EP = 'EP:cloud_bees:change_history:component'

  SEARCH_FIELD_IL = "//input[@class='search-input change-history-search-input at-history-search-input']"
  SEARCH_FIELD_TA = 'cloud_bees:change_history:search_field'
  SEARCH_FIELD_EP = 'EP:cloud_bees:change_history:search_field'


  def click_second_item_in_table(key = nil)
    return find(ta(SECOND_ITEM_IN_TABLE_EP)).click if key == :ep
    return find(:xpath, SECOND_ITEM_IN_TABLE_IL).click if key == :il
    find(:xpath, ta(SECOND_ITEM_IN_TABLE_TA, SECOND_ITEM_IN_TABLE_IL)).click
  end

  def click_dropdown_last_changes(key = nil)
    return find(ta(DROPDOWN_LAST_CHANGES_EP)).click if key == :ep
    return find(:xpath, DROPDOWN_LAST_CHANGES_IL).click if key == :il
    find(:xpath, ta(DROPDOWN_LAST_CHANGES_TA, DROPDOWN_LAST_CHANGES_IL)).click
  end

  def click_past_24_hours(key = nil)
    return find(ta(PAST_24_HOURS_EP)).click if key == :ep
    return find(:xpath, PAST_24_HOURS_IL).click if key == :il
    find(:xpath, ta(PAST_24_HOURS_TA, PAST_24_HOURS_IL)).click
  end

  def click_dropdown_past_24_hours(key = nil)
    return find(ta(DROPDOWN_PAST_24_HOURS_EP)).click if key == :ep
    return find(:xpath, DROPDOWN_PAST_24_HOURS_IL).click if key == :il
    find(:xpath, ta(DROPDOWN_PAST_24_HOURS_TA, DROPDOWN_PAST_24_HOURS_IL)).click
  end

  def click_between_btn(key = nil)
    return find(ta(BETWEEN_BTN_EP)).click if key == :ep
    return find(:xpath, BETWEEN_BTN_IL).click if key == :il
    find(:xpath, ta(BETWEEN_BTN_TA, BETWEEN_BTN_IL)).click
  end

  def fill_hours_time(key = nil, hours_time)
    return find(ta(SET_HOURS_TIME_EP)).set(hours_time) if key == :ep
    return find(:xpath, SET_HOURS_TIME_IL).set(hours_time) if key == :il
    find(:xpath, ta(SET_HOURS_TIME_TA, SET_HOURS_TIME_IL)).set(hours_time)
  end

  def fill_minutes_time(key = nil, minutes_time)
    return find(ta(SET_MINUTES_TIME_EP)).set(minutes_time) if key == :ep
    return find(:xpath, SET_MINUTES_TIME_IL).set(minutes_time) if key == :il
    find(:xpath, ta(SET_MINUTES_TIME_TA, SET_MINUTES_TIME_IL)).set(minutes_time)
  end

  def confirm_time(key = nil)
    return find(ta(CONFIRM_TIME_EP)).click if key == :ep
    return find(:xpath, CONFIRM_TIME_IL).click if key == :il
    find(:xpath, ta(CONFIRM_TIME_TA, CONFIRM_TIME_IL)).click
  end

  def fill_and_hours_time(key = nil, hours_time)
    return find(ta(AND_SET_HOURS_TIME_EP)).set(hours_time) if key == :ep
    return find(:xpath, AND_SET_HOURS_TIME_IL).set(hours_time) if key == :il
    find(:xpath, ta(AND_SET_HOURS_TIME_TA, AND_SET_HOURS_TIME_IL)).set(hours_time)
  end

  def fill_and_minutes_time(key = nil, minutes_time)
    return find(ta(AND_SET_MINUTES_TIME_EP)).set(minutes_time) if key == :ep
    return find(:xpath, AND_SET_MINUTES_TIME_IL).set(minutes_time) if key == :il
    find(:xpath, ta(AND_SET_MINUTES_TIME_TA, AND_SET_MINUTES_TIME_IL)).set(minutes_time)
  end

  def and_confirm_time(key = nil)
    return find(ta(AND_CONFIRM_TIME_EP)).click if key == :ep
    return find(:xpath, AND_CONFIRM_TIME_IL).click if key == :il
    find(:xpath, ta(AND_CONFIRM_TIME_TA, AND_CONFIRM_TIME_IL)).click
  end

  def click_search_btn(key = nil)
    return find(ta(SEARCH_BTN_EP)).click if key == :ep
    return find(:xpath, SEARCH_BTN_IL).click if key == :il
    find(:xpath, ta(SEARCH_BTN_TA, SEARCH_BTN_IL)).click
  end

  def click_last_changes_dropdown(key = nil)
    return find(ta(LAST_CHANGES_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, LAST_CHANGES_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(LAST_CHANGES_DROPDOWN_TA, LAST_CHANGES_DROPDOWN_IL)).click
  end

  def click_past_3_days(key = nil)
    return find(ta(PAST_3_DAYS_EP)).click if key == :ep
    return find(:xpath, PAST_3_DAYS_IL).click if key == :il
    find(:xpath, ta(PAST_3_DAYS_TA, PAST_3_DAYS_IL)).click
  end

  def click_all_dropdown(key = nil)
    return find(ta(ALL_DROPDOWN_EP)).click if key == :ep
    return find(:xpath, ALL_DROPDOWN_IL).click if key == :il
    find(:xpath, ta(ALL_DROPDOWN_TA, ALL_DROPDOWN_IL)).click
  end

  def click_all_object(key = nil)
    return find(ta(ALL_OBJECTS_EP)).click if key == :ep
    return find(:xpath, ALL_OBJECTS_IL).click if key == :il
    find(:xpath, ta(ALL_OBJECTS_TA, ALL_OBJECTS_IL)).click
  end

  def click_application(key = nil)
    return find(ta(APPLICATION_EP)).click if key == :ep
    return find(:xpath, APPLICATION_IL).click if key == :il
    find(:xpath, ta(APPLICATION_TA, APPLICATION_IL)).click
  end

  def click_component(key = nil)
    return find(ta(COMPONENT_EP)).click if key == :ep
    return find(:xpath, COMPONENT_IL).click if key == :il
    find(:xpath, ta(COMPONENT_TA, COMPONENT_IL)).click
  end

  def click_on_search_field(key = nil)
    return find(ta(SEARCH_FIELD_EP)).click if key == :ep
    return find(:xpath, SEARCH_FIELD_IL).click if key == :il
    find(:xpath, ta(SEARCH_FIELD_TA, SEARCH_FIELD_IL)).click
  end
end
