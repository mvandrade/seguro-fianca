class SiteController < ApplicationController

  include DeviseTokenAuth::Concerns::SetUserByToken

  include Authenticable

end