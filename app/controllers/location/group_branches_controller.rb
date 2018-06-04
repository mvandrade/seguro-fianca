class Location::GroupBranchesController < LocationController
  before_action :set_group_branch, only: [ :edit, :update, :destroy]

  # GET /location/group_branches
  # GET /location/group_branches.json
  def index
    @group_branches = GroupBranch.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /location/group_branches/1
  # GET /location/group_branches/1.json
  def show
  end

  # GET /location/group_branches/new
  def new
    @group_branch = GroupBranch.new
  end

  # GET /location/group_branches/1/edit
  def edit
  end

  # POST /location/group_branches
  # POST /location/group_branches.json
  def create
    @group_branch = GroupBranch.new(group_branch_params)

    respond_to do |format|
      if @group_branch.save
        format.html { redirect_to location_group_branches_path, notice: "Grupo de Ramo (#{@group_branch.description}) foi cadastrado com sucesso"}
        format.json { render :index, status: :created, Location: location_group_branches_path }
      else
        format.html { render :new }
        format.json { render json: @group_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location/group_branches/1
  # PATCH/PUT /location/group_branches/1.json
  def update
    respond_to do |format|
      if @group_branch.update(group_branch_params)
        format.html { redirect_to location_group_branches_path, notice: "Grupo de Ramo (#{@group_branch.description}) foi atualizado com sucesso"}
        format.json { render :show, status: :ok, Location: group_branches_path }
      else
        format.html { render :edit }
        format.json { render json: @group_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location/group_branches/1
  # DELETE /location/group_branches/1.json
  def destroy
    group_description = @group_branch.description
    @group_branch.destroy
    if @group_branch.errors.any?
      redirect_to location_group_branches_path, alert: "Grupo de ramo (#{group_description}) não pode ser excluido, existe(m) dependência(s)"
    else
      redirect_to location_group_branches_path, notice: "Grupo de ramo (#{group_description}) foi excluido com sucesso"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_branch
      @group_branch = GroupBranch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_branch_params
      params.require(:group_branch).permit(:code, :description)
    end
end
