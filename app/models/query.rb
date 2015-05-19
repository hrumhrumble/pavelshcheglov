class Query < ActiveRecord::Base
  belongs_to :site
  has_many :positions, dependent: :destroy
  validates_uniqueness_of :word, :case_sensitive => false

  def ordered_positions
    positions.order(created_at: :desc).limit(14)
  end

  rails_admin do
    list do
      field :word
      field :site
      field :positions
    end
  end

end
