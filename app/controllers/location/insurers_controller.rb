class Location::InsurersController < LocationController
  before_action :set_insurer, only: [ :edit, :update, :destroy]

  # GET /location/group_branches
  # GET /location/group_branches.json
  def index
    @insurers = Insurer.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /location/group_branches/1
  # GET /location/group_branches/1.json
  def show
  end

  # GET /location/group_branches/new
  def new
    @insurer = Insurer.new
  end

  # GET /location/group_branches/1/edit
  def edit
  end

  # POST /location/group_branches
  # POST /location/group_branches.json
  def create
    @insurer = Insurer.new(insurer_params)

    respond_to do |format|
      if @insurer.save
        format.html { redirect_to location_insurers_path, notice: "Seguradora (#{@insurer.name}) foi cadastrada com sucesso"}
        format.json { render :index, status: :created, Location: location_insurers_path }
      else
        format.html { render :new }
        format.json { render json: @ginsurer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location/group_branches/1
  # PATCH/PUT /location/group_branches/1.json
  def update
    respond_to do |format|
      if @insurer.update(insurer_params)
        format.html { redirect_to location_insurers_path, notice: "Seguradora (#{@insurer.name}) foi atualizada com sucesso"}
        format.json { render :show, status: :ok, Location: insurers_path }
      else
        format.html { render :edit }
        format.json { render json: @insurer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location/group_branches/1
  # DELETE /location/group_branches/1.json
  def destroy
    insurer_name = @insurer.name
    @insurer.destroy
    if @insurer.errors.any?
      redirect_to location_insurers_path, alert: "Seguradora (#{insurer_name}) não pode ser excluida, existe(m) dependência(s)"
    else
      redirect_to location_insurers_path, notice: "Seguradora (#{insurer_name}) foi excluida com sucesso"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurer
      @insurer = Insurer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurer_params
      params.require(:insurer).permit(:code, :name, :contact_name, :contact_phone)
    end
end
