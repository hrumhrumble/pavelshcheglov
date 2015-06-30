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
      queries_in_top = queries.map { |query| query if query.positions.last.place <= top_limit }.compact.count
      { in_top: queries_in_top, total: total_queries }
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
