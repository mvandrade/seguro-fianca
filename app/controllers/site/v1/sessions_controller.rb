class Site::V1::SessionsController < SiteController

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.valid_password?(session_params[:password])
      sign_in user, store: false
      user.generate_authentivation_token!
      user.save
      render json: user, status: 200
    else
      render json: {errors: 'email e/ou password inválidos'}, status: 401
    end

  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentivation_token!
    user.save
    head 204
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end


end
