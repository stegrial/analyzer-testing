require_relative '../page_extension'

class ExtJSPage < PageExtension

  HERO_HEADER_IL = "//div[@id='heroHeader']/h1"
  HERO_HEADER_TA = "sencha:ext_js_page:hero_header"

  HERO_TEXT_IL = "//div[@id='heroText']/p"
  HERO_TEXT_TA = "sencha:ext_js_page:hero_text"

  SAMPLE_APPLICATIONS_IL = "//div[contains(@class, 'group-header') and contains(., 'Sample Applications')]"
  SAMPLE_APPLICATIONS_TA = "sencha:ext_js_page:sample_applications"

  ADMIN_DASHBOARD_IL = "//div[text()='Admin Dashboard']"
  ADMIN_DASHBOARD_TA = "sencha:ext_js_page:admin_dashboard"

  EXECUTIVE_DASHBOARD_IL = "//div[text()='Executive Dashboard']"
  EXECUTIVE_DASHBOARD_TA = "sencha:ext_js_page:executive_dashboard"

  EMPLOYEE_DIRECTORY_IL = "//div[text()='Employee Directory']"
  EMPLOYEE_DIRECTORY_TA = "sencha:ext_js_page:employee_directory"

  COMBINATION_EXAMPLES_IL = "//div[contains(@class, 'group-header') and contains(., 'Combination Examples')]"
  COMBINATION_EXAMPLES_TA = "sencha:ext_js_page:combination_examples"

  KITCHEN_MODERN_IL = "//div[text()='Kitchen Sink (Modern)']"
  KITCHEN_MODERN_TA = "sencha:ext_js_page:kitchen_modern"

  KITCHEN_CLASSIC_IL = "//div[text()='Kitchen Sink (Classic)']"
  KITCHEN_CLASSIC_TA = "sencha:ext_js_page:kitchen_classic"

  EXT_JS_CALENDAR_IL = "//div[text()='Ext JS Calendar']"
  EXT_JS_CALENDAR_TA = "sencha:ext_js_page:ext_js_calendar"

  TICKET_APP_IL = "//div[text()='Ticket App']"
  TICKET_APP_TA = "sencha:ext_js_page:ticket_app"

  PORTAL_DEMO_IL = "//div[text()='Portal Demo']"
  PORTAL_DEMO_TA = "sencha:ext_js_page:portal_demo"

  SIMPLE_TASK_IL = "//div[text()='Simple Tasks']"
  SIMPLE_TASK_TA = "sencha:ext_js_page:simple_task"

  RESPONSIVE_DESIGN_DEMO_IL = "//div[text()='Responsive Design Demo']"
  RESPONSIVE_DESIGN_DEMO_TA = "sencha:ext_js_page:responsive_design_demo"

  IMAGE_VIEWER_IL = "//div[text()='Image Viewer']"
  IMAGE_VIEWER_TA = "sencha:ext_js_page:image_viewer"

  THEME_VIEWER_IL = "//div[text()='Theme Viewer']"
  THEME_VIEWER_TA = "sencha:ext_js_page:theme_viewer"

  RIGHT_TO_LEFT_IL = "//div[text()='Right-to-Left (RTL)']"
  RIGHT_TO_LEFT_TA = "sencha:ext_js_page:right_to_left"

  WEB_DESKTOP_IL = "//div[text()='Web Desktop']"
  WEB_DESKTOP_TA = "sencha:ext_js_page:web_desktop"

  ACCESSIBILITY_DEMO_IL = "//div[text()='Accessibility Demo']"
  ACCESSIBILITY_DEMO_TA = "sencha:ext_js_page:accessibility_demo"

  GRIDS_IL = "//div[contains(@class, 'group-header') and contains(., 'Grids')]"
  GRIDS_TA = "sencha:ext_js_page:grids"

  GRID_DATA_BINDING_IL = "//div[text()='Grid Data Binding']"
  GRID_DATA_BINDING_TA = "sencha:ext_js_page:grid_data_binding"

  GRID_WITH_SUMMARY_IL = "//div[text()='Grid Grouping with Summary']"
  GRID_WITH_SUMMARY_TA = "sencha:ext_js_page:grid_with_summary"

  GRID_WITH_BUFFERED_STORE_IL = "//div[text()='Grid with Buffered Store']"
  GRID_WITH_BUFFERED_STORE_TA = "sencha:ext_js_page:grid_with_buffered_store"

  GRID_WITH_LIVE_SEARCH_CAPABILITY_IL = "//div[text()='Grid with Live Search Capability' and @class='example-title']"
  GRID_WITH_LIVE_SEARCH_CAPABILITY_TA = "sencha:ext_js_page:grid_with_live_search_capability"

  REMOTE_SUMMARY_IL = "//div[text()='Grouping with Remote Summary']"
  REMOTE_SUMMARY_TA = "sencha:ext_js_page:remote_summary"

  RESTFUL_STORE_IL = "//div[text()='RESTful Store with GridPanel and RowEditor']"
  RESTFUL_STORE_TA = "sencha:ext_js_page:restful_store"

  GRID_WITH_WRITABLE_STORE_IL = "//div[text()='Editable Grid with Writable Store']"
  GRID_WITH_WRITABLE_STORE_TA = "sencha:ext_js_page:grid_with_writable_store"

  GRID_WITH_JSON_WRITABLE_STORE_IL = "//div[text()='Editable Grid with JSONP Writable Store']"
  GRID_WITH_JSON_WRITABLE_STORE_TA = "sencha:ext_js_page:grid_with_json_writable_store"

  BUFFERED_SCROLLING_IL = "//div[text()='Buffered Scrolling']"
  BUFFERED_SCROLLING_TA = "sencha:ext_js_page:buffered_scrolling"

  GRID_FROM_MARKUP_IL = "//div[text()='Grid From Markup']"
  GRID_FROM_MARKUP_TA = "sencha:ext_js_page:grid_from_markup"

  GROUPING_SUMMARY_GRID_IL = "//div[text()='Locking Grouping Summary Grid']"
  GROUPING_SUMMARY_GRID_TA = "sencha:ext_js_page:grouping_summary_grid"

  GRID_WITH_FILTERED_IL = "//div[text()='Locking Grouping Summary Grid']"
  GRID_WITH_FILTERED_TA = "sencha:ext_js_page:grid_with_filtered"

  GROUPED_HEADER_IL = "//div[text()='Locking Grouping Summary Grid']"
  GROUPED_HEADER_TA = "sencha:ext_js_page:grouped_header"

  TREES_IL = "//div[contains(@class, 'group-header') and contains(., 'Trees')]"
  TREES_TA = "sencha:ext_js_page:trees"

  LOCKING_TREEGRID_IL = "//div[text()='Locking TreeGrid']"
  LOCKING_TREEGRID_TA = "sencha:ext_js_page:locking_treeGrid"

  CUSTOM_DROP_LOGIC_IL = "//div[text()='Custom Drop Logic']"
  CUSTOM_DROP_LOGIC_TA = "sencha:ext_js_page:custom_drop_logic"

  BUFFER_RENDERED_TREE_IL = "//div[text()='Buffer Rendered Tree']"
  BUFFER_RENDERED_TREE_TA = "sencha:ext_js_page:buffer_rendered_tree"

  LOCKING_BUFFER_RENDERED_TREE_IL = "//div[text()='Locking Buffer Rendered Tree']"
  LOCKING_BUFFER_RENDERED_TREE_TA = "sencha:ext_js_page:locking_buffer_rendered_tree"

  VERSION_DROP_DOWN_IL = "//a[@class='no-whitespace']"
  VERSION_DROP_DOWN_TA = "sencha:ext_js_page:version_drop_down"

  VERSION_7_1_0_IL = "//a[@href='/extjs/7.1.0']"
  VERSION_7_1_0_TA = "sencha:ext_js_page:version_7_1_0"

  VERSION_7_0_0_IL = "//a[@href='/extjs/7.0.0']"
  VERSION_7_0_0_TA = "sencha:ext_js_page:version_7_0_0"

  VERSION_6_7_0_IL = "//a[@href='/extjs/6.7.0']"
  VERSION_6_7_0_TA = "sencha:ext_js_page:version_6_7_0"

  VERSION_6_6_0_IL = "//a[@href='/extjs/6.6.0']"
  VERSION_6_6_0_TA = "sencha:ext_js_page:version_6_6_0"

  VERSION_6_5_3_IL = "//a[@href='/extjs/6.5.3']"
  VERSION_6_5_3_TA = "sencha:ext_js_page:version_6_5_3"

  DRAG_AND_DROP_IL = "//div[contains(@class, 'group-header') and contains(., 'Drag and Drop')]"
  DRAG_AND_DROP_TA = "sencha:ext_js_page:drag_and_drop"

  CUSTOM_DRAG_AND_DROP_IL = "//div[text()='Custom Drag and Drop']"
  CUSTOM_DRAG_AND_DROP_TA = "sencha:ext_js_page:custom_drag_and_drop"

  DATA_VIEW_IL = "//div[contains(@class, 'group-header') and contains(., 'DataView')]"
  DATA_VIEW_TA = "sencha:ext_js_page:data_view"

  ANIMATED_DATA_VIEW_IL = "//div[text()='Animated DataView']"
  ANIMATED_DATA_VIEW_TA = "sencha:ext_js_page:animated_data_view"

  MISCELLANEOUS_IL = "//div[contains(@class, 'group-header') and contains(., 'Miscellaneous')]"
  MISCELLANEOUS_TA = "sencha:ext_js_page:miscellaneous"

  MULTI_SELECT_AND_ITEM_SELECTOR_IL = "//div[text()='MultiSelect and ItemSelector']"
  MULTI_SELECT_AND_ITEM_SELECTOR_TA = "sencha:ext_js_page:multi_select_and_item_selector"


  def should_see_hero_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: HERO_HEADER_TA, il: HERO_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_hero_text(key = nil)
    element = find_element(key, il_type: :xpath, tl: HERO_TEXT_TA, il: HERO_TEXT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_sample_applications_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: SAMPLE_APPLICATIONS_TA, il: SAMPLE_APPLICATIONS_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_admin_dashboard_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: ADMIN_DASHBOARD_TA, il: ADMIN_DASHBOARD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_executive_dashboard_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXECUTIVE_DASHBOARD_TA, il: EXECUTIVE_DASHBOARD_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_employee_directory_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: EMPLOYEE_DIRECTORY_TA, il: EMPLOYEE_DIRECTORY_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_combinations_examples_header(key = nil)
    element = find_element(key, il_type: :xpath, tl: COMBINATION_EXAMPLES_TA, il: COMBINATION_EXAMPLES_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_kitchen_modern_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: KITCHEN_MODERN_TA, il: KITCHEN_MODERN_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_kitchen_classic_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: KITCHEN_CLASSIC_TA, il: KITCHEN_CLASSIC_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ext_js_calendar_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: EXT_JS_CALENDAR_TA, il: EXT_JS_CALENDAR_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_ticket_app_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: TICKET_APP_TA, il: TICKET_APP_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_portal_demo_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: PORTAL_DEMO_TA, il: PORTAL_DEMO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_simple_task_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: SIMPLE_TASK_TA, il: SIMPLE_TASK_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_responsive_design_demo_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: RESPONSIVE_DESIGN_DEMO_TA, il: RESPONSIVE_DESIGN_DEMO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_image_viewer_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: IMAGE_VIEWER_TA, il: IMAGE_VIEWER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_theme_viewer_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: THEME_VIEWER_TA, il: THEME_VIEWER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_right_to_left_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: RIGHT_TO_LEFT_TA, il: RIGHT_TO_LEFT_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_web_desktop_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: WEB_DESKTOP_TA, il: WEB_DESKTOP_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_accessibility_demo_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: ACCESSIBILITY_DEMO_TA, il: ACCESSIBILITY_DEMO_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_grids_header(key = nil)
    find_element(key, il_type: :xpath, tl: GRIDS_TA, il: GRIDS_IL, check_path: $check_path).click
  end

  def should_see_grid_data_binding_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: GRID_DATA_BINDING_TA, il: GRID_DATA_BINDING_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_grid_with_summary_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: GRID_WITH_SUMMARY_TA, il: GRID_WITH_SUMMARY_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_grid_with_buffered_store_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: GRID_WITH_BUFFERED_STORE_TA, il: GRID_WITH_BUFFERED_STORE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_grid_with_live_search_capability_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: GRID_WITH_LIVE_SEARCH_CAPABILITY_TA, il: GRID_WITH_LIVE_SEARCH_CAPABILITY_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_remote_summary_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: REMOTE_SUMMARY_TA, il: REMOTE_SUMMARY_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_restful_store_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: RESTFUL_STORE_TA, il: RESTFUL_STORE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_grid_with_writable_store_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: GRID_WITH_WRITABLE_STORE_TA, il: GRID_WITH_WRITABLE_STORE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_grid_with_json_writable_store_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: GRID_WITH_JSON_WRITABLE_STORE_TA, il: GRID_WITH_JSON_WRITABLE_STORE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_buffered_scrolling_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: BUFFERED_SCROLLING_TA, il: BUFFERED_SCROLLING_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_grid_from_markup_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: GRID_FROM_MARKUP_TA, il: GRID_FROM_MARKUP_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_grouping_summary_grid_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: GROUPING_SUMMARY_GRID_TA, il: GROUPING_SUMMARY_GRID_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_grid_with_filtered_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: GRID_WITH_FILTERED_TA, il: GRID_WITH_FILTERED_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_grouped_header_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: GROUPED_HEADER_TA, il: GROUPED_HEADER_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_trees_header(key = nil)
    find_element(key, il_type: :xpath, tl: TREES_TA, il: TREES_IL, check_path: $check_path).click
  end

  def should_see_licking_treeGrid_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: LOCKING_TREEGRID_TA, il: LOCKING_TREEGRID_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_custom_drop_logic_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: CUSTOM_DROP_LOGIC_TA, il: CUSTOM_DROP_LOGIC_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_buffer_rendered_tree_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: BUFFER_RENDERED_TREE_TA, il: BUFFER_RENDERED_TREE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def should_see_locking_buffer_rendered_tree_title(key = nil)
    element = find_element(key, il_type: :xpath, tl: LOCKING_BUFFER_RENDERED_TREE_TA, il: LOCKING_BUFFER_RENDERED_TREE_IL, check_path: $check_path)
    expect(element).to be_visible
  end

  def click_dropdown_version(key = nil)
    find_element(key, il_type: :xpath, tl: VERSION_DROP_DOWN_TA, il: VERSION_DROP_DOWN_IL, check_path: $check_path).click
  end

  def click_dropdown_7_1_0(key = nil)
    find_element(key, il_type: :xpath, tl: VERSION_7_1_0_TA, il: VERSION_7_1_0_IL, check_path: $check_path).click
  end

  def click_dropdown_7_0_0(key = nil)
    find_element(key, il_type: :xpath, tl: VERSION_7_0_0_TA, il: VERSION_7_0_0_IL, check_path: $check_path).click
  end

  def click_dropdown_6_7_0(key = nil)
    find_element(key, il_type: :xpath, tl: VERSION_6_7_0_TA, il: VERSION_6_7_0_IL, check_path: $check_path).click
  end

  def click_dropdown_6_6_0(key = nil)
    find_element(key, il_type: :xpath, tl: VERSION_6_6_0_TA, il: VERSION_6_6_0_IL, check_path: $check_path).click
  end

  def click_dropdown_6_5_3(key = nil)
    find_element(key, il_type: :xpath, tl: VERSION_6_5_3_TA, il: VERSION_6_5_3_IL, check_path: $check_path).click
  end

  def click_admin_dashboard_title(key = nil)
    find_element(key, il_type: :xpath, tl: ADMIN_DASHBOARD_TA, il: ADMIN_DASHBOARD_IL, check_path: $check_path).click
    move_last_tab
  end

  def click_kitchen_sink_classic_title(key = nil)
    find_element(key, il_type: :xpath, tl: KITCHEN_CLASSIC_TA, il: KITCHEN_CLASSIC_IL, check_path: $check_path).click
    move_last_tab
  end

  def click_grid_with_buffered_store_title(key = nil)
    find_element(key, il_type: :xpath, tl: GRID_WITH_BUFFERED_STORE_TA, il: GRID_WITH_BUFFERED_STORE_IL, check_path: $check_path).click
    move_last_tab
  end

  def click_locking_tree_grid_title(key = nil)
    find_element(key, il_type: :xpath, tl: LOCKING_TREEGRID_TA, il: LOCKING_TREEGRID_IL, check_path: $check_path).click
    move_last_tab
  end

  def click_drag_and_drop_header(key = nil)
    find_element(key, il_type: :xpath, tl: DRAG_AND_DROP_TA, il: DRAG_AND_DROP_IL, check_path: $check_path).click
  end

  def click_custom_drag_and_drop_title(key = nil)
    find_element(key, il_type: :xpath, tl: CUSTOM_DRAG_AND_DROP_TA, il: CUSTOM_DRAG_AND_DROP_IL, check_path: $check_path).click
    move_last_tab
  end

  def click_data_view_header(key = nil)
    find_element(key, il_type: :xpath, tl: DATA_VIEW_TA, il: DATA_VIEW_IL, check_path: $check_path).click
  end

  def click_animated_data_view_header(key = nil)
    find_element(key, il_type: :xpath, tl: ANIMATED_DATA_VIEW_TA, il: ANIMATED_DATA_VIEW_IL, check_path: $check_path).click
    move_last_tab
  end

  def click_miscellaneous_header(key = nil)
    find_element(key, il_type: :xpath, tl: MISCELLANEOUS_TA, il: MISCELLANEOUS_IL, check_path: $check_path).click
  end

  def click_multi_select_and_item_selector_header(key = nil)
    find_element(key, il_type: :xpath, tl: MULTI_SELECT_AND_ITEM_SELECTOR_TA, il: MULTI_SELECT_AND_ITEM_SELECTOR_IL, check_path: $check_path).click
    move_last_tab
  end

end
