class Site < ActiveRecord::Base
  belongs_to :user
  has_many :queries, dependent: :destroy

  def have_queries_or_positions?
    self.queries.any? && self.queries.first.positions.any?
  end

  def sorted_queries
    self.queries.sort_by { |query| query.positions.last.place }
  end

  def position_date
    self.queries.last.positions.reverse
  end

  rails_admin do
    list do
      field :url
      field :user
    end
  end

end
