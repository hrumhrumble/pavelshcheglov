class Site < ActiveRecord::Base
  belongs_to :user
  has_many :queries
end
