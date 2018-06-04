class Location::CoversController < LocationController
  before_action :set_cover, only: [ :edit, :update, :destroy]

  # GET /location/covers
  # GET /location/covers.json
  def index
    @covers = Cover.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /location/covers/1
  # GET /location/covers/1.json
  def show
  end

  # GET /location/covers/new
  def new
    @cover = Cover.new
    branch_options
  end

  # GET /location/covers/1/edit
  def edit
    branch_options
  end

  # POST /location/covers
  # POST /location/covers.json
  def create
    branch_options
    @cover = Cover.new(cover_params)
    respond_to do |format|
      if @cover.save
        format.html { redirect_to location_covers_path, notice: "Cobertura (#{@cover.name}) foi cadastrada com sucesso"}
        format.json { render :show, status: :created, location: @cover }
      else
        format.html { render :new }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location/covers/1
  # PATCH/PUT /location/covers/1.json
  def update
    branch_options
    respond_to do |format|
      if @cover.update(cover_params)
        format.html { redirect_to location_covers_path, notice: "Cobertura (#{@cover.name}) foi atualizada com sucesso"}
        format.json { render :show, status: :ok, location: @cover }
      else
        format.html { render :edit }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location/covers/1
  # DELETE /location/covers/1.json
  def destroy

    cover_name = @cover.name
    @cover.destroy
    respond_to do |format|
      format.html { redirect_to location_covers_path, notice: "Cobertura (#{cover_name}) foi excluida com sucesso" }
      format.json { head :no_content }
    end
  end

  private

  def branch_options
    @branch_options = Branch.all
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_cover
      @cover = Cover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cover_params
      params.require(:cover).permit(:branch_id, :code, :name, :description)
    end
end
