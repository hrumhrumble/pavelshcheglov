class Query < ActiveRecord::Base
  belongs_to :site
  has_many :positions
end
