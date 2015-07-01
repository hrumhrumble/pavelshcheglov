class Site < ActiveRecord::Base
  belongs_to :user
  has_many :queries, dependent: :destroy

  def have_queries?
    queries.any?
  end

  def have_positions?
    queries.first.positions.any?
  end

  def sorted_queries
    if have_positions?
      queries.sort_by { |query| query.ordered_positions.first.place }
    else
      queries
    end
  end

  def position_dates
    queries.first.ordered_positions
  end

  def positions
    if have_positions?
      top_limit = 10
      total_queries = queries.count
      total_positions = queries.first.positions.count
      positions_history = []
      positions_dates = queries.first.positions.map {|position| position.created_at.strftime("%Y-%m-%d")  }

      # count positions at top for each day
      total_positions.times do |index|
        positions_history << queries.map { |query| true if query.positions[index].place <= top_limit }.compact.count
      end

      # output data for c3 charts
      positions_dynamic = [self.url] << positions_history.map { |count| count * 100 / total_queries }

      {
          in_top: positions_history.last,
          total: total_queries,
          percent: positions_dynamic.flatten,
          data: [['x'] + positions_dates, positions_dynamic.flatten]
      }

    else
      0
    end
  end

  rails_admin do
    list do
      field :url
      field :user
    end
  end

end
