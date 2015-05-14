class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :rememberable, :registerable,
  devise :database_authenticatable, :recoverable, :trackable, :validatable
  has_many :sites, dependent: :destroy
  ROLES = %i[admin user]

  rails_admin do

    list do
      field :email
      field :name
      field :role
      field :sites
    end

    edit do
      field :email
      field :name
      field :role, :enum do
        enum do
          ROLES
        end
      end
      field :password
      field :sites
    end
  end
end
