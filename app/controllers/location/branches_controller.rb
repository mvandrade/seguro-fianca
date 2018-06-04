class Location::BranchesController < LocationController
  before_action :set_branch, only: [:edit, :update, :destroy]

  def index
    @branches = Branch.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @branch = Branch.new
    group_branch_options
  end

  def edit
    group_branch_options
  end

  def create
    group_branch_options
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to location_branches_path, notice: "Ramo (#{@branch.name}) foi cadastrado com sucesso"}
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    group_branch_options
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to location_branches_path, notice: "Ramo (#{@branch.name}) foi atualizado com sucesso"}
        format.json { render :show, status: :ok,  location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    branch_name = @branch.name
    @branch.destroy
    if @branch.errors.any?
      redirect_to location_branches_path, alert: "Ramo (#{branch_name}) não pode ser excluido, existe(m) dependência(s)"
    else
      redirect_to location_branches_path, notice: "Ramo (#{branch_name}) foi excluido com sucesso"
    end
  end

  private

    def group_branch_options
      @group_branch_options = GroupBranch.all
    end

    def set_branch
      @branch = Branch.find(params[:id])
    end

    def branch_params
      params.require(:branch).permit( :group_branch_id, :code, :name, :description )
    end
end
