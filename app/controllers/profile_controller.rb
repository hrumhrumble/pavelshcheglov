class ProfileController < ApplicationController

  authorize_resource :class => false

  def index
    @user_sites = current_user.sites
    @all_sites = Site.all
  end

end
