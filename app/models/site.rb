class Site < ActiveRecord::Base
  belongs_to :user
  has_many :queries, dependent: :destroy

  rails_admin do
    list do
      field :url
      field :user
    end
  end

end
