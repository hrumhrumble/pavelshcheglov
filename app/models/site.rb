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

  def positions_in_top
    top_limit = 10
    total_queries = queries.count
    queries_in_top = queries.map { |query| query if query.positions.first.place <= top_limit }.compact.count
    queries_in_top * 100 / total_queries
  end

  rails_admin do
    list do
      field :url
      field :user
    end
  end

end
