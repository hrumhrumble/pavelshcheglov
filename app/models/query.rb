class Query < ActiveRecord::Base
  belongs_to :site
  has_many :positions, dependent: :destroy
  validates_uniqueness_of :word, :case_sensitive => false

  def format_positions
    self.positions.limit(14).reverse
  end

  rails_admin do
    list do
      field :word
      field :site
      field :positions
    end
  end

end
