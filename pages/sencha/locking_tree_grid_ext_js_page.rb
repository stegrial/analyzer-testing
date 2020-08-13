require_relative '../page_extension'

class LockingTreeGridExtJSPage < PageExtension

  HEADER_LOCKING_TREE_GRID_IL = "//h1[contains(., 'Locking TreeGrid Example')]"
  HEADER_LOCKING_TREE_GRID_TA = "sencha:locking_tree_grid:header_locking_tree_grid"


  def should_see_header_locking_tree_grid(key = nil)
    within_frame(0) do
      element = find_element(key, il_type: :xpath, tl: HEADER_LOCKING_TREE_GRID_TA, il: HEADER_LOCKING_TREE_GRID_IL, check_path: $check_path)
      expect(element).to be_visible
    end
  end

end
