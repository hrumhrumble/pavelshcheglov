module ProfileHelper
  def admin?
    current_user.role == 'admin'
  end

  def colored query
    positions = query.positions.map(&:place).reverse
    dynamics = []
    for i in 0...positions.length
      if positions[i+1].present?
        dynamics << 'down' if positions[i] > positions[i+1]
        dynamics << 'up' if positions[i] < positions[i+1]
        dynamics << 'same' if positions[i] == positions[i+1]
      else
        dynamics << 'up'
      end
    end
    dynamics
  end

end
