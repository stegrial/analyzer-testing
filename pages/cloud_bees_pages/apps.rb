require 'spec_helper'

class CloudBeesApps
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  APPLICATION_FROM_LIST_IL = "//a[@title='app_with_artifacts_gwt_field(scope)']"
  APPLICATION_FROM_LIST_TA = "cloud_bees:apps:application_from_list"
  APPLICATION_FROM_LIST_EP = "EP:cloud_bees:apps:application_from_list"

  NEW_APPLICATION_BTN_IL = "//div[text()='New']"
  NEW_APPLICATION_BTN_TA = 'cloud_bees:apps:new_application'
  NEW_APPLICATION_BTN_EP = 'EP:cloud_bees:apps:new_application'

  CREATE_NEW_APPLICATION_IL = "//div[@class='object-create__type' and text()='Create New...']"
  CREATE_NEW_APPLICATION_TA = 'cloud_bees:apps:create_new_application'
  CREATE_NEW_APPLICATION_EP = 'EP:cloud_bees:apps:create_new_application'

  APPLICATION_NAME_IL = "//input[@class='Form__input at-app-name-input']"
  APPLICATION_NAME_TA = 'cloud_bees:apps:application_name'
  APPLICATION_NAME_EP = 'EP:cloud_bees:apps:application_name'

  SELECT_PROJECT_IL = "//div[text()='Select Project']"
  SELECT_PROJECT_TA = 'cloud_bees:apps:select_project'
  SELECT_PROJECT_EP = 'EP:cloud_bees:apps:select_project'

  SELECT_DEFAULT_PROJECT_IL = "//div[text()='1']//following-sibling::div[@title='Default']"
  SELECT_DEFAULT_PROJECT_TA = 'cloud_bees:apps:select_default_project'
  SELECT_DEFAULT_PROJECT_EP = 'EP:cloud_bees:apps:select_default_project'

  CONFIRM_NEW_APPLICATION_IL = "//div[text()='OK']"
  CONFIRM_NEW_APPLICATION_TA = 'cloud_bees:apps:confirm_new_application'
  CONFIRM_NEW_APPLICATION_EP = 'EP:cloud_bees:apps:confirm_new_application'

  COMPONENT_TIER_IL = "(//div[@class='tier-inner'])[1]"
  COMPONENT_TIER_TA = 'cloud_bees:apps:component_tier'
  COMPONENT_TIER_EP = 'EP:cloud_bees:apps:component_tier'

  CREATE_NEW_COMPONENT_IL = "//div[@class='object-create__type']//span[text()='Create New...']"
  CREATE_NEW_COMPONENT_TA = 'cloud_bees:apps:create_new_component'
  CREATE_NEW_COMPONENT_EP = 'EP:cloud_bees:apps:create_new_component'

  COMPONENT_NAME_IL = "//input[@class='Form__input at-component-name-input']"
  COMPONENT_NAME_TA = 'cloud_bees:apps:component_name'
  COMPONENT_NAME_EP = 'EP:cloud_bees:apps:component_name'

  COMPONENT_NEXT_IL = "//div[text()='Next']"
  COMPONENT_NEXT_TA = 'cloud_bees:apps:component_next'
  COMPONENT_NEXT_EP = 'EP:cloud_bees:apps:component_next'

  CONTENT_LOCATION_IL = "//div[text()='Content location']"
  CONTENT_LOCATION_TA = 'cloud_bees:apps:content_location'
  CONTENT_LOCATION_EP = 'EP:cloud_bees:apps:content_location'

  SELECT_EC_ARTIFACT_IL = "//span[text()='EC-Artifact']"
  SELECT_EC_ARTIFACT_TA = 'cloud_bees:apps:select_ec_artifact'
  SELECT_EC_ARTIFACT_EP = 'EP:cloud_bees:apps:select_ec_artifact'

  ARTIFACT_NAME_IL = "//input[@class='gwt-SuggestBox GAMBAOGN-']"
  ARTIFACT_NAME_TA = 'cloud_bees:apps:artifact_name'
  ARTIFACT_NAME_EP = 'EP:cloud_bees:apps:artifact_name'

  CONFIRM_NEW_ARTIFACT_IL = "//div[text()='OK']"
  CONFIRM_NEW_ARTIFACT_TA = 'cloud_bees:apps:confirm_new_artifact'
  CONFIRM_NEW_ARTIFACT_EP = 'EP:cloud_bees:apps:confirm_new_artifact'

  FIND_APPLICATION_FIELD_IL = "//input[@placeholder='Find...']"
  FIND_APPLICATION_FIELD_TA = 'cloud_bees:apps:find_application_field'
  FIND_APPLICATION_FIELD_EP = 'EP:cloud_bees:apps:find_application_field'

  CHOOSE_APPLICATION_IL = "//div[contains(@class, 'object at-application-list') and .//a[@title='appTest']]"
  CHOOSE_APPLICATION_TA = 'cloud_bees:apps:choose_application'
  CHOOSE_APPLICATION_EP = 'EP:cloud_bees:apps:choose_application'

  DELETE_APPLICATION_IL = "//span[text()='Delete']"
  DELETE_APPLICATION_TA = 'cloud_bees:apps:delete_application'
  DELETE_APPLICATION_EP = 'EP:cloud_bees:apps:delete_application'

  CONFIRM_DELETE_APPLICATION_IL = "//div[text()='OK']"
  CONFIRM_DELETE_APPLICATION_TA = 'cloud_bees:apps:confirm_delete_application'
  CONFIRM_DELETE_APPLICATION_EP = 'EP:cloud_bees:apps:confirm_delete_application'


  def select_application_from_list(key = nil)
    return find(ta(APPLICATION_FROM_LIST_EP)).click if key == :ep
    return find(:xpath, APPLICATION_FROM_LIST_IL).click if key == :il
    find(:xpath, ta(APPLICATION_FROM_LIST_TA, APPLICATION_FROM_LIST_IL)).click
  end

  def click_new_application(key = nil)
    return find(ta(NEW_APPLICATION_BTN_EP)).click if key == :ep
    return find(:xpath, NEW_APPLICATION_BTN_IL).click if key == :il
    find(:xpath, ta(NEW_APPLICATION_BTN_TA, NEW_APPLICATION_BTN_IL)).click
  end

  def create_new_application(key = nil)
    return find(ta(CREATE_NEW_APPLICATION_EP)).click if key == :ep
    return find(:xpath, CREATE_NEW_APPLICATION_IL).click if key == :il
    find(:xpath, ta(CREATE_NEW_APPLICATION_TA, CREATE_NEW_APPLICATION_IL)).click
  end

  def fill_application_name_field(key = nil, appname)
    return find(ta(APPLICATION_NAME_EP)).set(appname) if key == :ep
    return find(:xpath, APPLICATION_NAME_IL).set(appname) if key == :il
    find(:xpath, ta(APPLICATION_NAME_TA, APPLICATION_NAME_IL)).set(appname)
  end

  def click_on_select_project(key = nil)
    return find(ta(SELECT_PROJECT_EP)).click if key == :ep
    return find(:xpath, SELECT_PROJECT_IL).click if key == :il
    find(:xpath, ta(SELECT_PROJECT_TA, SELECT_PROJECT_IL)).click
  end

  def select_default_project(key = nil)
    return find(ta(SELECT_DEFAULT_PROJECT_EP)).click if key == :ep
    return find(:xpath, SELECT_DEFAULT_PROJECT_IL).click if key == :il
    find(:xpath, ta(SELECT_DEFAULT_PROJECT_TA, SELECT_DEFAULT_PROJECT_IL)).click
  end

  def confirm_create_new_application(key = nil)
    return find(ta(CONFIRM_NEW_APPLICATION_EP)).click if key == :ep
    return find(:xpath, CONFIRM_NEW_APPLICATION_IL).click if key == :il
    find(:xpath, ta(CONFIRM_NEW_APPLICATION_TA, CONFIRM_NEW_APPLICATION_IL)).click
  end

  def click_component_tier(key = nil)
    return find(ta(COMPONENT_TIER_EP)).click if key == :ep
    return find(:xpath, COMPONENT_TIER_IL).click if key == :il
    find(:xpath, ta(COMPONENT_TIER_TA, COMPONENT_TIER_IL)).click
  end

  def create_new_component(key = nil)
    return find(ta(CREATE_NEW_COMPONENT_EP)).click if key == :ep
    return find(:xpath, CREATE_NEW_COMPONENT_IL).click if key == :il
    find(:xpath, ta(CREATE_NEW_COMPONENT_TA, CREATE_NEW_COMPONENT_IL)).click
  end

  def fill_component_name_field(key = nil, compname)
    return find(ta(COMPONENT_NAME_EP)).set(compname) if key == :ep
    return find(:xpath, COMPONENT_NAME_IL).set(compname) if key == :il
    find(:xpath, ta(COMPONENT_NAME_TA, COMPONENT_NAME_IL)).set(compname)
  end

  def click_component_next(key = nil)
    return find(ta(COMPONENT_NEXT_EP)).click if key == :ep
    return find(:xpath, COMPONENT_NEXT_IL).click if key == :il
    find(:xpath, ta(COMPONENT_NEXT_TA, COMPONENT_NEXT_IL)).click
  end

  def click_on_content_location(key = nil)
    return find(ta(CONTENT_LOCATION_EP)).click if key == :ep
    return find(:xpath, CONTENT_LOCATION_IL).click if key == :il
    find(:xpath, ta(CONTENT_LOCATION_TA, CONTENT_LOCATION_IL)).click
  end

  def select_ec_artifact(key = nil)
    return find(ta(SELECT_EC_ARTIFACT_TA)).click if key == :ep
    return find(:xpath, SELECT_EC_ARTIFACT_IL).click if key == :il
    find(:xpath, ta(SELECT_EC_ARTIFACT_TA, SELECT_EC_ARTIFACT_IL)).click
  end

  def fill_artifact_name_field(key = nil, artname)
    return find(ta(ARTIFACT_NAME_EP)).set(artname) if key == :ep
    return find(:xpath, ARTIFACT_NAME_IL).set(artname) if key == :il
    find(:xpath, ta(ARTIFACT_NAME_TA, ARTIFACT_NAME_IL)).set(artname)
  end

  def confirm_new_artifact(key = nil)
    return find(ta(CONFIRM_NEW_ARTIFACT_EP)).click if key == :ep
    return find(:xpath, CONFIRM_NEW_ARTIFACT_IL).click if key == :il
    find(:xpath, ta(CONFIRM_NEW_ARTIFACT_TA, CONFIRM_NEW_ARTIFACT_IL)).click
  end

  def find_application_name_field(key = nil, appname)
    return find(ta(FIND_APPLICATION_FIELD_EP)).set(appname) if key == :ep
    return find(:xpath, FIND_APPLICATION_FIELD_IL).set(appname) if key == :il
    find(:xpath, ta(FIND_APPLICATION_FIELD_TA, FIND_APPLICATION_FIELD_IL)).set(appname)
  end

  def choose_application(key = nil)
    return find(ta(CHOOSE_APPLICATION_EP)).click if key == :ep
    return find(:xpath, CHOOSE_APPLICATION_IL).click if key == :il
    find(:xpath, ta(CHOOSE_APPLICATION_TA, CHOOSE_APPLICATION_IL)).click
  end

  def delete_application(key = nil)
    return find(ta(DELETE_APPLICATION_EP)).click if key == :ep
    return find(:xpath, DELETE_APPLICATION_IL).click if key == :il
    find(:xpath, ta(DELETE_APPLICATION_TA, DELETE_APPLICATION_IL)).click
  end


  def confirm_delete_application(key = nil)
    return find(ta(CONFIRM_DELETE_APPLICATION_EP)).click if key == :ep
    return find(:xpath, CONFIRM_DELETE_APPLICATION_IL).click if key == :il
    find(:xpath, ta(CONFIRM_DELETE_APPLICATION_TA, CONFIRM_DELETE_APPLICATION_IL)).click
  end

end