require_relative '../page_extension'

class ExamplesPage < PageExtension

  LOGO_IL = "//div[@class='top-bar']//a[@href='https://www.sencha.com/']"
  LOGO_TA = "sencha:examples_page:logo"

  HERO_HEADER_IL = "//h1[text()='Sencha Examples']"
  HERO_HEADER_TA = "sencha:examples_page:hero_header"

  DOCS_LINK_IL = "//a[text()='Docs']"
  DOCS_LINK_TA = "sencha:examples_page:docs_link"

  SUPPORT_LINK_IL = "//a[text()='Support']"
  SUPPORT_LINK_TA = "sencha:examples_page:support_link"

  FORUM_LINK_IL = "//a[text()='Forum']"
  FORUM_LINK_TA = "sencha:examples_page:forum_link"

  FACEBOOK_LINK_IL = "//a[@href='https://www.facebook.com/senchainc']"
  FACEBOOK_LINK_TA = "sencha:examples_page:facebook_link"

  TWITTER_LINK_IL = "//a[@href='https://twitter.com/sencha']"
  TWITTER_LINK_TA = "sencha:examples_page:twitter_link"

  LINKEDIN_LINK_IL = "//a[@href='https://www.linkedin.com/company/sencha-inc']"
  LINKEDIN_LINK_TA = "sencha:examples_page:linkedin_link"

  YOUTUBE_LINK_IL = "//a[@href='https://www.youtube.com/SenchaInc']"
  YOUTUBE_LINK_TA = "sencha:examples_page:youtube_link"

  GOOGLE_LINK_IL = "//a[@href='https://plus.google.com/117303203295549187007?prsrc=3']"
  GOOGLE_LINK_TA = "sencha:examples_page:google_link"

  VIMEO_LINK_IL = "//a[@href='https://vimeo.com/sencha']"
  VIMEO_LINK_TA = "sencha:examples_page:vimeo_link"

  GITHUB_LINK_IL = "//a[@href='https://github.com/sencha']"
  GITHUB_LINK_TA = "sencha:examples_page:github_link"

  PRIVACY_POLICY_LINK_IL = "(//a[@id='footer-link'])[1]"
  PRIVACY_POLICY_LINK_TA = "sencha:examples_page:privacy_police_link"

  TERMS_OF_USE_LINK_IL = "(//a[@id='footer-link'])[2]"
  TERMS_OF_USE_LINK_TA = "sencha:examples_page:terms_of_use_link"

  EXT_JS_EXAMPLES_NAME_IL = "//h2[text()='Ext JS Examples']"
  EXT_JS_EXAMPLES_NAME_TA = "sencha:examples_page:ext_js_examples"

  EXT_JS_EXAMPLES_FREE_TRIAL_IL = "//a[@href='https://www.sencha.com/products/extjs/evaluate/']"
  EXT_JS_EXAMPLES_FREE_TRIAL_TA = "sencha:examples_page:ext_js_examples_free_trial"

  EXT_ANGULAR_EXAMPLES_NAME_IL = "//h2[text()='ExtAngular Examples']"
  EXT_ANGULAR_EXAMPLES_NAME_TA = "sencha:examples_page:ext_angular_examples"

  EXT_ANGULAR_EXAMPLES_FREE_TRIAL_IL = "//a[@href='https://www.sencha.com/products/extangular/evaluate/earlyaccess']"
  EXT_ANGULAR_EXAMPLES_FREE_TRIAL_TA = "sencha:examples_page:ext_angular_examples_free_trial"

  EXT_WEB_COMPONENTS_EXAMPLES_NAME_IL = "//h2[text()='ExtWebComponents Examples']"
  EXT_WEB_COMPONENTS_EXAMPLES_NAME_TA = "sencha:examples_page:ext_web_components_examples"

  EXT_WEB_COMPONENTS_EXAMPLES_FREE_TRIAL_IL = "//a[@href='https://www.sencha.com/products/extwebcomponents/evaluate/earlyaccess/']"
  EXT_WEB_COMPONENTS_EXAMPLES_FREE_TRIAL_TA = "sencha:examples_page:ext_web_components_examples_free_trial"

  EXT_REACT_EXAMPLES_NAME_IL = "//h2[text()='ExtReact Examples']"
  EXT_REACT_EXAMPLES_NAME_TA = "sencha:examples_page:ext_react_examples"

  EXT_REACT_FREE_TRIAL_IL = "//a[@href='https://www.sencha.com/products/extreact/evaluate/']"
  EXT_REACT_FREE_TRIAL_TA = "sencha:examples_page:ext_react_examples_free_trial"

  GXT_EXAMPLES_NAME_IL = "//h2[text()='GXT Examples']"
  GXT_EXAMPLES_NAME_TA = "sencha:examples_page:gxt_examples"

  GXT_FREE_TRIAL_IL = "//a[@href='https://www.sencha.com/products/gxt/evaluate/']"
  GXT_FREE_TRIAL_TA = "sencha:examples_page:gxt_examples_free_trial"

  EXT_JS_VIEW_EXAMPLES_IL = "(//a[@href='/extjs'])[3]"
  EXT_JS_VIEW_EXAMPLES_TA = "sencha:examples_page:ext_js_view_examples_button"


  def should_see_logo(key = nil)
    element = find_element(key, il_type: :xpath, tl: LOGO_TA, il: LOGO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_hero_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: HERO_HEADER_TA, il: HERO_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_docs_link(key = nil)
    find_element(key, il_type: :xpath, tl: DOCS_LINK_TA, il: DOCS_LINK_IL, check_path: $check_path).click
  end

  def click_support_link(key = nil)
    find_element(key, il_type: :xpath, tl: SUPPORT_LINK_TA, il: SUPPORT_LINK_IL, check_path: $check_path).click
  end

  def click_forum_link(key = nil)
    find_element(key, il_type: :xpath, tl: FORUM_LINK_TA, il: FORUM_LINK_IL, check_path: $check_path).click
  end

  def should_see_facebook_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: FACEBOOK_LINK_TA, il: FACEBOOK_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_twitter_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: TWITTER_LINK_TA, il: TWITTER_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_linkedin_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: LINKEDIN_LINK_TA, il: LINKEDIN_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_youtube_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: YOUTUBE_LINK_TA, il: YOUTUBE_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_google_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: GOOGLE_LINK_TA, il: GOOGLE_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_vimeo_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: VIMEO_LINK_TA, il: VIMEO_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_github_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: GITHUB_LINK_TA, il: GITHUB_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_privacy_police_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: PRIVACY_POLICY_LINK_TA, il: PRIVACY_POLICY_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_terms_of_use_link(key = nil)
    element = find_element(key, il_type: :xpath, tl: TERMS_OF_USE_LINK_TA, il: TERMS_OF_USE_LINK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_js_examples_name(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_JS_EXAMPLES_NAME_TA, il: EXT_JS_EXAMPLES_NAME_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_ext_js_examples_free_trial(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_JS_EXAMPLES_FREE_TRIAL_TA, il: EXT_JS_EXAMPLES_FREE_TRIAL_IL, check_path: $check_path).click
  end

  def should_see_ext_angular_examples_name(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_ANGULAR_EXAMPLES_NAME_TA, il: EXT_ANGULAR_EXAMPLES_NAME_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_ext_angular_examples_free_trial(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_ANGULAR_EXAMPLES_FREE_TRIAL_TA, il: EXT_ANGULAR_EXAMPLES_FREE_TRIAL_IL, check_path: $check_path).click
  end

  def should_see_ext_web_components_examples_name(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_WEB_COMPONENTS_EXAMPLES_NAME_TA, il: EXT_WEB_COMPONENTS_EXAMPLES_NAME_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_ext_web_components_examples_free_trial(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_WEB_COMPONENTS_EXAMPLES_FREE_TRIAL_TA, il: EXT_WEB_COMPONENTS_EXAMPLES_FREE_TRIAL_IL, check_path: $check_path).click
  end

  def should_see_ext_react_examples_name(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_REACT_EXAMPLES_NAME_TA, il: EXT_REACT_EXAMPLES_NAME_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_ext_react_examples_free_trial(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_REACT_FREE_TRIAL_TA, il: EXT_REACT_FREE_TRIAL_IL, check_path: $check_path).click
  end

  def should_see_gxt_examples_name(key = nil)
    element = find_element(key, il_type: :xpath, tl: GXT_EXAMPLES_NAME_TA, il: GXT_EXAMPLES_NAME_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_gxt_examples_free_trial(key = nil)
    find_element(key, il_type: :xpath, tl: GXT_FREE_TRIAL_TA, il: GXT_FREE_TRIAL_IL, check_path: $check_path).click
  end

  def click_ext_js_view_examples(key = nil)
    find_element(key, il_type: :xpath, tl: EXT_JS_VIEW_EXAMPLES_TA, il: EXT_JS_VIEW_EXAMPLES_IL, check_path: $check_path).click
  end

end
