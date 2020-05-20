require 'spec_helper'
require_relative '../../../helpers/special_methods'
required_relative_all "/pages/cloud_bees_pages/*.rb"

login_page = CloudBeesLogin.new
artifact_page = CloudBeesArtifact.new

describe 'Preconditions' do

  before(:all) do
    $check_path = false if $run_count > 1
    $caps_chrome['goog:chromeOptions'].delete('mobileEmulation')
    Capybara.page.driver.browser.manage.window.resize_to(1440, 800)
  end

  after(:each) do
    $check_path = true if $run_parameters.include?('search')
  end

  feature 'Create new artifact' do

    $run_count.times do
      scenario 'Test - Recording', "#{$tag}": true do
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
    end

  end
end
