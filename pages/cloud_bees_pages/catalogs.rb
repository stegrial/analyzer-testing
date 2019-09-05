require 'spec_helper'

class CloudBeesCatalogs
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers

  CREATE_NEW_CATALOG_IL = ".at-button-create-new"
  CREATE_NEW_CATALOG_TA = "cloud_bees:catalogs_page:create_new_catalog"
  CREATE_NEW_CATALOG_EP = "EP:cloud_bees:catalogs_page:create_new_catalog"

  CREATE_NEW_BUTTON_IL = ".at-row-create-new"
  CREATE_NEW_BUTTON_TA = "cloud_bees:catalogs_page:create_new_btn"
  CREATE_NEW_BUTTON_EP = "EP:cloud_bees:catalogs_page:create_new_btn"

  CATALOGS_NAME_FLD_IL = ".at-catalog-name-input"
  CATALOGS_NAME_FLD_TA = "cloud_bees:catalogs_page:catalog_name"
  CATALOGS_NAME_FLD_EP = "EP:cloud_bees:catalogs_page:catalog_name"

  PROJECT_DROPDOWN_IL = ".at-select-header-title"
  PROJECT_DROPDOWN_TA = "cloud_bees:catalogs_page:open_project_dropdown"
  PROJECT_DROPDOWN_EP = "EP:cloud_bees:catalogs_page:open_project_dropdown"

  DEFAULT_PROJECT_IL = "(//div[contains(@class,'at-project-select-picker-project-name')])[1]"
  DEFAULT_PROJECT_TA = "cloud_bees:catalogs_page:select_default_proj"
  DEFAULT_PROJECT_EP = "EP:cloud_bees:catalogs_page:select_default_proj"

  OK_IN_MODAL_BTN_IL = ".at-ok-btn"
  OK_IN_MODAL_BTN_TA = "cloud_bees:catalogs_page:ok_in_modal_btn"
  OK_IN_MODAL_BTN_EP = "EP:cloud_bees:catalogs_page:ok_in_modal_btn"

  CATALOGS_NAME_FORM_IL = ".at-react-form-txt-input"
  CATALOGS_NAME_FORM_TA = "cloud_bees:catalogs_page:catalogs_name_form"
  CATALOGS_NAME_FORM_EP = "EP:cloud_bees:catalogs_page:catalogs_name_form"

  CATALOGS_DESCRIPTION_FORM_IL = ".at-catalog-description-textarea"
  CATALOGS_DESCRIPTION_FORM_TA = "cloud_bees:catalogs_page:catalogs_description_form"
  CATALOGS_DESCRIPTION_FORM_EP = "EP:cloud_bees:catalogs_page:catalogs_description_form"

  ADD_ANOTHER_BTN_IL = ".at-button-add"
  ADD_ANOTHER_BTN_TA = "cloud_bees:catalogs_page:add_another"
  ADD_ANOTHER_BTN_EP = "EP:cloud_bees:catalogs_page:add_another"

  DEFINE_BTN_IL = ".at-catalog-save-and-define"
  DEFINE_BTN_TA = "cloud_bees:catalogs_page:define_btn"
  DEFINE_BTN_EP = "EP:cloud_bees:catalogs_page:define_btn"

  SELECT_BTN_LABEL_IL = ".at-select-header-title"
  SELECT_BTN_LABEL_TA = "cloud_bees:catalogs_page:select_btn_label"
  SELECT_BTN_LABEL_EP = "EP:cloud_bees:catalogs_page:select_btn_label"

  EXECUTE_OPTION_IL = ".at-select-option-3"
  EXECUTE_OPTION_TA = "cloud_bees:catalogs_page:execute_option"
  EXECUTE_OPTION_EP = "EP:cloud_bees:catalogs_page:execute_option"

  CLOUD_BEES_ICON_IL = "//div[contains(text(),'CloudBees Flow')]"
  CLOUD_BEES_ICON_TA = "cloud_bees:catalogs_page:cloud_bees_icon"
  CLOUD_BEES_ICON_EP = "EP:cloud_bees:catalogs_page:cloud_bees_icon"

  PROCEDURE_DEFINITION_IL = "//span[contains(text(),'Procedure')]"
  PROCEDURE_DEFINITION_TA = "cloud_bees:catalogs_page:procedure_definition"
  PROCEDURE_DEFINITION_EP = "EP:cloud_bees:catalogs_page:procedure_definition"

  PROCEDURE_PROJ_IL = "(//div[contains(@class, 'at-select-header-title')])[2]"
  PROCEDURE_PROJ_TA = "cloud_bees:catalogs_page:procedure_proj"
  PROCEDURE_PROJ_EP = "EP:cloud_bees:catalogs_page:procedure_proj"

  PROCEDURE_EC_EXAMPLE_PROJ_IL = "(//div[contains(@class, 'at-project-select-item-picker-2')])"
  PROCEDURE_EC_EXAMPLE_PROJ_TA = "cloud_bees:catalogs_page:procedure_default_proj"
  PROCEDURE_EC_EXAMPLE_PROJ_EP = "EP:cloud_bees:catalogs_page:procedure_default_proj"

  SELECT_PROCEDURE_IL = "(//div[contains(@class, 'at-select-header-title')])[3]"
  SELECT_PROCEDURE_TA = "cloud_bees:catalogs_page:select_procedure_proj"
  SELECT_PROCEDURE_EP = "EP:cloud_bees:catalogs_page:select_procedure_proj"

  SELECT_APPROVE_PROCEDURE_IL = ".at-select-option-1"
  SELECT_APPROVE_PROCEDURE_TA = "cloud_bees:catalogs_page:approve_procedure_proj"
  SELECT_APPROVE_PROCEDURE_EP = "EP:cloud_bees:catalogs_page:approve_procedure_proj"

  ALL_CATALOGS_IL = ".at-objects-list-popover"
  ALL_CATALOGS_TA = "cloud_bees:catalogs_page:all_catalogs"
  ALL_CATALOGS_EP = "EP:cloud_bees:catalogs_page:all_catalogs"

  CREATED_CATALOG_IL = "//span[contains(text(), 'test1')]"
  CREATED_CATALOG_TA = "cloud_bees:catalogs_page:test1"
  CREATED_CATALOG_EP = "EP:cloud_bees:catalogs_page:test1"

  CATALOG_EDITOR_IL = "//a[contains(@class, 'navigation__link')][2]"
  CATALOG_EDITOR_TA =  "cloud_bees:catalogs_page:catalog_editor"
  CATALOG_EDITOR_EP =  "EP:cloud_bees:catalogs_page:catalog_editor"

  CATALOG_HUMBURGER_MENU_IL = ".at-slide-menu-btn"
  CATALOG_HUMBURGER_MENU_TA = "cloud_bees:catalogs_page:catalog_menu"
  CATALOG_HUMBURGER_MENU_EP = "EP:cloud_bees:catalogs_page:catalog_menu"

  DELETE_CATALOG_IL = ".at-slide-menu-item-6"
  DELETE_CATALOG_TA = "cloud_bees:catalogs_page:delete_catalog"
  DELETE_CATALOG_EP = "EP:cloud_bees:catalogs_page:delete_catalog"

  ACCEPT_DELETE_CATALOG_IL = ".at-ok-btn"
  ACCEPT_DELETE_CATALOG_TA = "cloud_bees:catalogs_page:accept_delete_catalog"
  ACCEPT_DELETE_CATALOG_EP = "EP:cloud_bees:catalogs_page:accept_delete_catalog"

  CATALOGS_LIST_IL = ".at-objects-list-popover"
  CATALOGS_LIST_TA = "cloud_bees:catalogs_page:catalog_list"
  CATALOGS_LIST_EP = "EP:cloud_bees:catalogs_page:catalog_list"

  APPS_IN_CATALOG_LIST_IL = ".at-popover-list-element-name-applications"
  APPS_IN_CATALOG_LIST_TA = "cloud_bees:catalogs_page:apps_in_catalog_list"
  APPS_IN_CATALOG_LIST_EP = "EP:cloud_bees:catalogs_page:apps_in_catalog_list"

  CONTAINERS_IN_CATALOG_LIST_IL = ".at-popover-list-element-name-containers"
  CONTAINERS_IN_CATALOG_LIST_TA = "cloud_bees:catalogs_page:conteiners_in_catalog_list"
  CONTAINERS_IN_CATALOG_LIST_EP = "EP:cloud_bees:catalogs_page:conteiners_in_catalog_list"

  UTILITY_IN_CATALOG_LIST_IL = ".at-popover-list-element-name-utility"
  UTILITY_IN_CATALOG_LIST_TA = "cloud_bees:catalogs_page:utility_in_catalog_list"
  UTILITY_IN_CATALOG_LIST_EP = "EP:cloud_bees:catalogs_page:utility_in_catalog_list"


  def click_to_create_new_catalog(key = nil)
    return find(ta(CREATE_NEW_CATALOG_EP)).click if key == :ep
    return find(:css, CREATE_NEW_CATALOG_IL).click if key == :il
    find(:css, ta(CREATE_NEW_CATALOG_TA, CREATE_NEW_CATALOG_IL)).click
  end

  def click_to_create_new_btn(key = nil)
    return find(ta(CREATE_NEW_BUTTON_EP)).click if key == :ep
    return find(:css, CREATE_NEW_BUTTON_IL).click if key == :il
    find(:css, ta(CREATE_NEW_BUTTON_TA, CREATE_NEW_BUTTON_IL)).click
  end

  def set_catalog_name(key = nil, value)
    return find(ta(CATALOGS_NAME_FLD_EP)).set(value) if key == :ep
    return find(:css, CATALOGS_NAME_FLD_IL).set(value) if key == :il
    find(:css, ta(CATALOGS_NAME_FLD_TA, CATALOGS_NAME_FLD_IL)).set(value)
  end

  def click_to_open_proj_drpodown(key = nil)
    return find(ta(PROJECT_DROPDOWN_EP)).click if key == :ep
    return find(:css, PROJECT_DROPDOWN_IL).click if key == :il
    find(:css, ta(PROJECT_DROPDOWN_TA, PROJECT_DROPDOWN_IL)).click
  end

  def select_proj_from_list(key = nil)
    return find(ta(DEFAULT_PROJECT_EP)).click if key == :ep
    return find(:xpath, DEFAULT_PROJECT_IL).click if key == :il
    find(:xpath, ta(DEFAULT_PROJECT_TA, DEFAULT_PROJECT_IL)).click
  end

  def click_ok_in_modal_btn(key = nil)
    return find(ta(OK_IN_MODAL_BTN_EP)).click if key == :ep
    return find(:css, OK_IN_MODAL_BTN_IL).click if key == :il
    find(:css, ta(OK_IN_MODAL_BTN_TA, OK_IN_MODAL_BTN_IL)).click
  end

  def set_name_in_form(key = nil, value)
    return find(ta(CATALOGS_NAME_FORM_EP)).set(value) if key == :ep
    return find(:css, CATALOGS_NAME_FORM_IL).set(value) if key == :il
    find(:css, ta(CATALOGS_NAME_FORM_TA, CATALOGS_NAME_FORM_IL)).set(value)
  end

  def set_name_in_form2(key = nil, value)
    return find(ta(CATALOGS_NAME_FORM_EP)).set(value) if key == :ep
    return find(:css, CATALOGS_NAME_FORM_IL).set(value) if key == :il
    find(:css, ta(CATALOGS_NAME_FORM_TA, CATALOGS_NAME_FORM_IL)).set(value)
  end

  def set_description_in_form(key = nil, value)
    return find(ta(CATALOGS_DESCRIPTION_FORM_EP)).set(value) if key == :ep
    return find(:css, CATALOGS_DESCRIPTION_FORM_IL).set(value) if key == :il
    find(:css, ta(CATALOGS_DESCRIPTION_FORM_TA, CATALOGS_DESCRIPTION_FORM_IL)).set(value)
  end

  def click_add_another(key = nil)
    return find(ta(ADD_ANOTHER_BTN_EP)).click if key == :ep
    return find(:css, ADD_ANOTHER_BTN_IL).click if key == :il
    find(:css, ta(ADD_ANOTHER_BTN_TA, ADD_ANOTHER_BTN_IL)).click
  end

  def click_define_btn(key = nil)
    return find(ta(DEFINE_BTN_EP)).click if key == :ep
    return find(:css, DEFINE_BTN_IL).click if key == :il
    find(:css, ta(DEFINE_BTN_TA, DEFINE_BTN_IL)).click
  end

  def click_to_select_cloud_bees_icon(key = nil)
    return find(ta(CLOUD_BEES_ICON_EP)).click if key == :ep
    return find(:xpath, CLOUD_BEES_ICON_IL).click if key == :il
    find(:xpath, ta(CLOUD_BEES_ICON_TA, CLOUD_BEES_ICON_IL)).click
  end

  def click_to_select_label(key = nil)
    return find(ta(SELECT_BTN_LABEL_EP)).click if key == :ep
    return find(:css, SELECT_BTN_LABEL_IL).click if key == :il
    find(:css, ta(SELECT_BTN_LABEL_TA, SELECT_BTN_LABEL_IL)).click
  end

  def click_to_select_execute_option(key = nil)
    return find(ta(EXECUTE_OPTION_EP)).click if key == :ep
    return find(:css, EXECUTE_OPTION_IL).click if key == :il
    find(:css, ta(EXECUTE_OPTION_TA, EXECUTE_OPTION_IL)).click
  end

  def click_on_procedure_definition (key = nil)
    return find(ta(PROCEDURE_DEFINITION_EP)).click if key == :ep
    return find(:xpath, PROCEDURE_DEFINITION_IL).click if key == :il
    find(:xpath, ta(PROCEDURE_DEFINITION_TA, PROCEDURE_DEFINITION_IL)).click
  end

  def click_procedure_proj_dropdown(key = nil)
    return find(ta(PROCEDURE_PROJ_EP)).click if key == :ep
    return find(:xpath, PROCEDURE_PROJ_IL).click if key == :il
    find(:xpath, ta(PROCEDURE_PROJ_TA, PROCEDURE_PROJ_IL)).click
  end

  def click_to_select_ec_example_proj(key = nil)
    return find(ta(PROCEDURE_EC_EXAMPLE_PROJ_EP)).click if key == :ep
    return find(:xpath, PROCEDURE_EC_EXAMPLE_PROJ_IL).click if key == :il
    find(:xpath, ta(PROCEDURE_EC_EXAMPLE_PROJ_TA, PROCEDURE_EC_EXAMPLE_PROJ_IL)).click
  end

  def click_select_procedure(key = nil)
    return find(ta(SELECT_PROCEDURE_EP)).click if key == :ep
    return find(:xpath, SELECT_PROCEDURE_IL).click if key == :il
    find(:xpath, ta(SELECT_PROCEDURE_TA, SELECT_PROCEDURE_IL)).click
  end

  def click_select_approve_procedure(key = nil)
    return find(ta(SELECT_APPROVE_PROCEDURE_EP)).click if key == :ep
    return find(:css, SELECT_APPROVE_PROCEDURE_IL).click if key == :il
    find(:css, ta(SELECT_APPROVE_PROCEDURE_TA, SELECT_APPROVE_PROCEDURE_IL)).click
  end

  def click_all_catalogs(key = nil)
    return find(ta(ALL_CATALOGS_EP)).click if key == :ep
    return find(:css, ALL_CATALOGS_IL).click if key == :il
    find(:css, ta(ALL_CATALOGS_TA, ALL_CATALOGS_IL)).click
  end

  def click_to_select_created_catalog(key = nil)
    return find(ta(CREATED_CATALOG_EP)).click if key == :ep
    return find(:xpath, CREATED_CATALOG_IL).click if key == :il
    find(:xpath, ta(CREATED_CATALOG_TA, CREATED_CATALOG_IL)).click
  end

  def click_editor_catalog(key = nil)
    return find(ta(CATALOG_EDITOR_EP)).click if key == :ep
    return find(:xpath, CATALOG_EDITOR_IL).click if key == :il
    find(:xpath, ta(CATALOG_EDITOR_TA, CATALOG_EDITOR_IL)).click
  end

  def click_catalog_menu(key = nil)
    return find(ta(CATALOG_HUMBURGER_MENU_EP)).click if key == :ep
    return find(:css, CATALOG_HUMBURGER_MENU_IL).click if key == :il
    find(:css, ta(CATALOG_HUMBURGER_MENU_TA, CATALOG_HUMBURGER_MENU_IL)).click
  end

  def click_delete_catalog(key = nil)
    return find(ta(DELETE_CATALOG_EP)).click if key == :ep
    return find(:css, DELETE_CATALOG_IL).click if key == :il
    find(:css, ta(DELETE_CATALOG_TA, DELETE_CATALOG_IL)).click
  end

  def click_ok_btn_for_accept_delete(key = nil)
    return find(ta(ACCEPT_DELETE_CATALOG_EP)).click if key == :ep
    return find(:css, ACCEPT_DELETE_CATALOG_IL).click if key == :il
    find(:css, ta(ACCEPT_DELETE_CATALOG_TA, ACCEPT_DELETE_CATALOG_IL)).click
  end

  def click_to_open_catalog_list(key = nil)
    return find(ta(CATALOGS_LIST_EP)).click if key == :ep
    return find(:css, CATALOGS_LIST_IL).click if key == :il
    find(:css, ta(CATALOGS_LIST_TA, CATALOGS_LIST_IL)).click
  end

  def click_apps_in_catalog_list(key = nil)
    return find(ta(APPS_IN_CATALOG_LIST_EP)).click if key == :ep
    return find(:css, APPS_IN_CATALOG_LIST_IL).click if key == :il
    find(:css, ta(APPS_IN_CATALOG_LIST_TA, APPS_IN_CATALOG_LIST_IL)).click
  end

  def click_containers_in_catalog_list(key = nil)
    return find(ta(CONTAINERS_IN_CATALOG_LIST_EP)).click if key == :ep
    return find(:css, CONTAINERS_IN_CATALOG_LIST_IL).click if key == :il
    find(:css, ta(CONTAINERS_IN_CATALOG_LIST_TA, CONTAINERS_IN_CATALOG_LIST_IL)).click
  end

  def click_utility_in_catalog_list(key = nil)
    return find(ta(UTILITY_IN_CATALOG_LIST_EP)).click if key == :ep
    return find(:css, UTILITY_IN_CATALOG_LIST_IL).click if key == :il
    find(:css, ta(UTILITY_IN_CATALOG_LIST_TA, UTILITY_IN_CATALOG_LIST_IL)).click
  end
end