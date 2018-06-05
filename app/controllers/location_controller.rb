class LocationController < ApplicationController
  protect_from_forgery with: :exception
 
  before_action :authenticate_admin!

  layout "location"

  def pundit_user
    current_admin
  end

end