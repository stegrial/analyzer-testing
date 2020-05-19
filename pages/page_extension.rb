require_relative '../helpers/element_search_validation'
require_relative '../helpers/getting_logs'

class PageExtension
  include TrueAutomation::DSL
  include Capybara::DSL
  include RSpec::Matchers
  include ElementSearchValidation

  def processing
    current_url = GetCurrentUrl.new
    current_url.save
    check_last_request
  end

  def post_processing(key)
    begin
      yield
    ensure
      unless key == :il
        check_new_request
        save_last_request
      end
    end
  end

  def ta_name(name)
    name.tr('^A-Za-z0-9_', '')
  end

  def locator_by(key, initial_locator, ta_locator)
    case key
    when :il then initial_locator
    when :ta then ta_locator
    else p 'Locator type is not set'
    end
  end

  # key - defines an element search strategy
  # il_type - initial locator type
  # tl - trueautomation locator
  # il - initial locator
  def find_element(key, il_type: nil, tl: nil, il: nil, visible: true, check_path:)

    check_element_path(il_type, tl, il) if check_path && key != :il

    wait_for_element = 18
    start_time = get_current_time
    begin
      return find(ta(tl), wait: 0, visible: visible) { processing } if key == :ta
      return find(il_type, il, visible: visible) if key == :il
      find(il_type, ta(tl, il), wait: 0, visible: visible) { processing }
    rescue
      find('html') { processing }
      retry if get_current_time - start_time < wait_for_element
    end
  end

  def find_element_path(key, locator_type, ta_locator, initial_locator)
    post_processing key do
      return find(locator_type, initial_locator) if key == :il
      find(locator_type, ta(ta_locator, initial_locator))
    end
  end

  def check_element_path(locator_type, ta_locator, initial_locator)
    ta_path = find_element(:ta, tl: ta_locator, visible: false, check_path: false).path
    puts ta_path

    case locator_type
    when :css then initial_path = find(:css, initial_locator).path
    when :id then initial_path = find(:id, initial_locator).path
    when :xpath then initial_path = find(:xpath, initial_locator).path
    else p 'Selector type is not set, must be one of: :css, :id, :xpath'
    end
    puts initial_path

    expect(ta_path).to eq initial_path
  end

end
