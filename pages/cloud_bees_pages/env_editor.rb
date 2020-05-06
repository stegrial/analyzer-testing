require 'spec_helper'
require_relative '../page_extension'

class CloudBeesEnvEditor
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  RESOURCE_TIER_IL = "(//div[@class='tier-inner'])[1]"
  RESOURCE_TIER_TA = 'cloud_bees:env_editor:resource_tier'

  ADD_RESOURCE_BTN_IL = ".at-add-resource"
  ADD_RESOURCE_BTN_TA = "cloud_bees:env_editor:add_resource"

  SELECT_RESOURCE_FROM_LIST_IL = "//span[contains(text(), 'resource_for_mapping_test')]"
  SELECT_RESOURCE_FROM_LIST_TA = "cloud_bees:env_editor:resource_from_list"

  MAP_TO_APP_BTN_IL = ".at-hierarchy-nav-setup-environment-map-block"
  MAP_TO_APP_BTN_TA = "cloud_bees:env_editor:map_to_app_hierarchy_menu"

  APPNAME_IN_SEARCH_FIELD_IL = ".at-search-collapsable-input"
  APPNAME_IN_SEARCH_FIELD_TA = "cloud_bees:env_editor:app_from_search"

  APPS_NAME_IN_MAPPING_MODAL_IL = ".ec-grid-primary__row--pointer"
  APPS_NAME_IN_MAPPING_MODAL_TA = "cloud_bees:env_editor:app_from_maplist"

  MAPPING_SELECT_BTN_IL = ".at-mapping-select-btn"
  MAPPING_SELECT_BTN_TA = "cloud_bees:env_editor:mapping_select_btn"

  TIER_MAPPING_POPOVER_IL = ".at-popover-not-link-undefined"
  TIER_MAPPING_POPOVER_TA = "cloud_bees:env_editor:tier_map"

  CLOSE_BTN_IL = ".at-ok-btn"
  CLOSE_BTN_TA = "cloud_bees:env_editor:close_btn"


  def click_resource_tier(key = nil)
    find_element(key, il_type: :xpath, tl: RESOURCE_TIER_TA, il: RESOURCE_TIER_IL).click
  end

  def click_to_add_resource(key = nil)
    find_element(key, il_type: :css, tl: ADD_RESOURCE_BTN_TA, il: ADD_RESOURCE_BTN_IL).click
  end

  def select_resource_from_list(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_RESOURCE_FROM_LIST_TA, il: SELECT_RESOURCE_FROM_LIST_IL).click
  end

  def click_map_to_app_hierarchy_menu(key = nil)
    find_element(key, il_type: :css, tl: MAP_TO_APP_BTN_TA, il: MAP_TO_APP_BTN_IL).click
  end

  def set_app_in_search(key = nil, appName)
    find_element(key, il_type: :css, tl: APPNAME_IN_SEARCH_FIELD_TA, il: APPNAME_IN_SEARCH_FIELD_IL).set(appName)
  end

  def select_app_from_maplist(key = nil)
    find_element(key, il_type: :css, tl: APPS_NAME_IN_MAPPING_MODAL_TA, il: APPS_NAME_IN_MAPPING_MODAL_IL).click
  end

  def click_mapping_select_btn(key = nil)
    find_element(key, il_type: :css, tl: MAPPING_SELECT_BTN_TA, il: MAPPING_SELECT_BTN_IL).click
  end

  def click_to_select_tier_for_map(key = nil)
    find_element(key, il_type: :css, tl: TIER_MAPPING_POPOVER_TA, il: TIER_MAPPING_POPOVER_IL).click
  end

  def click_to_close_to_close_modal(key = nil)
    find_element(key, il_type: :css, tl: CLOSE_BTN_TA, il: CLOSE_BTN_IL).click
  end

end