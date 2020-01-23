require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../pages/united_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
catalogs_page = CloudBeesCatalogs.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440,800)
  end

  after(:each) do
    step "Remove created catalog", settings('cloud_bees') do |data|
      page.visit data['catalogs_page']
      sleep 3
      catalogs_page.click_all_catalogs :il
      catalogs_page.click_to_select_created_catalog :il, 'new_name_catalog'
      catalogs_page.select_created_catalog :il
      catalogs_page.click_editor_catalog :il
      catalogs_page.click_catalog_menu :il
      catalogs_page.click_delete_catalog :il
      catalogs_page.click_ok_btn_for_accept_delete :il
    end
  end

  feature 'CloudBees - Creating new Service Catalog' do

    # Initial locators with Recording

    scenario 'Recording IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        login_page.fill_username_field credentials['username']
        login_page.fill_pass_field credentials['pass']
        login_page.click_sign_in_button
      end

      step "User goes to the page", settings('cloud_bees')['catalogs_page'] do |url|
        page.visit url
      end

      step "User clicks to create new catalog" do
        catalogs_page.click_to_create_new_catalog
      end


      step "User clicks to create new button" do
        catalogs_page.click_to_create_new_btn
      end

      step "User set name new catalog", 'new_name_catalog' do |value|
        catalogs_page.set_catalog_name value
      end

      step "User clicks to open project dropdown of new catalog" do
        catalogs_page.click_to_open_proj_drpodown
      end

      step "User select default project from list" do
       catalogs_page.select_proj_from_list
      end

      step "User clicks ok button in modal" do
        catalogs_page.click_ok_in_modal_btn :il # step is duplicated below
      end

      step "User set name in form", 'new_form_name_1' do |value|
        catalogs_page.set_name_in_form :il, value # step is duplicated below
      end

      step "User set description in form", 'description' do |value|
        catalogs_page.set_description_in_form value
      end

      step "User clicks add another button" do
        catalogs_page.click_add_another
        sleep 3 # to wait for the catalog item to be added
      end

      step "User set name in form", 'new_form_name_2' do |value|
        catalogs_page.set_name_in_form value
      end

      step "User clicks define button" do
        catalogs_page.click_define_btn
      end

      step "User clicks to select cloud bees icon" do
        catalogs_page.click_to_select_cloud_bees_icon
      end

      step "User clicks to select label" do
        catalogs_page.click_to_select_label
      end

      step "User clicks to select execute option" do
        catalogs_page.click_to_select_execute_option
      end

      step "User clicks on procedure definition" do
        catalogs_page.click_on_procedure_definition
      end

      step "User clicks to open procedure project dropdown" do
        catalogs_page.click_procedure_proj_dropdown
      end

      step "User clicks on ec example project" do
        catalogs_page.click_to_select_ec_example_proj
      end

      step "User clicks to open procedure dropdown" do
        catalogs_page.click_select_procedure
      end

      step "User clicks to select approve procedure" do
        catalogs_page.click_select_approve_procedure
      end

      step "User clicks ok button in modal" do
        catalogs_page.click_ok_in_modal_btn
      end
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field  credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field  credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "User goes to the page", settings('cloud_bees')['catalogs_page'] do |url|
        page.visit url
      end

      step "User clicks to create new catalog" do
        check_element_path :css, CloudBeesCatalogs::CREATE_NEW_CATALOG_TA, CloudBeesCatalogs::CREATE_NEW_CATALOG_IL
        catalogs_page.click_to_create_new_catalog
      end

      step "User clicks to create new button" do
        check_element_path :css, CloudBeesCatalogs::CREATE_NEW_BUTTON_TA, CloudBeesCatalogs::CREATE_NEW_BUTTON_IL
        catalogs_page.click_to_create_new_btn
      end

      step "User set name new catalog",  'new_name_catalog' do |value|
        check_element_path :css, CloudBeesCatalogs::CATALOGS_NAME_FLD_TA, CloudBeesCatalogs::CATALOGS_NAME_FLD_IL
        catalogs_page.set_catalog_name value
      end

      step "User clicks to open project dropdown of new catalog" do
        check_element_path :css, CloudBeesCatalogs::PROJECT_DROPDOWN_TA, CloudBeesCatalogs::PROJECT_DROPDOWN_IL
        catalogs_page.click_to_open_proj_drpodown
      end

      step "User select default project from list" do
        check_element_path :xpath, CloudBeesCatalogs::DEFAULT_PROJECT_TA, CloudBeesCatalogs::DEFAULT_PROJECT_IL
        catalogs_page.select_proj_from_list
      end

      step "User clicks ok button in modal" do
        check_element_path :css, CloudBeesCatalogs::OK_IN_MODAL_BTN_TA, CloudBeesCatalogs::OK_IN_MODAL_BTN_IL
        catalogs_page.click_ok_in_modal_btn
      end

      step "User set name in form", 'new_form_name_1' do |value|
        check_element_path :css, CloudBeesCatalogs::CATALOGS_NAME_FORM_TA, CloudBeesCatalogs::CATALOGS_NAME_FORM_IL
        catalogs_page.set_name_in_form value
      end

      step "User set description in form", 'description' do |value|
        check_element_path :css, CloudBeesCatalogs::CATALOGS_DESCRIPTION_FORM_TA, CloudBeesCatalogs::CATALOGS_DESCRIPTION_FORM_IL
        catalogs_page.set_description_in_form  value
      end

      step "User clicks add another button" do
        check_element_path :css, CloudBeesCatalogs::ADD_ANOTHER_BTN_TA, CloudBeesCatalogs::ADD_ANOTHER_BTN_IL
        catalogs_page.click_add_another
        sleep 3 # to wait for the catalog item to be added
      end

      step "User set name in form", 'new_form_name_2' do |value|
        check_element_path :css, CloudBeesCatalogs::CATALOGS_NAME_FORM_TA, CloudBeesCatalogs::CATALOGS_NAME_FORM_IL
        catalogs_page.set_name_in_form value
      end

      step "User clicks define button" do
        check_element_path :css, CloudBeesCatalogs::DEFINE_BTN_TA, CloudBeesCatalogs::DEFINE_BTN_IL
        catalogs_page.click_define_btn
      end

      step "User clicks to select cloud bees icon" do
        check_element_path :xpath, CloudBeesCatalogs::CLOUD_BEES_ICON_TA, CloudBeesCatalogs::CLOUD_BEES_ICON_IL
        catalogs_page.click_to_select_cloud_bees_icon
      end

      step "User clicks to select label" do
        check_element_path :css, CloudBeesCatalogs::SELECT_BTN_LABEL_TA, CloudBeesCatalogs::SELECT_BTN_LABEL_IL
        catalogs_page.click_to_select_label
      end

      step "User clicks to select execute option" do
        check_element_path :css, CloudBeesCatalogs::EXECUTE_OPTION_TA, CloudBeesCatalogs::EXECUTE_OPTION_IL
        catalogs_page.click_to_select_execute_option
      end

      step "User clicks on procedure definition" do
        check_element_path :xpath, CloudBeesCatalogs::PROCEDURE_DEFINITION_TA, CloudBeesCatalogs::PROCEDURE_DEFINITION_IL
        catalogs_page.click_on_procedure_definition
      end

      step "User clicks to open procedure project dropdown" do
        check_element_path :xpath, CloudBeesCatalogs::PROCEDURE_PROJ_TA, CloudBeesCatalogs::PROCEDURE_PROJ_IL
        catalogs_page.click_procedure_proj_dropdown
      end

      step "User clicks on ec example project" do
        check_element_path :xpath, CloudBeesCatalogs::PROCEDURE_EC_EXAMPLE_PROJ_TA, CloudBeesCatalogs::PROCEDURE_EC_EXAMPLE_PROJ_IL
        catalogs_page.click_to_select_ec_example_proj
      end

      step "User clicks to open procedure dropdown" do
        check_element_path :xpath, CloudBeesCatalogs::SELECT_PROCEDURE_TA, CloudBeesCatalogs::SELECT_PROCEDURE_IL
        catalogs_page.click_select_procedure
      end

      step "User clicks to select approve procedure" do
        check_element_path :css, CloudBeesCatalogs::SELECT_APPROVE_PROCEDURE_TA, CloudBeesCatalogs::SELECT_APPROVE_PROCEDURE_IL
        catalogs_page.click_select_approve_procedure
      end

      step "User clicks ok button in modal" do
        check_element_path :css, CloudBeesCatalogs::OK_IN_MODAL_BTN_TA, CloudBeesCatalogs::OK_IN_MODAL_BTN_IL
        catalogs_page.click_ok_in_modal_btn
      end
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field :ep,  credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_EP, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field :ep, credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_EP, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
      end

      step "User goes to the page", settings('cloud_bees')['catalogs_page'] do |url|
        page.visit url
      end

      step "User clicks to create new catalog" do
        check_element_path :css, CloudBeesCatalogs::CREATE_NEW_CATALOG_EP, CloudBeesCatalogs::CREATE_NEW_CATALOG_IL
        catalogs_page.click_to_create_new_catalog :ep
      end

      step "User clicks to create new button" do
        check_element_path :css, CloudBeesCatalogs::CREATE_NEW_BUTTON_EP, CloudBeesCatalogs::CREATE_NEW_BUTTON_IL
        catalogs_page.click_to_create_new_btn :ep
      end

      step "User set name new catalog",  'new_name_catalog' do |value|
        check_element_path :css, CloudBeesCatalogs::CATALOGS_NAME_FLD_EP, CloudBeesCatalogs::CATALOGS_NAME_FLD_IL
        catalogs_page.set_catalog_name :ep, value
      end

      step "User clicks to open project dropdown of new catalog" do
        check_element_path :css, CloudBeesCatalogs::PROJECT_DROPDOWN_EP, CloudBeesCatalogs::PROJECT_DROPDOWN_IL
        catalogs_page.click_to_open_proj_drpodown :ep
      end

      step "User select default project from list" do
        check_element_path :xpath, CloudBeesCatalogs::DEFAULT_PROJECT_EP, CloudBeesCatalogs::DEFAULT_PROJECT_IL
        catalogs_page.select_proj_from_list :ep
      end

      step "User clicks ok button in modal" do
        check_element_path :css, CloudBeesCatalogs::OK_IN_MODAL_BTN_EP, CloudBeesCatalogs::OK_IN_MODAL_BTN_IL
        catalogs_page.click_ok_in_modal_btn :ep
      end

      step "User set name in form", 'new_form_name_1' do |value|
        check_element_path :css, CloudBeesCatalogs::CATALOGS_NAME_FORM_EP, CloudBeesCatalogs::CATALOGS_NAME_FORM_IL
        catalogs_page.set_name_in_form :ep, value
      end

      step "User set description in form", description do |value|
        check_element_path :css, CloudBeesCatalogs::CATALOGS_DESCRIPTION_FORM_EP, CloudBeesCatalogs::CATALOGS_DESCRIPTION_FORM_IL
        catalogs_page.set_description_in_form :ep, value
      end

      step "User clicks add another button" do
        check_element_path :css, CloudBeesCatalogs::ADD_ANOTHER_BTN_EP, CloudBeesCatalogs::ADD_ANOTHER_BTN_IL
        catalogs_page.click_add_another :ep
        sleep 3 # to wait for the catalog item to be added
      end

      step "User set name in form", 'new_form_name_2' do |value|
        check_element_path :css, CloudBeesCatalogs::CATALOGS_NAME_FORM_EP, CloudBeesCatalogs::CATALOGS_NAME_FORM_IL
        catalogs_page.set_name_in_form :ep, value
      end

      step "User clicks define button" do
        check_element_path :css, CloudBeesCatalogs::DEFINE_BTN_EP, CloudBeesCatalogs::DEFINE_BTN_IL
        catalogs_page.click_define_btn :ep
      end

      step "User clicks to select cloud bees icon" do
        check_element_path :xpath, CloudBeesCatalogs::CLOUD_BEES_ICON_EP, CloudBeesCatalogs::CLOUD_BEES_ICON_IL
        catalogs_page.click_to_select_cloud_bees_icon :ep
      end

      step "User clicks to select label" do
        check_element_path :css, CloudBeesCatalogs::SELECT_BTN_LABEL_EP, CloudBeesCatalogs::SELECT_BTN_LABEL_IL
        catalogs_page.click_to_select_label :ep
      end

      step "User clicks to select execute option" do
        check_element_path :css, CloudBeesCatalogs::EXECUTE_OPTION_EP, CloudBeesCatalogs::EXECUTE_OPTION_IL
        catalogs_page.click_to_select_execute_option :ep
      end

      step "User clicks on procedure definition" do
        check_element_path :xpath, CloudBeesCatalogs::PROCEDURE_DEFINITION_EP, CloudBeesCatalogs::PROCEDURE_DEFINITION_IL
        catalogs_page.click_on_procedure_definition :ep
      end

      step "User clicks to open procedure project dropdown" do
        check_element_path :xpath, CloudBeesCatalogs::PROCEDURE_PROJ_EP, CloudBeesCatalogs::PROCEDURE_PROJ_IL
        catalogs_page.click_procedure_proj_dropdown :ep
      end

      step "User clicks on ec example project" do
        check_element_path :xpath, CloudBeesCatalogs::PROCEDURE_EC_EXAMPLE_PROJ_EP, CloudBeesCatalogs::PROCEDURE_EC_EXAMPLE_PROJ_IL
        catalogs_page.click_to_select_ec_example_proj :ep
      end

      step "User clicks to open procedure dropdown" do
        check_element_path :xpath, CloudBeesCatalogs::SELECT_PROCEDURE_EP, CloudBeesCatalogs::SELECT_PROCEDURE_IL
        catalogs_page.click_select_procedure :ep
      end

      step "User clicks to select approve procedure" do
        check_element_path :css, CloudBeesCatalogs::SELECT_APPROVE_PROCEDURE_EP, CloudBeesCatalogs::SELECT_APPROVE_PROCEDURE_IL
        catalogs_page.click_select_approve_procedure :ep
      end

      step "User clicks ok button in modal" do
        check_element_path :css, CloudBeesCatalogs::OK_IN_MODAL_BTN_EP, CloudBeesCatalogs::OK_IN_MODAL_BTN_IL
        catalogs_page.click_ok_in_modal_btn :ep
      end
    end
  end
end