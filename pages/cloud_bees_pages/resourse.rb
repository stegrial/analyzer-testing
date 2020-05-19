require_relative '../page_extension'

class CloudBeesResources < PageExtension

  ADD_NEW_RESOURCE_IL = "//table[@title='Add']"
  ADD_NEW_RESOURCE_TA = "cloud_bees:resource:add_new_resource"

  CREATE_RESOURCE_BTN_IL = "//td[text()='Create Resource']"
  CREATE_RESOURCE_BTN_TA = "cloud_bees:resource:create_resource"

  RESOURCE_NAME_IL = "//input[@name='resourceName']"
  RESOURCE_NAME_TA = "cloud_bees:resource:resource_name"

  RESOURCE_DESCRIPTION_IL = "//textarea[@name='description']"
  RESOURCE_DESCRIPTION_TA = "cloud_bees:resource:resource_description"

  RESOURCE_HOST_NAME_IL = "//input[@name='hostName']"
  RESOURCE_HOST_NAME_TA = "cloud_bees:resource:resource_host"

  RESOURCE_PORT_IL = "//input[@name='port']"
  RESOURCE_PORT_TA = "cloud_bees:resource:resource_port"

  RESOURCE_POOLS_IL = "//input[@name='pools']"
  RESOURCE_POOLS_TA = "cloud_bees:resource:resource_pools"

  RESOURCE_SHELL_IL = "//input[@name='shell']"
  RESOURCE_SHELL_TA = "cloud_bees:resource:resource_shell"

  RESOURCE_STEP_LIMIT_IL = "//input[@name='stepLimit']"
  RESOURCE_STEP_LIMIT_TA = "cloud_bees:resource:resource_stepLimit"

  RESOURCE_CACHE_DIRECTORY_IL = "//input[@name='artifactCacheDirectory']"
  RESOURCE_CACHE_DIRECTORY_TA = "cloud_bees:resource:resource_artifact_cache_directory"

  RESOURCE_TAGS_IL = "//input[@name='tags']"
  RESOURCE_TAGS_TA = "cloud_bees:resource:resource_tags"

  RESOURCE_OK_BTN_IL = "#gwt-debug-shortOkButton"
  RESOURCE_OK_BTN_TA = "cloud_bees:resource:resource_ok_btn"

  QUICK_SEARCH_INPUT_IL = "//input[@title='Quick Search']"
  QUICK_SEARCH_INPUT_TA = "cloud_bees:resource:quick_search"

  FILTER_OK_BTN_IL = "#gwt-debug-filterOk"
  FILTER_OK_BTN_TA = "cloud_bees:resource:filter_btn"

  SELECT_CHECKBOX_IL = "//thead//input[@type='checkbox']"
  SELECT_CHECKBOX_TA = "cloud_bees:resource:select_checkbox"

  DELETE_NEW_RESOURCE_IL = "//table[@title='Delete']"
  DELETE_NEW_RESOURCE_TA = "cloud_bees:resource:delete_new_resource"

  ACCEPT_DELETE_RESOURCE_IL = "//div[contains(@class, 'gwt-DialogBox')]//button[@class='gwt-Button ok_button']"
  ACCEPT_DELETE_RESOURCE_TA = "cloud_bees:resource:accept_delete_new_resource"

  def click_add_new_resource(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: ADD_NEW_RESOURCE_TA, il: ADD_NEW_RESOURCE_IL).click
    end
  end

  def click_create_resource_btn(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: CREATE_RESOURCE_BTN_TA, il: CREATE_RESOURCE_BTN_IL).click
    end
  end

  def set_resource_name(key = nil, name)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: RESOURCE_NAME_TA, il: RESOURCE_NAME_IL).set(name)
      end
  end

  def set_description_of_resource(key = nil, value)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: RESOURCE_DESCRIPTION_TA, il: RESOURCE_DESCRIPTION_IL).set(value)
    end
  end

  def set_host_of_resource(key = nil, value)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: RESOURCE_HOST_NAME_TA, il: RESOURCE_HOST_NAME_IL).set(value)
    end
  end

  def set_port_of_resource(key = nil, value)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: RESOURCE_PORT_TA, il: RESOURCE_PORT_IL).set(value)
    end
  end

  def set_pools_of_resource(key = nil, value)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: RESOURCE_POOLS_TA, il: RESOURCE_POOLS_IL).set(value)
    end
  end

  def set_shell_of_resource(key = nil, value)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: RESOURCE_SHELL_TA, il: RESOURCE_SHELL_IL).set(value)
    end
  end

  def set_step_limit_of_resource(key = nil, value)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: RESOURCE_STEP_LIMIT_TA, il: RESOURCE_STEP_LIMIT_IL).set(value)
    end
  end

  def set_cache_directory_of_resource(key = nil, value)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: RESOURCE_CACHE_DIRECTORY_TA, il: RESOURCE_CACHE_DIRECTORY_IL).set(value)
    end
  end

  def set_tags_of_resource(key = nil, value)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: RESOURCE_TAGS_TA, il: RESOURCE_TAGS_IL).set(value)
    end
  end

  def click_ok_button(key = nil)
    within_frame(0) do
      find_element(key, il_type: :css, tl: RESOURCE_OK_BTN_TA, il: RESOURCE_OK_BTN_IL).click
    end
  end

  def click_quick_search(key = nil, value)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: QUICK_SEARCH_INPUT_TA, il: QUICK_SEARCH_INPUT_IL).set(value)
    end
  end

  def click_filter_button(key = nil)
    within_frame(0) do
      find_element(key, il_type: :css, tl: FILTER_OK_BTN_TA, il: FILTER_OK_BTN_IL).click
    end
  end

  def click_to_select_checkbox(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: SELECT_CHECKBOX_TA, il: SELECT_CHECKBOX_IL).click
    end
  end

  def click_to_delete_new_resource(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: DELETE_NEW_RESOURCE_TA, il: DELETE_NEW_RESOURCE_IL).click
    end
  end

  def click_ok_to_delete_new_resource(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: ACCEPT_DELETE_RESOURCE_TA, il: ACCEPT_DELETE_RESOURCE_IL).click
    end
  end

end