class LocationController < ApplicationController
  before_action :authenticate_admin!

  layout "location"

  def pundit_user
    current_admin
  end

end