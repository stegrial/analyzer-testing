require 'spec_helper'
require_relative '../page_extension'

class CloudBeesArtifact
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include PageExtension

  CREATE_ARTIFACT_LINK_IL = "//a[text()='Create Artifact']"
  CREATE_ARTIFACT_LINK_TA = 'cloud_bees:artifact:create_artifact_link'
  CREATE_ARTIFACT_LINK_EP = 'EP:cloud_bees:artifact:create_artifact_link'

  GROUP_ID_NAME_IL = "//input[@id='createArtifact_3_1']"
  GROUP_ID_NAME_TA = 'cloud_bees:artifact:group_id_name'
  GROUP_ID_NAME_EP = 'EP:cloud_bees:artifact:group_id_name'

  ARTIFACT_KEY_NAME_IL = "//input[@id='createArtifact_6_1']"
  ARTIFACT_KEY_NAME_TA = 'cloud_bees:artifact:artifact_key_name'
  ARTIFACT_KEY_NAME_EP = 'EP:cloud_bees:artifact:artifact_key_name'

  DESCRIPTION_TEXTAREA_IL = "//textarea[@id='createArtifact_9_1']"
  DESCRIPTION_TEXTAREA_TA = 'cloud_bees:artifact:description_textarea'
  DESCRIPTION_TEXTAREA_EP = 'EP:cloud_bees:artifact:description_textarea'

  ARTIFACT_VERSION_NAME_IL = "//textarea[@id='createArtifact_12_1']"
  ARTIFACT_VERSION_NAME_TA = 'cloud_bees:artifact:artifact_version_name'
  ARTIFACT_VERSION_NAME_EP = 'EP:cloud_bees:artifact:artifact_version_name'

  TAGS_NAME_IL = "//input[@id='createArtifact_15_1']"
  TAGS_NAME_TA = 'cloud_bees:artifact:tags_name'
  TAGS_NAME_EP = 'EP:cloud_bees:artifact:tags_name'

  PUBLISH_ARTIFACT_VERSION_IL = "//td[text()='Publish Artifact Version']"
  PUBLISH_ARTIFACT_VERSION_TA = 'cloud_bees:artifact:publish_artifact_version'
  PUBLISH_ARTIFACT_VERSION_EP = 'EP:cloud_bees:artifact:publish_artifact_version'

  VERSION_NAME_IL = "//input[@id='commonClosurePanel_0_1']"
  VERSION_NAME_TA = 'cloud_bees:artifact:version_name'
  VERSION_NAME_EP = 'EP:cloud_bees:artifact:version_name'

  PUBLISH_TAGS_NAME_IL = "//input[@id='commonClosurePanel_12_1']"
  PUBLISH_TAGS_NAME_TA = 'cloud_bees:artifact:publish_tags_name'
  PUBLISH_TAGS_NAME_EP = 'EP:cloud_bees:artifact:publish_tags_name'

  CONFIRM_ARTIFACT_IL = "//button[text()='OK']"
  CONFIRM_ARTIFACT_TA = 'cloud_bees:artifact:confirm_artifact'
  CONFIRM_ARTIFACT_EP = 'EP:cloud_bees:artifact:confirm_artifact'


  def create_new_artifact(key = nil)
    post_processing key do
      within_frame(0) do
        return find(ta(CREATE_ARTIFACT_LINK_EP)).click if key == :ep
        return find(:xpath, CREATE_ARTIFACT_LINK_IL).click if key == :il
        find(:xpath, ta(CREATE_ARTIFACT_LINK_TA, CREATE_ARTIFACT_LINK_IL)).click
      end
    end
  end

  def fill_group_id_name_field(key = nil, group_id)
    post_processing key do
      within_frame(0) do
        return find(ta(GROUP_ID_NAME_EP)).set(group_id) if key == :ep
        return find(:xpath, GROUP_ID_NAME_IL).set(group_id) if key == :il
        find(:xpath, ta(GROUP_ID_NAME_TA, GROUP_ID_NAME_IL)).set(group_id)
      end
    end
  end

  def fill_artifact_key_name_field(key = nil, art_key)
    post_processing key do
      within_frame(0) do
        return find(ta(ARTIFACT_KEY_NAME_EP)).set(art_key) if key == :ep
        return find(:xpath, ARTIFACT_KEY_NAME_IL).set(art_key) if key == :il
        find(:xpath, ta(ARTIFACT_KEY_NAME_TA, ARTIFACT_KEY_NAME_IL)).set(art_key)
      end
    end
  end

  def fill_description_field(key = nil, description)
    post_processing key do
      within_frame(0) do
        return find(ta(DESCRIPTION_TEXTAREA_EP)).set(description) if key == :ep
        return find(:xpath, DESCRIPTION_TEXTAREA_IL).set(description) if key == :il
        find(:xpath, ta(DESCRIPTION_TEXTAREA_TA, DESCRIPTION_TEXTAREA_IL)).set(description)
      end
    end
  end

  def fill_artifact_version_name_field(key = nil, version_name)
    post_processing key do
      within_frame(0) do
        return find(ta(ARTIFACT_VERSION_NAME_EP)).set(version_name) if key == :ep
        return find(:xpath, ARTIFACT_VERSION_NAME_IL).set(version_name) if key == :il
        find(:xpath, ta(ARTIFACT_VERSION_NAME_TA, ARTIFACT_VERSION_NAME_IL)).set(version_name)
      end
    end
  end

  def fill_tags_name_field(key = nil, tag_name)
    post_processing key do
      within_frame(0) do
        return find(ta(TAGS_NAME_EP)).set(tag_name) if key == :ep
        return find(:xpath, TAGS_NAME_IL).set(tag_name) if key == :il
        find(:xpath, ta(TAGS_NAME_TA, TAGS_NAME_IL)).set(tag_name)
      end
    end
  end

  def click_publish_artifact_version(key = nil)
    post_processing key do
      within_frame(0) do
        return find(ta(PUBLISH_ARTIFACT_VERSION_EP)).click if key == :ep
        return find(:xpath, PUBLISH_ARTIFACT_VERSION_IL).click if key == :il
        find(:xpath, ta(PUBLISH_ARTIFACT_VERSION_TA, PUBLISH_ARTIFACT_VERSION_IL)).click
      end
    end
  end

  def fill_version_name_field(key = nil, ver_name)
    post_processing key do
      within_frame(0) do
        return find(ta(VERSION_NAME_EP)).set(ver_name) if key == :ep
        return find(:xpath, VERSION_NAME_IL).set(ver_name) if key == :il
        find(:xpath, ta(VERSION_NAME_TA, VERSION_NAME_IL)).set(ver_name)
      end
    end
  end

  def fill_publish_tag_name_field(key = nil, tag_name)
    post_processing key do
      within_frame(0) do
        return find(ta(PUBLISH_TAGS_NAME_EP)).set(tag_name) if key == :ep
        return find(:xpath, PUBLISH_TAGS_NAME_IL).set(tag_name) if key == :il
        find(:xpath, ta(PUBLISH_TAGS_NAME_TA, PUBLISH_TAGS_NAME_IL)).set(tag_name)
      end
    end
  end

  def click_confirm_artifact(key = nil)
    post_processing key do
      within_frame(0) do
        return find(ta(CONFIRM_ARTIFACT_EP)).click if key == :ep
        return find(:xpath, CONFIRM_ARTIFACT_IL).click if key == :il
        find(:xpath, ta(CONFIRM_ARTIFACT_TA, CONFIRM_ARTIFACT_IL)).click
      end
    end
  end

end
