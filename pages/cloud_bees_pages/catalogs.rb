require_relative '../page_extension'

class CloudBeesCatalogs < PageExtension

  # SVG CREATE_NEW_CATALOG_IL = ".at-button-create-new"
  CREATE_NEW_CATALOG_IL = ".right-container span"
  CREATE_NEW_CATALOG_TA = "cloud_bees:catalogs_page:create_new_catalog"

  CREATE_NEW_BUTTON_IL = ".at-row-create-new"
  CREATE_NEW_BUTTON_TA = "cloud_bees:catalogs_page:create_new_btn"

  CATALOGS_NAME_FLD_IL = ".at-catalog-name-input"
  CATALOGS_NAME_FLD_TA = "cloud_bees:catalogs_page:catalog_name"

  PROJECT_DROPDOWN_IL = ".at-select-header-title"
  PROJECT_DROPDOWN_TA = "cloud_bees:catalogs_page:open_project_dropdown"

  DEFAULT_PROJECT_IL = "(//div[contains(@class,'at-project-select-picker-project-name')])[1]"
  DEFAULT_PROJECT_TA = "cloud_bees:catalogs_page:select_default_proj"

  OK_IN_MODAL_BTN_IL = ".at-ok-btn"
  OK_IN_MODAL_BTN_TA = "cloud_bees:catalogs_page:ok_in_modal_btn"

  CATALOGS_NAME_FORM_IL = ".at-react-form-txt-input"
  CATALOGS_NAME_FORM_TA = "cloud_bees:catalogs_page:catalogs_name_form"

  CATALOGS_DESCRIPTION_FORM_IL = ".at-catalog-description-textarea"
  CATALOGS_DESCRIPTION_FORM_TA = "cloud_bees:catalogs_page:catalogs_description_form"

  # SVG ADD_ANOTHER_BTN_IL = ".at-button-add"
  ADD_ANOTHER_BTN_IL = ".save-and-add"
  ADD_ANOTHER_BTN_TA = "cloud_bees:catalogs_page:add_another"

  DEFINE_BTN_IL = ".at-catalog-save-and-define"
  DEFINE_BTN_TA = "cloud_bees:catalogs_page:define_btn"

  SELECT_BTN_LABEL_IL = ".at-select-header-title"
  SELECT_BTN_LABEL_TA = "cloud_bees:catalogs_page:select_btn_label"

  EXECUTE_OPTION_IL = ".at-select-option-3"
  EXECUTE_OPTION_TA = "cloud_bees:catalogs_page:execute_option"

  CLOUD_BEES_ICON_IL = "//div[contains(text(),'CloudBees Flow')]"
  CLOUD_BEES_ICON_TA = "cloud_bees:catalogs_page:cloud_bees_icon"

  PROCEDURE_DEFINITION_IL = "//span[contains(text(),'Procedure')]"
  PROCEDURE_DEFINITION_TA = "cloud_bees:catalogs_page:procedure_definition"

  PROCEDURE_PROJ_IL = "(//div[contains(@class, 'at-select-header-title')])[2]"
  PROCEDURE_PROJ_TA = "cloud_bees:catalogs_page:procedure_proj"

  PROCEDURE_EC_EXAMPLE_PROJ_IL = "(//div[contains(@class, 'at-project-select-item-picker-2')])"
  PROCEDURE_EC_EXAMPLE_PROJ_TA = "cloud_bees:catalogs_page:procedure_default_proj"

  SELECT_PROCEDURE_IL = "(//div[contains(@class, 'at-select-header-title')])[3]"
  SELECT_PROCEDURE_TA = "cloud_bees:catalogs_page:select_procedure_proj"

  SELECT_APPROVE_PROCEDURE_IL = ".at-select-option-1"
  SELECT_APPROVE_PROCEDURE_TA = "cloud_bees:catalogs_page:approve_procedure_proj"

  ALL_CATALOGS_IL = ".at-objects-list-popover"
  ALL_CATALOGS_TA = "cloud_bees:catalogs_page:all_catalogs"

  CREATED_CATALOG_IL = ".popover-objects-header > .at-search-collapsable"
  CREATED_CATALOG_TA = "cloud_bees:catalogs_page:new_catalog_name"

  SELECT_CATALOG_IL = ".at-popover-list-element-name-new_name_catalog"
  SELECT_CATALOG_TA = "cloud_bees:catalogs_page:select_new_catalog"

  CATALOG_EDITOR_IL = "//a[contains(@class, 'navigation__link')][2]"
  CATALOG_EDITOR_TA = "cloud_bees:catalogs_page:catalog_editor"

  CATALOG_HAMBURGER_MENU_IL = ".at-slide-menu-btn"
  CATALOG_HAMBURGER_MENU_TA = "cloud_bees:catalogs_page:catalog_menu"

  DELETE_CATALOG_IL = ".ec-context-menu__list> .at-slide-menu-item-6"
  DELETE_CATALOG_TA = "cloud_bees:catalogs_page:delete_catalog"

  ACCEPT_DELETE_CATALOG_IL = ".at-ok-btn"
  ACCEPT_DELETE_CATALOG_TA = "cloud_bees:catalogs_page:accept_delete_catalog"

  CATALOGS_LIST_IL = ".at-objects-list-popover"
  CATALOGS_LIST_TA = "cloud_bees:catalogs_page:catalog_list"

  APPS_IN_CATALOG_LIST_IL = ".at-popover-list-element-name-applications"
  APPS_IN_CATALOG_LIST_TA = "cloud_bees:catalogs_page:apps_in_catalog_list"

  CONTAINERS_IN_CATALOG_LIST_IL = ".at-popover-list-element-name-containers"
  CONTAINERS_IN_CATALOG_LIST_TA = "cloud_bees:catalogs_page:conteiners_in_catalog_list"

  UTILITY_IN_CATALOG_LIST_IL = ".at-popover-list-element-name-utility"
  UTILITY_IN_CATALOG_LIST_TA = "cloud_bees:catalogs_page:utility_in_catalog_list"


  def click_to_create_new_catalog(key = nil)
    find_element(key, il_type: :css, tl: CREATE_NEW_CATALOG_TA, il: CREATE_NEW_CATALOG_IL, check_path: $check_path).click
  end

  def click_to_create_new_btn(key = nil)
    find_element(key, il_type: :css, tl: CREATE_NEW_BUTTON_TA, il: CREATE_NEW_BUTTON_IL, check_path: $check_path).click
  end

  def set_catalog_name(key = nil, value)
    find_element(key, il_type: :css, tl: CATALOGS_NAME_FLD_TA, il: CATALOGS_NAME_FLD_IL, check_path: $check_path).set(value)
  end

  def click_to_open_proj_drpodown(key = nil)
    find_element(key, il_type: :css, tl: PROJECT_DROPDOWN_TA, il: PROJECT_DROPDOWN_IL, check_path: $check_path).click
  end

  def select_proj_from_list(key = nil)
    find_element(key, il_type: :xpath, tl: DEFAULT_PROJECT_TA, il: DEFAULT_PROJECT_IL, check_path: $check_path).click
  end

  def click_ok_in_modal_btn(key = nil)
    find_element(key, il_type: :css, tl: OK_IN_MODAL_BTN_TA, il: OK_IN_MODAL_BTN_IL, check_path: $check_path).click
  end

  def set_name_in_form(key = nil, value)
    find_element(key, il_type: :css, tl: CATALOGS_NAME_FORM_TA, il: CATALOGS_NAME_FORM_IL, check_path: $check_path).set(value)
  end

  def set_description_in_form(key = nil, value)
    find_element(key, il_type: :css, tl: CATALOGS_DESCRIPTION_FORM_TA, il: CATALOGS_DESCRIPTION_FORM_IL, check_path: $check_path).set(value)
  end

  def click_add_another(key = nil)
    find_element(key, il_type: :css, tl: ADD_ANOTHER_BTN_TA, il: ADD_ANOTHER_BTN_IL, check_path: $check_path).click
  end

  def click_define_btn(key = nil)
    find_element(key, il_type: :css, tl: DEFINE_BTN_TA, il: DEFINE_BTN_IL, check_path: $check_path).click
  end

  def click_to_select_cloud_bees_icon(key = nil)
    find_element(key, il_type: :xpath, tl: CLOUD_BEES_ICON_TA, il: CLOUD_BEES_ICON_IL, check_path: $check_path).click
  end

  def click_to_select_label(key = nil)
    find_element(key, il_type: :css, tl: SELECT_BTN_LABEL_TA, il: SELECT_BTN_LABEL_IL, check_path: $check_path).click
  end

  def click_to_select_execute_option(key = nil)
    find_element(key, il_type: :css, tl: EXECUTE_OPTION_TA, il: EXECUTE_OPTION_IL, check_path: $check_path).click
  end

  def click_on_procedure_definition (key = nil)
    find_element(key, il_type: :xpath, tl: PROCEDURE_DEFINITION_TA, il: PROCEDURE_DEFINITION_IL, check_path: $check_path).click
  end

  def click_procedure_proj_dropdown(key = nil)
    find_element(key, il_type: :xpath, tl: PROCEDURE_PROJ_TA, il: PROCEDURE_PROJ_IL, check_path: $check_path).click
  end

  def click_to_select_ec_example_proj(key = nil)
    find_element(key, il_type: :xpath, tl: PROCEDURE_EC_EXAMPLE_PROJ_TA, il: PROCEDURE_EC_EXAMPLE_PROJ_IL, check_path: $check_path).click
  end

  def click_select_procedure(key = nil)
    find_element(key, il_type: :xpath, tl: SELECT_PROCEDURE_TA, il: SELECT_PROCEDURE_IL, check_path: $check_path).click
  end

  def click_select_approve_procedure(key = nil)
    find_element(key, il_type: :css, tl: SELECT_APPROVE_PROCEDURE_TA, il: SELECT_APPROVE_PROCEDURE_IL, check_path: $check_path).click
  end

  def click_all_catalogs(key = nil)
    find_element(key, il_type: :css, tl: ALL_CATALOGS_TA, il: ALL_CATALOGS_IL, check_path: $check_path).click
  end

  def click_to_select_created_catalog(key = nil, catalogName)
    find_element(key, il_type: :css, tl: CREATED_CATALOG_TA, il: CREATED_CATALOG_IL, check_path: $check_path).set(catalogName)
  end

  def select_created_catalog(key = nil)
    find_element(key, il_type: :css, tl: SELECT_CATALOG_TA, il: SELECT_CATALOG_IL, check_path: $check_path).click
  end

  def click_editor_catalog(key = nil)
    find_element(key, il_type: :xpath, tl: CATALOG_EDITOR_TA, il: CATALOG_EDITOR_IL, check_path: $check_path).click
  end

  def click_catalog_menu(key = nil)
    find_element(key, il_type: :css, tl: CATALOG_HAMBURGER_MENU_TA, il: CATALOG_HAMBURGER_MENU_IL, check_path: $check_path).click
  end

  def click_delete_catalog(key = nil)
    find_element(key, il_type: :css, tl: DELETE_CATALOG_TA, il: DELETE_CATALOG_IL, check_path: $check_path).click
  end

  def click_ok_btn_for_accept_delete(key = nil)
    find_element(key, il_type: :css, tl: ACCEPT_DELETE_CATALOG_TA, il: ACCEPT_DELETE_CATALOG_IL, check_path: $check_path).click
  end

  def click_to_open_catalog_list(key = nil)
    find_element(key, il_type: :css, tl: CATALOGS_LIST_TA, il: CATALOGS_LIST_IL, check_path: $check_path).click
  end

  def click_apps_in_catalog_list(key = nil)
    find_element(key, il_type: :css, tl: APPS_IN_CATALOG_LIST_TA, il: APPS_IN_CATALOG_LIST_IL, check_path: $check_path).click
  end

  def click_containers_in_catalog_list(key = nil)
    find_element(key, il_type: :css, tl: CONTAINERS_IN_CATALOG_LIST_TA, il: CONTAINERS_IN_CATALOG_LIST_IL, check_path: $check_path).click
  end

  def click_utility_in_catalog_list(key = nil)
    find_element(key, il_type: :css, tl: UTILITY_IN_CATALOG_LIST_TA, il: UTILITY_IN_CATALOG_LIST_IL, check_path: $check_path).click
  end

end
