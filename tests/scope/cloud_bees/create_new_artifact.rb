require 'spec_helper'
require_relative '../../../helpers/special_methods'
require_relative '../../../helpers/element_search_validation'
required_relative_all "/pages/cloud_bees_pages/*.rb"

include ElementSearchValidation

login_page = CloudBeesLogin.new
artifact_page = CloudBeesArtifact.new

describe 'Preconditions' do

  before(:all) do
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  feature 'Create new artifact' do

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

      step "Admin goes to the page", settings('cloud_bees')['artifacts_page'] do |url|
        page.visit url
      end

      step "Admin clicks Create Artifact link" do
        sleep 5 # need wait until iframe is loaded
        artifact_page.create_new_artifact
      end

      step "Admin fills the group id name field", 'test_group_id' do |group_id|
        artifact_page.fill_group_id_name_field group_id
      end

      step "Admin fills the artifact key name field", 'test_artifact_key' do |art_key|
        artifact_page.fill_artifact_key_name_field art_key
      end

      step "Admin fills the Description field", 'test_description' do |description|
        artifact_page.fill_description_field description
      end

      step "Admin fills the Artifact Version Name Template field", 'test_version_name' do |version_name|
        artifact_page.fill_artifact_version_name_field version_name
      end

      step "Admin fills the Tags name field", 'test_tag_name' do |tag_name|
        artifact_page.fill_tags_name_field tag_name
      end

      step "Admin clicks Publish Artifact Version" do
        artifact_page.click_publish_artifact_version
      end

      step "Admin fills the Version name field", 'test_version_name' do |ver_name|
        artifact_page.fill_version_name_field ver_name
      end

      step "Admin fills the Publish Tags name field", 'test_tag_name' do |tag_name|
        artifact_page.fill_publish_tag_name_field tag_name
      end

      step "Admin confirm new Artifact" do
        artifact_page.click_confirm_artifact
      end

      sleep 3
    end

    scenario 'Searching IL', il: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_TA, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_TA, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_TA, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button
      end

      step "Admin goes to the page", settings('cloud_bees')['artifacts_page'] do |url|
        page.visit url
      end

      step "Admin clicks Create Artifact link" do
        sleep 5 # need wait until iframe is loaded
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::CREATE_ARTIFACT_LINK_TA, CloudBeesArtifact::CREATE_ARTIFACT_LINK_IL }
        artifact_page.create_new_artifact
      end

      step "Admin fills the group id name field", 'test_group_id' do |group_id|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::GROUP_ID_NAME_TA, CloudBeesArtifact::GROUP_ID_NAME_IL }
        artifact_page.fill_group_id_name_field group_id
      end

      step "Admin fills the artifact key name field", 'test_artifact_key' do |art_key|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::ARTIFACT_KEY_NAME_TA, CloudBeesArtifact::ARTIFACT_KEY_NAME_IL }
        artifact_page.fill_artifact_key_name_field art_key
      end

      step "Admin fills the Description field", 'test_description' do |description|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::DESCRIPTION_TEXTAREA_TA, CloudBeesArtifact::DESCRIPTION_TEXTAREA_IL }
        artifact_page.fill_description_field description
      end

      step "Admin fills the Artifact Version Name Template field", 'test_version_name' do |version_name|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::ARTIFACT_VERSION_NAME_TA, CloudBeesArtifact::ARTIFACT_VERSION_NAME_IL }
        artifact_page.fill_artifact_version_name_field version_name
      end

      step "Admin fills the Tags name field", 'test_tag_name' do |tag_name|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::TAGS_NAME_TA, CloudBeesArtifact::TAGS_NAME_IL }
        artifact_page.fill_tags_name_field tag_name
      end

      step "Admin clicks Publish Artifact Version" do
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::PUBLISH_ARTIFACT_VERSION_TA, CloudBeesArtifact::PUBLISH_ARTIFACT_VERSION_IL }
        artifact_page.click_publish_artifact_version
      end

      step "Admin fills the Version name field", 'test_version_name' do |ver_name|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::VERSION_NAME_TA, CloudBeesArtifact::VERSION_NAME_IL }
        artifact_page.fill_version_name_field ver_name
      end

      step "Admin fills the Publish Tags name field", 'test_tag_name' do |tag_name|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::PUBLISH_TAGS_NAME_TA, CloudBeesArtifact::PUBLISH_TAGS_NAME_IL }
        artifact_page.fill_publish_tag_name_field tag_name
      end

      step "Admin confirm new Artifact" do
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::CONFIRM_ARTIFACT_TA, CloudBeesArtifact::CONFIRM_ARTIFACT_IL }
        artifact_page.click_confirm_artifact
      end

      sleep 3
    end

    # Element Picker from Repository

    scenario 'Searching EP', ep: true do
      step "User goes to the page", settings('cloud_bees')['login_page'] do |url|
        page.visit url
      end

      step "Admin do login", settings('cloud_bees') do |credentials|
        check_element_path :css, CloudBeesLogin::USERNAME_FIELD_EP, CloudBeesLogin::USERNAME_FIELD_IL
        login_page.fill_username_field :ep, credentials['username']

        check_element_path :css, CloudBeesLogin::PASSWORD_FIELD_EP, CloudBeesLogin::PASSWORD_FIELD_IL
        login_page.fill_pass_field :ep, credentials['pass']

        check_element_path :css, CloudBeesLogin::SIGN_IN_BTN_EP, CloudBeesLogin::SIGN_IN_BTN_IL
        login_page.click_sign_in_button :ep
      end

      step "Admin goes to the page", settings('cloud_bees')['artifacts_page'] do |url|
        page.visit url
      end

      step "Admin clicks Create Artifact link" do
        sleep 5 # need wait until iframe is loaded
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::CREATE_ARTIFACT_LINK_EP, CloudBeesArtifact::CREATE_ARTIFACT_LINK_IL }
        artifact_page.create_new_artifact :ep
      end

      step "Admin fills the group id name field", 'test_group_id' do |group_id|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::GROUP_ID_NAME_EP, CloudBeesArtifact::GROUP_ID_NAME_IL }
        artifact_page.fill_group_id_name_field :ep, group_id
      end

      step "Admin fills the artifact key name field", 'test_artifact_name' do |art_key|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::ARTIFACT_KEY_NAME_EP, CloudBeesArtifact::ARTIFACT_KEY_NAME_IL }
        artifact_page.fill_artifact_key_name_field :ep, art_key
      end

      step "Admin fills the Description field", 'test_description' do |description|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::DESCRIPTION_TEXTAREA_EP, CloudBeesArtifact::DESCRIPTION_TEXTAREA_IL }
        artifact_page.fill_description_field :ep, description
      end

      step "Admin fills the Artifact Version Name Template field", 'test_version_name' do |version_name|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::ARTIFACT_VERSION_NAME_EP, CloudBeesArtifact::ARTIFACT_VERSION_NAME_IL }
        artifact_page.fill_artifact_version_name_field :ep, version_name
      end

      step "Admin fills the Tags name field", 'test_tag_name' do |tag_name|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::TAGS_NAME_EP, CloudBeesArtifact::TAGS_NAME_IL }
        artifact_page.fill_tags_name_field :ep, tag_name
      end

      step "Admin clicks Publish Artifact Version" do
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::PUBLISH_ARTIFACT_VERSION_EP, CloudBeesArtifact::PUBLISH_ARTIFACT_VERSION_IL }
        artifact_page.click_publish_artifact_version :ep
      end

      step "Admin fills the Version name field", 'test_version_name' do |ver_name|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::VERSION_NAME_EP, CloudBeesArtifact::VERSION_NAME_IL }
        artifact_page.fill_version_name_field :ep, ver_name
      end

      step "Admin fills the Publish Tags name field", 'test_tag_name' do |tag_name|
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::PUBLISH_TAGS_NAME_EP, CloudBeesArtifact::PUBLISH_TAGS_NAME_IL }
        artifact_page.fill_publish_tag_name_field :ep, tag_name
      end

      step "Admin confirm new Artifact" do
        within_frame(0) { check_element_path :xpath, CloudBeesArtifact::CONFIRM_ARTIFACT_EP, CloudBeesArtifact::CONFIRM_ARTIFACT_IL }
        artifact_page.click_confirm_artifact :ep
      end

      sleep 3
    end


  end
end