module Location::CompositionProductsHelper

  def branch_of_cover(branch_id)

      @branch = Branch.find(branch_id)

  end

end
