class Location::TaxesController < LocationController
  before_action :set_tax, only: [:edit, :update, :destroy]

  def index

      branch = Branch.find(params[:branch_id])
      @name_branch = branch.name
      @taxes = branch.tax.paginate(:page => params[:page], :per_page => 10).order(:branch_id, :validity)

  end

  def show
  end

  def new

    branch = Branch.find(params[:branch_id])
    @name_branch = branch.name
    @tax = branch.tax.new
    branch_options
    deadline_short_long_options

  end

  def edit

    branch = Branch.find(params[:branch_id])
    @name_branch = branch.name
    @tax = branch.tax.find(params[:id])
    branch_options
    deadline_short_long_options

  end

  def create
    branch_options
    deadline_short_long_options
    branch = Branch.find(params[:branch_id])
    @tax = branch.tax.new(tax_params)
    @tax.rate = tax_params[:rate].gsub(/[%]/,"").gsub(/[,]/,".")
    respond_to do |format|
      if @tax.save
        format.html { redirect_to location_branch_taxes_path(branch), notice: "% de IOF foi cadastrado com sucesso"}
        format.json { render :show, status: :created, location: @tax }
      else
        format.html { render :new }
        format.json { render json: @tax.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    branch_options
    deadline_short_long_options
    branch = Branch.find(params[:branch_id])
    @name_branch = branch.name
    @tax = branch.tax.find(params[:id])
    respond_to do |format|
      if @tax.update(tax_params)
        @tax.rate = tax_params[:rate].gsub(/[%]/,"").gsub(/[,]/,".")
        format.html { redirect_to location_branch_taxes_path(branch), notice: "% IOF foi atualizado com sucesso"}
        format.json { render :show, status: :ok,  location: @tax }
      else
        format.html { render :edit }
        format.json { render json: @tax.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    branch = Branch.find(params[:branch_id])
    @tax = branch.tax.find(params[:id])
    @tax.destroy
    if @tax.errors.any?

       @tax.errors.full_messages.each do |message|
        @message = message
       end
      # redirect_to edit_location_tax_path(set_tax), alert: "% IOF não pode ser excluido, existe(m) dependência(s)"
      redirect_to location_branch_taxes_path(branch), alert: @message
    else
      redirect_to location_branch_taxes_path(branch), notice: "% IOF foi excluido com sucesso"
    end
  end

  private

    def tax_by_branch_id
      @taxes = Tax.where(branch_id: branch.id).paginate(:page => params[:page], :per_page => 10)
    end

    def branch_options
      @branch_options = Branch.all
    end

    def deadline_short_long_options
      @deadline_short_long_options = DeadlineShortLong.where('status = 2')
    end

    def set_tax
      @tax = Tax.find(params[:id])
    end

    def tax_params
      params.require(:tax).permit( :branch_id, :validity, :rate )
    end

end
