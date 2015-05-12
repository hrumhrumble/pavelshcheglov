class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :rememberable, :registerable,
  devise :database_authenticatable, :recoverable, :trackable, :validatable
  has_many :sites, dependent: :destroy
end
