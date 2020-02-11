require 'spec_helper'
require_relative '../../helpers/special_methods'

class CloudBeesEnvEditor
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

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

  APPNAME_IN_SEARCH_FIELD_IL = ".at-search-collapsable-input"
  APPNAME_IN_SEARCH_FIELD_TA = "cloud_bees:env_editor:app_from_search"
  APPNAME_IN_SEARCH_FIELD_EP = "EP:cloud_bees:env_editor:app_from_search"

  APPS_NAME_IN_MAPPING_MODAL_IL = ".ec-grid-primary__row--pointer"
  APPS_NAME_IN_MAPPING_MODAL_TA = "cloud_bees:env_editor:app_from_maplist"
  APPS_NAME_IN_MAPPING_MODAL_EP = "EP:cloud_bees:env_editor:app_from_maplist"

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
    post_processing key do
      return find(ta(RESOURCE_TIER_EP)).click if key == :ep
      return find(:xpath, RESOURCE_TIER_IL).click if key == :il
      find(:xpath, ta(RESOURCE_TIER_TA, RESOURCE_TIER_IL)).click
    end
  end

  def click_to_add_resource(key = nil)
    post_processing key do
      return find(ta(ADD_RESOURCE_BTN_EP)).click if key == :ep
      return find(:css, ADD_RESOURCE_BTN_IL).click if key == :il
      find(:css, ta(ADD_RESOURCE_BTN_TA, ADD_RESOURCE_BTN_IL)).click
    end
  end

  def select_resource_from_list(key = nil)
    post_processing key do
      return find(ta(SELECT_RESOURCE_FROM_LIST_EP)).click if key == :ep
      return find(:xpath, SELECT_RESOURCE_FROM_LIST_IL).click if key == :il
      find(:xpath, ta(SELECT_RESOURCE_FROM_LIST_TA, SELECT_RESOURCE_FROM_LIST_IL)).click
    end
  end

  def click_map_to_app_hierarchy_menu(key = nil)
    post_processing key do
      return find(ta(MAP_TO_APP_BTN_EP)).click if key == :ep
      return find(:css, MAP_TO_APP_BTN_IL).click if key == :il
      find(:css, ta(MAP_TO_APP_BTN_TA, MAP_TO_APP_BTN_IL)).click
    end
  end

  def set_app_in_search(key = nil, appName)
    post_processing key do
      return find(ta(APPNAME_IN_SEARCH_FIELD_EP)).set(appName) if key == :ep
      return find(:css, APPNAME_IN_SEARCH_FIELD_IL).set(appName) if key == :il
      find(:css, ta(APPNAME_IN_SEARCH_FIELD_TA, APPNAME_IN_SEARCH_FIELD_IL)).set(appName)
    end
  end

  def select_app_from_maplist(key = nil)
    post_processing key do
      return find(ta(APPS_NAME_IN_MAPPING_MODAL_EP)).click if key == :ep
      return find(:css, APPS_NAME_IN_MAPPING_MODAL_IL).click if key == :il
      find(:css, ta(APPS_NAME_IN_MAPPING_MODAL_TA, APPS_NAME_IN_MAPPING_MODAL_IL)).click
    end
  end
  def click_mapping_select_btn(key = nil)
    post_processing key do
      return find(ta(MAPPING_SELECT_BTN_EP)).click if key == :ep
      return find(:css, MAPPING_SELECT_BTN_IL).click if key == :il
      find(:css, ta(MAPPING_SELECT_BTN_TA, MAPPING_SELECT_BTN_IL)).click
    end
  end

  def click_to_select_tier_for_map(key = nil)
    post_processing key do
      return find(ta(TIER_MAPPING_POPOVER_EP)).click if key == :ep
      return find(:css, TIER_MAPPING_POPOVER_IL).click if key == :il
      find(:css, ta(TIER_MAPPING_POPOVER_TA, TIER_MAPPING_POPOVER_IL)).click
    end
  end

  def click_to_close_to_close_modal(key = nil)
    post_processing key do
      return find(ta(CLOSE_BTN_EP)).click if key == :ep
      return find(:css, CLOSE_BTN_IL).click if key == :il
      find(:css, ta(CLOSE_BTN_TA, CLOSE_BTN_IL)).click
    end
  end

end