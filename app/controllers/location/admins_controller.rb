class Location::AdminsController < LocationController
   before_action :set_admin, only: [ :edit, :update, :destroy]

   def index
    @admins = Admin.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to location_admins_path, notice: "Usário (#{@admin.name}) foi cadastrado com sucesso"}
        format.json { render :index, status: :created, location: location_admin_path }
      else
        format.html { render :new }
        format.json { render json: @location_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update

    pwd = params[:admin][:password]
    pwd_cnf = params[:admin][:password_confirmation]

    if pwd.blank? && pwd_cnf.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to location_admins_path, notice: "Usuário (#{@admin.name}) foi atualizado com sucesso"}
        format.json { render :show, status: :ok, location: admin_path }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    admin_name = @admin.name
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to location_admins_path, notice: "Usuário (#{admin_name}) foi excluido com sucesso"}
      format.json { head :no_content }
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation, :name)
  end
end
