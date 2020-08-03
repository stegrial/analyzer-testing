require_relative '../page_extension'

class BioPageFacebook < PageExtension


  WORK_AT_IL = "(//div[@data-overviewsection='education']//div[contains(., 'Works at ')])[1]"
  WORK_AT_TA = "facebook:bio_page:work_at"

  ADD_A_SCHOOL_IL = "(//li[@data-overviewsection='education']//span[contains(., 'Add a school')])[1]"
  ADD_A_SCHOOL_TA = "facebook:bio_page:add_a_school"

  ADD_PROF_SKILL_IL = "(//div[@id='pagelet_edit_eduwork']//span[contains(., 'Add a professional skill')])[1]"
  ADD_PROF_SKILL_TA = "facebook:bio_page:add_prof_skill"

  PROF_SKILLS_IL = "(//div[@id='pagelet_edit_eduwork']//input[contains(@aria-expanded, 'false')])[1]"
  PROF_SKILLS_TA = "facebook:bio_page:prof_skill"

  SAVE_CHANGES_IL = "(//div[@id='pagelet_edit_eduwork']//button[contains(@name, '__submit__')])[1]"
  SAVE_CHANGES_TA = "facebook:bio_page:save_changes_btn"

  QUALITY_RECIPE_IL = "(//div[@id='pagelet_edit_eduwork']//a[contains(text(), 'Quality is our recipe')])[1]"
  QUALITY_RECIPE_TA = "facebook:bio_page:quality_recipe"

  QUALITY_RECIPE_LIST_IL= "//span[text()='Quality is our recipe']"
  QUALITY_RECIPE_LIST_TA= "facebook:bio_page:quality_recipe_list"

  TEST_FOR_INVISIBLE_IL = "(//div[@id='pagelet_edit_eduwork']//ul[contains(@class, 'uiList fbProfileEditExperiences')])[2]"
  TEST_FOR_INVISIBLE_TA = "facebook:bio_page:invisible_element"

  EDIT_SKILLS_IL = "(//div[@id='pagelet_edit_eduwork']//a[contains(@href, 'edit_skills/')])[1]"
  EDIT_SKILLS_TA = "facebook:bio_page:edit_skills_btn"

  REMOVE_SKILLS_IL = "(//div[@id='pagelet_edit_eduwork']//button[contains(@aria-label, 'Remove Quality is our recipe')])[1]"
  REMOVE_SKILLS_TA = "facebook:bio_page:remove_skills_btn"

  def should_see_work_at(key = nil)
    element = find_element(key, il_type: :xpath, tl: WORK_AT_TA, il: WORK_AT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_add_a_school(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_A_SCHOOL_TA, il: ADD_A_SCHOOL_IL, check_path: $check_path).click
  end

  def click_add_prof_skill(key = nil)
    find_element(key, il_type: :xpath, tl: ADD_PROF_SKILL_TA, il: ADD_PROF_SKILL_IL, check_path: $check_path).click
  end

  def fill_prof_skill(key = nil, value)
    find_element(key, il_type: :xpath, tl: PROF_SKILLS_TA, il: PROF_SKILLS_IL, check_path: $check_path).set(value)
  end

  def click_save_changes(key = nil)
    find_element(key, il_type: :xpath, tl: SAVE_CHANGES_TA, il: SAVE_CHANGES_IL, check_path: $check_path).click
  end

  def click_quality_recipe_list(key = nil)
    find_element(key, il_type: :xpath, tl: QUALITY_RECIPE_LIST_TA, il: QUALITY_RECIPE_LIST_IL, check_path: $check_path).click
  end

  def should_see_quality_recipe(key = nil)
    element = find_element(key, il_type: :xpath, tl: QUALITY_RECIPE_TA, il: QUALITY_RECIPE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def hover_and_click_edit_skills(key = nil)
    find_element(key, il_type: :xpath, tl: TEST_FOR_INVISIBLE_TA, il: TEST_FOR_INVISIBLE_IL, check_path: $check_path).click
    find_element(key, il_type: :xpath, tl: EDIT_SKILLS_TA, il: EDIT_SKILLS_IL, check_path: $check_path).click
  end

  def click_remove_skills_btn(key = nil)
    find_element(key, il_type: :xpath, tl: REMOVE_SKILLS_TA, il: REMOVE_SKILLS_IL, check_path: $check_path).click
  end

end
