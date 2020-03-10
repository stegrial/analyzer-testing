require_relative '../helpers/element_search_validation'

module PageExtension
  include ElementSearchValidation

  def post_processing(key)
    begin
      yield
    ensure
      unless key == :il
        check_requests
      end
    end
  end

  def ta_name(name)
    name.tr('^A-Za-z0-9_', '')
  end

  def locator_by_type(locator, initial_locator, ta_locator)
    case locator
    when :il then initial_locator
    when :ta then ta_locator
    else p 'Locator type is not set'
    end
  end

  def find_element_path(key, format, ta_locator, initial_locator)
    post_processing key do
      return find(format, initial_locator, visible: :visible) if key == :il
      find(format, ta(ta_locator, initial_locator), visible: :visible)
    end
  end

end