require_relative '../helpers/element_search_validation'
require_relative '../helpers/getting_logs'

module PageExtension
  include ElementSearchValidation

  def processing
    current_url = GetCurrentUrl.new
    current_url.save
    check_last_request

    save_last_request
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
  def find_element(key, il_type: nil, tl: nil, il: nil)
    wait_for_element = 10
    start_time = get_current_time
    begin
      return find(ta(tl), wait: 0) { processing } if key == :ta
      return find(il_type, il) if key == :il
      find(il_type, ta(tl, il), wait: 0) { processing }
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

end
