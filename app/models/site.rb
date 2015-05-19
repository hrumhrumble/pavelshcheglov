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
      queries.sort_by { |query| query.positions.order(created_at: :desc).limit(14).first.place }
    else
      queries
    end
  end

  def position_dates
    queries.first.positions.order(created_at: :desc).limit(14)
  end

  def in_top top_border
    all = sorted_queries.count
    in_top = sorted_queries.map do |query|
      query if query.positions.reverse.first.place <= top_border
    end.compact.count

    (in_top * 100) / all
  end

  rails_admin do
    list do
      field :url
      field :user
    end
  end

end
