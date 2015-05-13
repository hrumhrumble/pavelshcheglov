class Position < ActiveRecord::Base
  belongs_to :query

  rails_admin do
    list do
      field :place
      field :query
      field :created_at
    end
  end
end
