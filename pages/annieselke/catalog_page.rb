require_relative '../page_extension'

class CatalogPage < PageExtension


  REQUEST_CATALOG_IL = "//a[text()='request a catalog']"
  REQUEST_CATALOG_TA = "annieselke:home_page:catalog_page:request_catalog"

  def click_request_catalog(key=nil)
    find_element(key, il_type: :xpath, tl: REQUEST_CATALOG_TA, il: REQUEST_CATALOG_IL, check_path: $check_path).click
  end
end

