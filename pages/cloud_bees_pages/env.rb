require_relative '../page_extension'

class CloudBeesEnv < PageExtension

  # SVG CREATE_ENV_PLUS_BTN_IL = ".at-button-create-new"
  CREATE_ENV_PLUS_BTN_IL = ".list-controls__add-new"
  CREATE_ENV_PLUS_BTN_TA = "cloud_bees:env:env_plus_btn"

  CHOOSE_ENV_IL = ".at-environment-list-item-name"
  CHOOSE_ENV_TA = 'cloud_bees:env:choose_env'

  CREATE_NEW_ENV_MODAL_BTN_IL = "//div[@class='object-create__type' and text()='Create New...']"
  CREATE_NEW_ENV_MODAL_BTN_TA = 'cloud_bees:env:create_new_env_modal_btn'

  ENV_NAME_IL = "//input[contains(@class, 'at-environment-name-input')]"
  ENV_NAME_TA = 'cloud_bees:env:env_name'

  SELECT_PROJECT_IL = "//div[text()='Select Project']"
  SELECT_PROJECT_TA = 'cloud_bees:env:select_project'

  SELECT_DEFAULT_PROJECT_IL = "//div[@title='Default' and contains(@class, 'ec-project-select-picker__option')]"
  SELECT_DEFAULT_PROJECT_TA = 'cloud_bees:env:select_default_project'

  CONFIRM_NEW_ENV_IL = "//div[text()='OK']"
  CONFIRM_NEW_ENV_TA = 'cloud_bees:env:confirm_new_env'

  DELETE_ENV_IL = "//span[text()='Delete']"
  DELETE_ENV_TA = 'cloud_bees:env:delete_env'

  CONFIRM_DELETE_ENV_IL = "//div[text()='OK']"
  CONFIRM_DELETE_ENV_TA = 'cloud_bees:env:confirm_delete_env'

  FIND_ENV_FIELD_IL = "//input[@placeholder='Find...']"
  FIND_ENV_FIELD_TA = 'cloud_bees:env:find_env_field'


  def create_new_env(key = nil)
    find_element(key, il_type: :css, tl: CREATE_ENV_PLUS_BTN_TA, il: CREATE_ENV_PLUS_BTN_IL).click
  end

  def find_env_name_field(key = nil, envName)
    find_element(key, il_type: :xpath, tl: FIND_ENV_FIELD_TA, il: FIND_ENV_FIELD_IL).set(envName)
  end

  def click_new_env_btn(key = nil)
    find_element(key, il_type: :xpath, tl: CREATE_NEW_ENV_MODAL_BTN_TA, il: CREATE_NEW_ENV_MODAL_BTN_IL).click
  end

  def fill_env_name_field(key = nil, envName)
    find_element(key, il_type: :xpath, tl: ENV_NAME_TA, il: ENV_NAME_IL).set(envName)
  end

  def click_on_select_project(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_PROJECT_TA, il: SELECT_PROJECT_IL).click
  end

  def click_to_select_default_project(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_DEFAULT_PROJECT_TA, il: SELECT_DEFAULT_PROJECT_IL).click
  end

  def click_to_confirm_create_new_env(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_NEW_ENV_TA, il: CONFIRM_NEW_ENV_IL).click
  end

  def choose_env(key = nil)
    find_element(key, il_type: :css, tl: CHOOSE_ENV_TA, il: CHOOSE_ENV_IL).click
  end

  def delete_env(key = nil)
    find_element(key, il_type: :xpath, tl: DELETE_ENV_TA, il: DELETE_ENV_IL).click
  end

  def confirm_delete_env(key = nil)
    find_element(key, il_type: :xpath, tl: CONFIRM_DELETE_ENV_TA, il: CONFIRM_DELETE_ENV_IL).click
  end

end