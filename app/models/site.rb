class Site < ActiveRecord::Base
  belongs_to :user
  has_many :queries, dependent: :destroy

  def have_queries?
    self.queries.any?
  end

  def have_positions?
    self.queries.first.positions.any?
  end

  def sorted_queries
    if self.have_positions?
      self.queries.sort_by { |query| query.positions.last.place }
    else
      self.queries
    end
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
