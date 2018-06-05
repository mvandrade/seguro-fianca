class LocationController < ApplicationController
  # protect_from_forgery with: :exception

  module Location
    class ApplicationController < ApplicationController
      before_action :authenticate_user!
    end
  end
 
  # before_action :authenticate_admin!

  layout "location"

  def pundit_user
    current_admin
  end

end