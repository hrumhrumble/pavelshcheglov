class ProfileController < ApplicationController

  authorize_resource :class => false

  def index
    @sites = Site.all
  end

end
