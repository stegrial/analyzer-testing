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

end