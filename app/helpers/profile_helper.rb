module ProfileHelper

  def colored query
    positions = query.positions.map(&:place).reverse
    dynamics = []

    for i in 0...positions.length
      if positions[i+1].present?
        if positions[i] > positions[i+1]
          dynamics << 'down'
        elsif positions[i] < positions[i+1]
          dynamics << 'up'
        elsif positions[i] == positions[i+1]
          dynamics << 'same'
        else
          dynamics << ''
        end
      else
        dynamics << 'up'
      end
    end

    dynamics

  end
end
