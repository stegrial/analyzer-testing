require 'spec_helper'
require_relative '../../helpers/special_methods'

class CloudBeesPlatformHomePage
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ExtendPage

  PROJECTS_LINK_IL = "//a[@title='Projects (ALT+O)']"
  PROJECTS_LINK_TA = "cloud_bees:platform:projects_link"
  PROJECTS_LINK_EP = "EP:cloud_bees:platform:projects_link"

  JOBS_LINK_IL = "//a[@title='Jobs (ALT+J)']"
  JOBS_LINK_TA = "cloud_bees:platform:jobs_link"
  JOBS_LINK_EP = "EP:cloud_bees:platform:jobs_link"

  WORKFLOWS_LINK_IL = "//a[@title='Workflows (ALT+W)']"
  WORKFLOWS_LINK_TA = "cloud_bees:platform:workflows_link"
  WORKFLOWS_LINK_EP = "EP:cloud_bees:platform:workflows_link"

  CLOUD_LINK_IL = "//a[@title='Cloud (ALT+U)']"
  CLOUD_LINK_TA = "cloud_bees:platform:cloud_link"
  CLOUD_LINK_EP = "EP:cloud_bees:platform:cloud_link"

  ARTIFACTS_LINK_IL = "//a[@title='Artifacts (ALT+T)']"
  ARTIFACTS_LINK_TA = "cloud_bees:platform:artifacts_link"
  ARTIFACTS_LINK_EP = "EP:cloud_bees:platform:artifacts_link"

  SEARCH_LINK_IL = "//a[@title='Search (ALT+F)']"
  SEARCH_LINK_TA = "cloud_bees:platform:search_link"
  SEARCH_LINK_EP = "EP:cloud_bees:platform:search_link"

  ADMINISTRATION_LINK_IL = "//a[@title='Administration (ALT+A)']"
  ADMINISTRATION_LINK_TA = "cloud_bees:platform:administration_link"
  ADMINISTRATION_LINK_EP = "EP:cloud_bees:platform:administration_link"

  JOB_RUN_REPORTS_SECOND_LINE_IL = "(//span[@class='nowrap'])[2]/a"
  JOB_RUN_REPORTS_SECOND_LINE_TA = "cloud_bees:platform:jobs_second_run_report"
  JOB_RUN_REPORTS_SECOND_LINE_EP = "EP:cloud_bees:platform:jobs_second_run_report"

  PARAMETERS_IL = "(//td[@class='subsection_tab_middleheader_titleunselected']/a[text()='Parameters'])[2]"
  PARAMETERS_TA = "cloud_bees:platform:parameters_table"
  PARAMETERS_EP = "EP:cloud_bees:platform:parameters_table"

  DIAGNOSTICS_IL = "(//td[@class='subsection_tab_middleheader_titleunselected']/a[text()='Diagnostics'])[1]"
  DIAGNOSTICS_TA = "cloud_bees:platform:diagnostics_table"
  DIAGNOSTICS_EP = "EP:cloud_bees:platform:diagnostics_table"

  SUBJECT_SECOND_ROW_IL = "#logPageSearch_row2"
  SUBJECT_SECOND_ROW_TA = "cloud_bees:platform:subject_second_row"
  SUBJECT_SECOND_ROW_EP = "EP:cloud_bees:platform:subject_second_row"

  SORT_LINK_IL = "//a[text()='Time']"
  SORT_LINK_TA = "cloud_bees:platform:administration:sort_link"
  SORT_LINK_EP = "EP:cloud_bees:platform:administration:sort_link"

  def click_projects_link(key = nil)
    post_processing key do
      return find(ta(PROJECTS_LINK_EP)).click if key == :ep
      return find(:xpath, PROJECTS_LINK_IL).click if key == :il
      find(:xpath, ta(PROJECTS_LINK_TA, PROJECTS_LINK_IL)).click
    end
  end

  def click_jobs_link(key = nil)
    post_processing key do
      return find(ta(JOBS_LINK_EP)).click if key == :ep
      return find(:xpath, JOBS_LINK_IL).click if key == :il
      find(:xpath, ta(JOBS_LINK_TA, JOBS_LINK_IL)).click
    end
  end

  def click_workflows_link(key = nil)
    post_processing key do
      return find(ta(WORKFLOWS_LINK_EP)).click if key == :ep
      return find(:xpath, WORKFLOWS_LINK_IL).click if key == :il
      find(:xpath, ta(WORKFLOWS_LINK_TA, WORKFLOWS_LINK_IL)).click
    end
  end

  def click_cloud_link(key = nil)
    post_processing key do
      return find(ta(CLOUD_LINK_EP)).click if key == :ep
      return find(:xpath, CLOUD_LINK_IL).click if key == :il
      find(:xpath, ta(CLOUD_LINK_TA, CLOUD_LINK_IL)).click
    end
  end

  def click_artifacts_link(key = nil)
    post_processing key do
      return find(ta(ARTIFACTS_LINK_EP)).click if key == :ep
      return find(:xpath, ARTIFACTS_LINK_IL).click if key == :il
      find(:xpath, ta(ARTIFACTS_LINK_TA, ARTIFACTS_LINK_IL)).click
    end
  end

  def click_search_link(key = nil)
    post_processing key do
      return find(ta(SEARCH_LINK_EP)).click if key == :ep
      return find(:xpath, SEARCH_LINK_IL).click if key == :il
      find(:xpath, ta(SEARCH_LINK_TA, SEARCH_LINK_IL)).click
    end
  end

  def click_administration_link(key = nil)
    post_processing key do
      return find(ta(ADMINISTRATION_LINK_EP)).click if key == :ep
      return find(:xpath, ADMINISTRATION_LINK_IL).click if key == :il
      find(:xpath, ta(ADMINISTRATION_LINK_TA, ADMINISTRATION_LINK_IL)).click
    end
  end

  def click_to_open_second_row_run_report(key = nil)
    post_processing key do
      return find(ta(JOB_RUN_REPORTS_SECOND_LINE_EP)).click if key == :ep
      return find(:xpath, JOB_RUN_REPORTS_SECOND_LINE_IL).click if key == :il
      find(:xpath, ta(JOB_RUN_REPORTS_SECOND_LINE_TA, JOB_RUN_REPORTS_SECOND_LINE_IL)).click
    end
  end

  def click_to_switch_parameters_in_table(key = nil)
    post_processing key do
      return find(ta(PARAMETERS_EP)).click if key == :ep
      return find(:xpath, PARAMETERS_IL).click if key == :il
      find(:xpath, ta(PARAMETERS_TA, PARAMETERS_IL)).click
    end
  end

  def click_to_switch_diagnostics_in_table(key = nil)
    post_processing key do
      return find(ta(DIAGNOSTICS_EP)).click if key == :ep
      return find(:xpath, DIAGNOSTICS_IL).click if key == :il
      find(:xpath, ta(DIAGNOSTICS_TA, DIAGNOSTICS_IL)).click
    end
  end

  def click_to_open_second_subject_row(key = nil)
    post_processing key do
      return find(ta(SUBJECT_SECOND_ROW_EP)).click if key == :ep
      return find(:css, SUBJECT_SECOND_ROW_IL).click if key == :il
      find(:css, ta(SUBJECT_SECOND_ROW_TA, SUBJECT_SECOND_ROW_IL)).click
    end
  end

  def click_sort_link(key = nil)
    post_processing key do
      return find(ta(SORT_LINK_EP)).click if key == :ep
      return find(:xpath, SORT_LINK_IL).click if key == :il
      find(:xpath, ta(SORT_LINK_TA, SORT_LINK_IL)).click
    end
  end

end