module ProfileHelper

  def queries_for site
    site.queries.sort_by { |query| query.positions.last.place }
  end

  def positions_for query
    query.positions.map(&:place).reverse
  end

end
