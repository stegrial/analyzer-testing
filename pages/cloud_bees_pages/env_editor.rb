require 'spec_helper'

class CloudBeesEnvEditor
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  RESOURCE_TIER_IL = "(//div[@class='tier-inner'])[1]"
  RESOURCE_TIER_TA = 'cloud_bees:env_editor:resource_tier'
  RESOURCE_TIER_EP = 'EP:cloud_bees:env_editor:resource_tier'

  ADD_RESOURCE_BTN_IL = ".at-add-resource"
  ADD_RESOURCE_BTN_TA = "cloud_bees:env_editor:add_resource"
  ADD_RESOURCE_BTN_EP = "EP:cloud_bees:env_editor:add_resource"

  SELECT_RESOURCE_FROM_LIST_IL = "//span[contains(text(), 'resource_for_mapping_test')]"
  SELECT_RESOURCE_FROM_LIST_TA = "cloud_bees:env_editor:resource_from_list"
  SELECT_RESOURCE_FROM_LIST_EP = "EP:cloud_bees:env_editor:resource_from_list"

  MAP_TO_APP_BTN_IL = ".at-hierarchy-nav-setup-environment-map-block"
  MAP_TO_APP_BTN_TA = "cloud_bees:env_editor:map_to_app_hierarchy_menu"
  MAP_TO_APP_BTN_EP = "EP:cloud_bees:env_editor:map_to_app_hierarchy_menu"

  APP_FROM_MAPPING_LIST_IL = "//span[@title='appTest']"
  APP_FROM_MAPPING_LIST_TA = "cloud_bees:env_editor:app_from_maplist"
  APP_FROM_MAPPING_LIST_EP = "EP:cloud_bees:env_editor:app_from_maplist"

  MAPPING_SELECT_BTN_IL = ".at-mapping-select-btn"
  MAPPING_SELECT_BTN_TA = "cloud_bees:env_editor:mapping_select_btn"
  MAPPING_SELECT_BTN_EP = "EP:cloud_bees:env_editor:mapping_select_btn"

  TIER_MAPPING_POPOVER_IL = ".at-popover-not-link-undefined"
  TIER_MAPPING_POPOVER_TA = "cloud_bees:env_editor:tier_map"
  TIER_MAPPING_POPOVER_EP = "EP:cloud_bees:env_editor:tier_map"

  CLOSE_BTN_IL = ".at-ok-btn"
  CLOSE_BTN_TA = "cloud_bees:env_editor:close_btn"
  CLOSE_BTN_EP = "EP:cloud_bees:env_editor:close_btn"


  def click_resource_tier(key = nil)
    return find(ta(RESOURCE_TIER_EP)).click if key == :ep
    return find(:xpath, RESOURCE_TIER_IL).click if key == :il
    find(:xpath, ta(RESOURCE_TIER_TA, RESOURCE_TIER_IL)).click
  end

  def click_to_add_resource(key = nil)
    return find(ta(ADD_RESOURCE_BTN_EP)).click if key == :ep
    return find(:css, ADD_RESOURCE_BTN_IL).click if key == :il
    find(:css, ta(ADD_RESOURCE_BTN_TA, ADD_RESOURCE_BTN_IL)).click
  end

  def select_resource_from_list(key = nil)
    return find(ta(SELECT_RESOURCE_FROM_LIST_EP)).click if key == :ep
    return find(:xpath, SELECT_RESOURCE_FROM_LIST_IL).click if key == :il
    find(:xpath, ta(SELECT_RESOURCE_FROM_LIST_TA, SELECT_RESOURCE_FROM_LIST_IL)).click
  end

  def click_map_to_app_hierarchy_menu(key = nil)
    return find(ta(MAP_TO_APP_BTN_EP)).click if key == :ep
    return find(:css, MAP_TO_APP_BTN_IL).click if key == :il
    find(:css, ta(MAP_TO_APP_BTN_TA, MAP_TO_APP_BTN_IL)).click
  end

  def select_app_from_maplist(key = nil)
    return find(ta(APP_FROM_MAPPING_LIST_EP)).click if key == :ep
    return find(:xpath, APP_FROM_MAPPING_LIST_IL).click if key == :il
    find(:xpath, ta(APP_FROM_MAPPING_LIST_TA, APP_FROM_MAPPING_LIST_IL)).click
  end

  def click_mapping_select_btn(key = nil)
    return find(ta(MAPPING_SELECT_BTN_EP)).click if key == :ep
    return find(:css, MAPPING_SELECT_BTN_IL).click if key == :il
    find(:css, ta(MAPPING_SELECT_BTN_TA, MAPPING_SELECT_BTN_IL)).click
  end

  def click_to_select_tier_for_map(key = nil)
    return find(ta(TIER_MAPPING_POPOVER_EP)).click if key == :ep
    return find(:css, TIER_MAPPING_POPOVER_IL).click if key == :il
    find(:css, ta(TIER_MAPPING_POPOVER_TA, TIER_MAPPING_POPOVER_IL)).click
  end

  def click_to_close_to_close_modal(key = nil)
    return find(ta(CLOSE_BTN_EP)).click if key == :ep
    return find(:css, CLOSE_BTN_IL).click if key == :il
    find(:css, ta(CLOSE_BTN_TA, CLOSE_BTN_IL)).click
  end

end