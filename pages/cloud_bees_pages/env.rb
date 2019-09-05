require 'spec_helper'

class CloudBeesEnv
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  CREATE_ENV_PLUS_BTN_IL = ".at-button-create-new"
  CREATE_ENV_PLUS_BTN_TA = "cloud_bees:env:env_plus_btn"
  CREATE_ENV_PLUS_BTN_EP = "EP:cloud_bees:env:env_plus_btn"

  CHOOSE_ENV_IL = ".at-environment-list-item-name"
  CHOOSE_ENV_TA = 'cloud_bees:env:choose_env'
  CHOOSE_ENV_EP = 'EP:cloud_bees:env:choose_env'

  CREATE_NEW_ENV_MODAL_BTN_IL = "//div[@class='object-create__type' and text()='Create New...']"
  CREATE_NEW_ENV_MODAL_BTN_TA = 'cloud_bees:env:create_new_env_modal_btn'
  CREATE_NEW_ENV_MODAL_BTN_EP = 'EP:cloud_bees:env:create_new_env_modal_btn'

  ENV_NAME_IL = "//input[contains(@class, 'at-environment-name-input')]"
  ENV_NAME_TA = 'cloud_bees:env:env_name'
  ENV_NAME_EP = 'EP:cloud_bees:env:env_name'

  SELECT_PROJECT_IL = "//div[text()='Select Project']"
  SELECT_PROJECT_TA = 'cloud_bees:env:select_project'
  SELECT_PROJECT_EP = 'EP:cloud_bees:env:select_project'

  SELECT_DEFAULT_PROJECT_IL = "//div[text()='1']//following-sibling::div[@title='Default']"
  SELECT_DEFAULT_PROJECT_TA = 'cloud_bees:env:select_default_project'
  SELECT_DEFAULT_PROJECT_EP = 'EP:cloud_bees:env:select_default_project'

  CONFIRM_NEW_ENV_IL = "//div[text()='OK']"
  CONFIRM_NEW_ENV_TA = 'cloud_bees:env:confirm_new_env'
  CONFIRM_NEW_ENV_EP = 'EP:cloud_bees:env:confirm_new_env'

  DELETE_ENV_IL = "//span[text()='Delete']"
  DELETE_ENV_TA = 'cloud_bees:env:delete_env'
  DELETE_ENV_EP = 'EP:cloud_bees:env:delete_env'

  CONFIRM_DELETE_ENV_IL = "//div[text()='OK']"
  CONFIRM_DELETE_ENV_TA = 'cloud_bees:env:confirm_delete_env'
  CONFIRM_DELETE_ENV_EP = 'EP:cloud_bees:env:confirm_delete_env'

  FIND_ENV_FIELD_IL = "//input[@placeholder='Find...']"
  FIND_ENV_FIELD_TA = 'cloud_bees:env:find_env_field'
  FIND_ENV_FIELD_EP = 'EP:cloud_bees:env:find_env_field'
  
  def create_new_env(key = nil)
    return find(ta(CREATE_ENV_PLUS_BTN_EP)).click if key == :ep
    return find(:css, CREATE_ENV_PLUS_BTN_IL).click if key == :il
    find(:css, ta(CREATE_ENV_PLUS_BTN_TA, CREATE_ENV_PLUS_BTN_IL)).click
  end

  def find_env_name_field(key = nil, envName)
    return find(ta(FIND_ENV_FIELD_EP)).set(envName) if key == :ep
    return find(:xpath, FIND_ENV_FIELD_IL).set(envName) if key == :il
    find(:xpath, ta(FIND_ENV_FIELD_TA, FIND_ENV_FIELD_IL)).set(envName)
  end

  def click_new_env_btn(key = nil)
    return find(ta(CREATE_NEW_ENV_MODAL_BTN_EP)).click if key == :ep
    return find(:xpath, CREATE_NEW_ENV_MODAL_BTN_IL).click if key == :il
    find(:xpath, ta(CREATE_NEW_ENV_MODAL_BTN_TA, CREATE_NEW_ENV_MODAL_BTN_IL)).click
  end

  def fill_env_name_field(key = nil, envName)
    return find(ta(ENV_NAME_EP)).set(envName) if key == :ep
    return find(:xpath, ENV_NAME_IL).set(envName) if key == :il
    find(:xpath, ta(ENV_NAME_TA, ENV_NAME_IL)).set(envName)
  end

  def click_on_select_project(key = nil)
    return find(ta(SELECT_PROJECT_EP)).click if key == :ep
    return find(:xpath, SELECT_PROJECT_IL).click if key == :il
    find(:xpath, ta(SELECT_PROJECT_TA, SELECT_PROJECT_IL)).click
  end

  def click_to_select_default_project(key = nil)
    return find(ta(SELECT_DEFAULT_PROJECT_EP)).click if key == :ep
    return find(:xpath, SELECT_DEFAULT_PROJECT_IL).click if key == :il
    find(:xpath, ta(SELECT_DEFAULT_PROJECT_TA, SELECT_DEFAULT_PROJECT_IL)).click
  end

  def click_to_confirm_create_new_env(key = nil)
    return find(ta(CONFIRM_NEW_ENV_EP)).click if key == :ep
    return find(:xpath, CONFIRM_NEW_ENV_IL).click if key == :il
    find(:xpath, ta(CONFIRM_NEW_ENV_TA, CONFIRM_NEW_ENV_IL)).click
  end

  def choose_env(key = nil)
    return find(ta(CHOOSE_ENV_EP)).click if key == :ep
    return find(:css, CHOOSE_ENV_IL).click if key == :il
    find(:css, ta(CHOOSE_ENV_TA, CHOOSE_ENV_IL)).click
  end

  def delete_env(key = nil)
    return find(ta(DELETE_ENV_EP)).click if key == :ep
    return find(:xpath, DELETE_ENV_IL).click if key == :il
    find(:xpath, ta(DELETE_ENV_TA, DELETE_ENV_IL)).click
  end

  def confirm_delete_env(key = nil)
    return find(ta(CONFIRM_DELETE_ENV_EP)).click if key == :ep
    return find(:xpath, CONFIRM_DELETE_ENV_IL).click if key == :il
    find(:xpath, ta(CONFIRM_DELETE_ENV_TA, CONFIRM_DELETE_ENV_IL)).click
  end

end