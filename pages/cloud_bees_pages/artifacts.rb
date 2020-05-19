require_relative '../page_extension'

class CloudBeesArtifact < PageExtension

  CREATE_ARTIFACT_LINK_IL = "//a[text()='Create Artifact']"
  CREATE_ARTIFACT_LINK_TA = 'cloud_bees:artifact:create_artifact_link'

  GROUP_ID_NAME_IL = "//input[@id='createArtifact_3_1']"
  GROUP_ID_NAME_TA = 'cloud_bees:artifact:group_id_name'

  ARTIFACT_KEY_NAME_IL = "//input[@id='createArtifact_6_1']"
  ARTIFACT_KEY_NAME_TA = 'cloud_bees:artifact:artifact_key_name'

  DESCRIPTION_TEXTAREA_IL = "//textarea[@id='createArtifact_9_1']"
  DESCRIPTION_TEXTAREA_TA = 'cloud_bees:artifact:description_textarea'

  ARTIFACT_VERSION_NAME_IL = "//textarea[@id='createArtifact_12_1']"
  ARTIFACT_VERSION_NAME_TA = 'cloud_bees:artifact:artifact_version_name'

  TAGS_NAME_IL = "//input[@id='createArtifact_15_1']"
  TAGS_NAME_TA = 'cloud_bees:artifact:tags_name'

  PUBLISH_ARTIFACT_VERSION_IL = "//td[text()='Publish Artifact Version']"
  PUBLISH_ARTIFACT_VERSION_TA = 'cloud_bees:artifact:publish_artifact_version'

  VERSION_NAME_IL = "//input[@id='commonClosurePanel_0_1']"
  VERSION_NAME_TA = 'cloud_bees:artifact:version_name'

  PUBLISH_TAGS_NAME_IL = "//input[@id='commonClosurePanel_12_1']"
  PUBLISH_TAGS_NAME_TA = 'cloud_bees:artifact:publish_tags_name'

  CONFIRM_ARTIFACT_IL = "//button[text()='OK']"
  CONFIRM_ARTIFACT_TA = 'cloud_bees:artifact:confirm_artifact'


  def create_new_artifact(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: CREATE_ARTIFACT_LINK_TA, il: CREATE_ARTIFACT_LINK_IL).click
    end
  end

  def fill_group_id_name_field(key = nil, group_id)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: GROUP_ID_NAME_TA, il: GROUP_ID_NAME_IL).set(group_id)
    end
  end

  def fill_artifact_key_name_field(key = nil, art_key)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: ARTIFACT_KEY_NAME_TA, il: ARTIFACT_KEY_NAME_IL).set(art_key)
    end
  end

  def fill_description_field(key = nil, description)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: DESCRIPTION_TEXTAREA_TA, il: DESCRIPTION_TEXTAREA_IL).set(description)
    end
  end

  def fill_artifact_version_name_field(key = nil, version_name)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: ARTIFACT_VERSION_NAME_TA, il: ARTIFACT_VERSION_NAME_IL).set(version_name)
    end
  end

  def fill_tags_name_field(key = nil, tag_name)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: TAGS_NAME_TA, il: TAGS_NAME_IL).set(tag_name)
    end
  end

  def click_publish_artifact_version(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: PUBLISH_ARTIFACT_VERSION_TA, il: PUBLISH_ARTIFACT_VERSION_IL).click
    end
  end

  def fill_version_name_field(key = nil, ver_name)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: VERSION_NAME_TA, il: VERSION_NAME_IL).set(ver_name)
    end
  end

  def fill_publish_tag_name_field(key = nil, tag_name)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: PUBLISH_TAGS_NAME_TA, il: PUBLISH_TAGS_NAME_IL).set(tag_name)
    end
  end

  def click_confirm_artifact(key = nil)
    within_frame(0) do
      find_element(key, il_type: :xpath, tl: CONFIRM_ARTIFACT_TA, il: CONFIRM_ARTIFACT_IL).click
    end
  end

end
