class Position < ActiveRecord::Base
  belongs_to :query

  def day
    self.created_at.strftime('%d')
  end

  rails_admin do
    list do
      field :place
      field :query
      field :created_at
    end
    edit do
      field :place
      field :query
      field :created_at
    end
  end
end
