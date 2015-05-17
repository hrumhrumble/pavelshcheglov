module ProfileHelper

  def colored query
    positions = query.positions.map(&:place).reverse
    colors = []

    for i in 0...positions.length
      if positions[i+1].present?
        if positions[i] > positions[i+1]
          colors << 'red'
        elsif positions[i] < positions[i+1]
          colors << 'green'
        elsif positions[i] == positions[i+1]
          colors << 'eq'
        else
          colors << ''
        end
      else
        colors << ''
      end
    end

    colors

  end
end
