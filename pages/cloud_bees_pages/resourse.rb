require 'spec_helper'

class CloudBeesResources
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers


  ADD_NEW_RESOURCE_IL = "//table[@title='Add']"
  ADD_NEW_RESOURCE_TA = "cloud_bees:resource:add_new_resource"
  ADD_NEW_RESOURCE_EP = "EP:cloud_bees:resource:add_new_resource"

  CREATE_RESOURCE_BTN_IL = "//td[text()='Create Resource']"
  CREATE_RESOURCE_BTN_TA = "cloud_bees:resource:create_resource"
  CREATE_RESOURCE_BTN_EP = "EP:cloud_bees:resource:create_resource"

  RESOURCE_NAME_IL = "//input[@name='resourceName']"
  RESOURCE_NAME_TA = "cloud_bees:resource:resource_name"
  RESOURCE_NAME_EP = "EP:cloud_bees:resource:resource_name"

  RESOURCE_DESCRIPTION_IL = "//textarea[@name='description']"
  RESOURCE_DESCRIPTION_TA = "cloud_bees:resource:resource_description"
  RESOURCE_DESCRIPTION_EP = "EP:cloud_bees:resource:resource_description"

  RESOURCE_HOST_NAME_IL = "//input[@name='hostName']"
  RESOURCE_HOST_NAME_TA = "cloud_bees:resource:resource_host"
  RESOURCE_HOST_NAME_EP = "EP:cloud_bees:resource:resource_host"

  RESOURCE_PORT_IL = "//input[@name='port']"
  RESOURCE_PORT_TA = "cloud_bees:resource:resource_port"
  RESOURCE_PORT_EP = "EP:cloud_bees:resource:resource_port"

  RESOURCE_POOLS_IL = "//input[@name='pools']"
  RESOURCE_POOLS_TA = "cloud_bees:resource:resource_pools"
  RESOURCE_POOLS_EP = "EP:cloud_bees:resource:resource_pools"

  RESOURCE_SHELL_IL = "//input[@name='shell']"
  RESOURCE_SHELL_TA = "cloud_bees:resource:resource_shell"
  RESOURCE_SHELL_EP = "EP:cloud_bees:resource:resource_shell"

  RESOURCE_STEP_LIMIT_IL = "//input[@name='stepLimit']"
  RESOURCE_STEP_LIMIT_TA = "cloud_bees:resource:resource_stepLimit"
  RESOURCE_STEP_LIMIT_EP = "EP:cloud_bees:resource:resource_stepLimit"

  RESOURCE_CACHE_DIRECTORY_IL = "//input[@name='artifactCacheDirectory']"
  RESOURCE_CACHE_DIRECTORY_TA = "cloud_bees:resource:resource_artifact_cache_directory"
  RESOURCE_CACHE_DIRECTORY_EP = "EP:cloud_bees:resource:resource_artifact_cache_directory"

  RESOURCE_TAGS_IL = "//input[@name='tags']"
  RESOURCE_TAGS_TA = "cloud_bees:resource:resource_tags"
  RESOURCE_TAGS_EP = "EP:cloud_bees:resource:resource_tags"

  RESOURCE_OK_BTN_IL = "#gwt-debug-shortOkButton"
  RESOURCE_OK_BTN_TA = "cloud_bees:resource:resource_ok_btn"
  RESOURCE_OK_BTN_EP = "EP:cloud_bees:resource:resource_ok_btn"

  QUICK_SEARCH_INPUT_IL = "//input[@title='Quick Search']"
  QUICK_SEARCH_INPUT_TA = "cloud_bees:resource:quick_search"
  QUICK_SEARCH_INPUT_EP = "EP:cloud_bees:resource:quick_search"

  FILTER_OK_BTN_IL = "#gwt-debug-filterOk"
  FILTER_OK_BTN_TA = "cloud_bees:resource:filter_btn"
  FILTER_OK_BTN_EP = "EP:cloud_bees:resource:filter_btn"

  SELECT_CHECKBOX_IL = "(//input[@type='checkbox'])[4]"
  SELECT_CHECKBOX_TA = "cloud_bees:resource:select_checkbox"
  SELECT_CHECKBOX_EP = "EP:cloud_bees:resource:select_checkbox"

  DELETE_NEW_RESOURCE_IL = "//table[@title='Delete']"
  DELETE_NEW_RESOURCE_TA = "cloud_bees:resource:delete_new_resource"
  DELETE_NEW_RESOURCE_EP = "EP:cloud_bees:resource:delete_new_resource"

  ACCEPT_DELETE_RESOURCE_IL = "//button[text()='OK']"
  ACCEPT_DELETE_RESOURCE_TA = "cloud_bees:resource:accept_delete_new_resource"
  ACCEPT_DELETE_RESOURCE_EP = "EP:cloud_bees:resource:accept_delete_new_resource"

  def click_to_add_new_resource(key = nil)
    within_frame(0) do
      return find(ta(ADD_NEW_RESOURCE_EP)).click if key == :ep
      return find(:xpath, ADD_NEW_RESOURCE_IL).click if key == :il
      find(:xpath, ta(ADD_NEW_RESOURCE_TA, ADD_NEW_RESOURCE_IL)).click
    end
  end

  def click_create_resource_btn(key = nil)
    within_frame(0) do
      return find(ta(CREATE_RESOURCE_BTN_EP)).click if key == :ep
      return find(:xpath, CREATE_RESOURCE_BTN_IL).click if key == :il
      find(:xpath, ta(CREATE_RESOURCE_BTN_TA, CREATE_RESOURCE_BTN_IL)).click
    end
  end

  def set_name_of_resource(key = nil)
    within_frame(0) do
      return find(ta(RESOURCE_NAME_EP)).set('Name1') if key == :ep
      return find(:xpath, RESOURCE_NAME_IL).set('Name1') if key == :il
      find(:xpath, ta(RESOURCE_NAME_TA, RESOURCE_NAME_IL)).set('Name1')
    end
  end

  def set_description_of_resource(key = nil)
    within_frame(0) do
      return find(ta(RESOURCE_DESCRIPTION_EP)).set('1') if key == :ep
      return find(:xpath, RESOURCE_DESCRIPTION_IL).set('1') if key == :il
      find(:xpath, ta(RESOURCE_DESCRIPTION_TA, RESOURCE_DESCRIPTION_IL)).set('1')
    end
  end

  def set_host_of_resource(key = nil)
    within_frame(0) do
      return find(ta(RESOURCE_HOST_NAME_EP)).set('1') if key == :ep
      return find(:xpath, RESOURCE_HOST_NAME_IL).set('1') if key == :il
      find(:xpath, ta(RESOURCE_HOST_NAME_TA, RESOURCE_HOST_NAME_IL)).set('1')
    end
  end

  def set_port_of_resource(key = nil)
    within_frame(0) do
      return find(ta(RESOURCE_PORT_EP)).set('1') if key == :ep
      return find(:xpath, RESOURCE_PORT_IL).set('1') if key == :il
      find(:xpath, ta(RESOURCE_PORT_TA, RESOURCE_PORT_IL)).set('1')
    end
  end

  def set_pools_of_resource(key = nil)
    within_frame(0) do
      return find(ta(RESOURCE_POOLS_EP)).set('1') if key == :ep
      return find(:xpath, RESOURCE_POOLS_IL).set('1') if key == :il
      find(:xpath, ta(RESOURCE_POOLS_TA, RESOURCE_POOLS_IL)).set('1')
    end
  end

  def set_shell_of_resource(key = nil)
    within_frame(0) do
      return find(ta(RESOURCE_SHELL_EP)).set('1') if key == :ep
      return find(:xpath, RESOURCE_SHELL_IL).set('1') if key == :il
      find(:xpath, ta(RESOURCE_SHELL_TA, RESOURCE_SHELL_IL)).set('1')
    end
  end

  def set_step_limit_of_resource(key = nil)
    within_frame(0) do
      return find(ta(RESOURCE_STEP_LIMIT_EP)).set('1') if key == :ep
      return find(:xpath, RESOURCE_STEP_LIMIT_IL).set('1') if key == :il
      find(:xpath, ta(RESOURCE_STEP_LIMIT_TA, RESOURCE_STEP_LIMIT_IL)).set('1')
    end
  end

  def set_cache_directory_of_resource(key = nil)
    within_frame(0) do
      return find(ta(RESOURCE_CACHE_DIRECTORY_EP)).set('1') if key == :ep
      return find(:xpath, RESOURCE_CACHE_DIRECTORY_IL).set('1') if key == :il
      find(:xpath, ta(RESOURCE_CACHE_DIRECTORY_TA, RESOURCE_CACHE_DIRECTORY_IL)).set('1')
    end
  end

  def set_tags_of_resource(key = nil)
    within_frame(0) do
      return find(ta(RESOURCE_TAGS_EP)).set('1') if key == :ep
      return find(:xpath, RESOURCE_TAGS_IL).set('1') if key == :il
      find(:xpath, ta(RESOURCE_TAGS_TA, RESOURCE_TAGS_IL)).set('1')
    end
  end

  def click_ok_button(key = nil)
    within_frame(0) do
      return find(ta(RESOURCE_OK_BTN_EP)).click if key == :ep
      return find(:css, RESOURCE_OK_BTN_IL).click if key == :il
      find(:css, ta(RESOURCE_OK_BTN_TA, RESOURCE_OK_BTN_IL)).click
    end
  end

  def click_quick_search(key = nil)
    within_frame(0) do
      return find(ta(QUICK_SEARCH_INPUT_EP)).set('Name1') if key == :ep
      return find(:xpath, QUICK_SEARCH_INPUT_IL).set('Name1') if key == :il
      find(:xpath, ta(QUICK_SEARCH_INPUT_TA, QUICK_SEARCH_INPUT_IL)).set('Name1')
    end
  end

  def click_filter_button(key = nil)
    within_frame(0) do
      return find(ta(FILTER_OK_BTN_EP)).click if key == :ep
      return find(:css, FILTER_OK_BTN_IL).click if key == :il
      find(:css, ta(FILTER_OK_BTN_TA, FILTER_OK_BTN_IL)).click
    end
  end

  def click_to_select_checkbox(key = nil)
    within_frame(0) do
      return find(ta(SELECT_CHECKBOX_EP)).click if key == :ep
      return find(:xpath, SELECT_CHECKBOX_IL).click if key == :il
      find(:xpath, ta(SELECT_CHECKBOX_TA, SELECT_CHECKBOX_IL)).click
    end
  end

  def click_to_delete_new_resource(key = nil)
    within_frame(0) do
      return find(ta(DELETE_NEW_RESOURCE_EP)).click if key == :ep
      return find(:xpath, DELETE_NEW_RESOURCE_IL).click if key == :il
      find(:xpath, ta(DELETE_NEW_RESOURCE_TA, DELETE_NEW_RESOURCE_IL)).click
    end
  end

  def click_ok_to_delete_new_resource(key = nil)
    within_frame(0) do
      return find(ta(ACCEPT_DELETE_RESOURCE_EP)).click if key == :ep
      return find(:xpath, ACCEPT_DELETE_RESOURCE_IL).click if key == :il
      find(:xpath, ta(ACCEPT_DELETE_RESOURCE_TA, ACCEPT_DELETE_RESOURCE_IL)).click
    end
  end
end