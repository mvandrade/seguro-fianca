class Location::DashboardController < LocationController
  
  before_action :authenticate_admin!

  def index
  end
end
