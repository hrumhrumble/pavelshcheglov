class ProfileController < ApplicationController

  authorize_resource :class => false

  def index
    @sites = current_user.sites
  end
end
