require_relative '../page_extension'

class CloudBeesPlatformHomePage < PageExtension

  PROJECTS_LINK_IL = "//a[@title='Projects (ALT+O)']"
  PROJECTS_LINK_TA = "cloud_bees:platform:projects_link"

  JOBS_LINK_IL = "//a[@title='Jobs (ALT+J)']"
  JOBS_LINK_TA = "cloud_bees:platform:jobs_link"

  WORKFLOWS_LINK_IL = "//a[@title='Workflows (ALT+W)']"
  WORKFLOWS_LINK_TA = "cloud_bees:platform:workflows_link"

  CLOUD_LINK_IL = "//a[@title='Cloud (ALT+U)']"
  CLOUD_LINK_TA = "cloud_bees:platform:cloud_link"

  ARTIFACTS_LINK_IL = "//a[@title='Artifacts (ALT+T)']"
  ARTIFACTS_LINK_TA = "cloud_bees:platform:artifacts_link"

  SEARCH_LINK_IL = "//a[@title='Search (ALT+F)']"
  SEARCH_LINK_TA = "cloud_bees:platform:search_link"

  ADMINISTRATION_LINK_IL = "//a[@title='Administration (ALT+A)']"
  ADMINISTRATION_LINK_TA = "cloud_bees:platform:administration_link"

  JOB_RUN_REPORTS_SECOND_LINE_IL = "(//span[@class='nowrap'])[2]/a"
  JOB_RUN_REPORTS_SECOND_LINE_TA = "cloud_bees:platform:jobs_second_run_report"

  PARAMETERS_IL = "(//td[@class='subsection_tab_middleheader_titleunselected']/a[text()='Parameters'])[2]"
  PARAMETERS_TA = "cloud_bees:platform:parameters_table"

  DIAGNOSTICS_IL = "(//td[@class='subsection_tab_middleheader_titleunselected']/a[text()='Diagnostics'])[1]"
  DIAGNOSTICS_TA = "cloud_bees:platform:diagnostics_table"

  SUBJECT_SECOND_ROW_IL = "#logPageSearch_row2"
  SUBJECT_SECOND_ROW_TA = "cloud_bees:platform:subject_second_row"

  SORT_LINK_IL = "//a[text()='Time']"
  SORT_LINK_TA = "cloud_bees:platform:administration:sort_link"

  def click_projects_link(key = nil)
    find_element(key, il_type: :xpath, tl: PROJECTS_LINK_TA, il: PROJECTS_LINK_IL, check_path: $check_path).click
  end

  def click_jobs_link(key = nil)
    find_element(key, il_type: :xpath, tl: JOBS_LINK_TA, il: JOBS_LINK_IL, check_path: $check_path).click
  end

  def click_workflows_link(key = nil)
    find_element(key, il_type: :xpath, tl: WORKFLOWS_LINK_TA, il: WORKFLOWS_LINK_IL, check_path: $check_path).click
  end

  def click_cloud_link(key = nil)
    find_element(key, il_type: :xpath, tl: CLOUD_LINK_TA, il: CLOUD_LINK_IL, check_path: $check_path).click
  end

  def click_artifacts_link(key = nil)
    find_element(key, il_type: :xpath, tl: ARTIFACTS_LINK_TA, il: ARTIFACTS_LINK_IL, check_path: $check_path).click
  end

  def click_search_link(key = nil)
    find_element(key, il_type: :xpath, tl: SEARCH_LINK_TA, il: SEARCH_LINK_IL, check_path: $check_path).click
  end

  def click_administration_link(key = nil)
    find_element(key, il_type: :xpath, tl: ADMINISTRATION_LINK_TA, il: ADMINISTRATION_LINK_IL, check_path: $check_path).click
  end

  def click_to_open_second_row_run_report(key = nil)
    find_element(key, il_type: :xpath, tl: JOB_RUN_REPORTS_SECOND_LINE_TA, il: JOB_RUN_REPORTS_SECOND_LINE_IL, check_path: $check_path).click
  end

  def click_to_switch_parameters_in_table(key = nil)
    find_element(key, il_type: :xpath, tl: PARAMETERS_TA, il: PARAMETERS_IL, check_path: $check_path).click
  end

  def click_to_switch_diagnostics_in_table(key = nil)
    find_element(key, il_type: :xpath, tl: DIAGNOSTICS_TA, il: DIAGNOSTICS_IL, check_path: $check_path).click
  end

  def click_to_open_second_subject_row(key = nil)
    find_element(key, il_type: :css, tl: SUBJECT_SECOND_ROW_TA, il: SUBJECT_SECOND_ROW_IL, check_path: $check_path).click
  end

  def click_sort_link(key = nil)
    find_element(key, il_type: :xpath, tl: SORT_LINK_TA, il: SORT_LINK_IL, check_path: $check_path).click
  end

end
