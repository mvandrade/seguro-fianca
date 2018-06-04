class Location::InformationCoveragesController < LocationController
  before_action :set_information_coverage, only: [:edit, :update, :destroy]
  # before_action :unformat_data_create, only: [:create]
  before_action :unformat_data_update, only: [:update]

  def index

    composition_product = CompositionProduct.find(params[:composition_product_id])
    @name_product = Product.find(composition_product.product_id)
    @name_cover = Cover.find(composition_product.cover_id)
    @information_coverages = composition_product.information_coverage

  end

  def show
  end

  def new

    composition_product = CompositionProduct.find(params[:composition_product_id])
    @name_product = Product.find(composition_product.product_id)
    @name_cover = Cover.find(composition_product.cover_id)
    @information_coverage = composition_product.information_coverage.new
    @information_coverage["final_term"]="31/12/2099"
    @information_coverage["date_status"]=Date.today
    @information_coverage["status"]=1
    @information_coverage["type_use"]=1
    @information_coverage["type_coverage"]=1

  end

  def edit

    composition_product = CompositionProduct.find(params[:composition_product_id])
    @name_product = Product.find(composition_product.product_id)
    @name_cover = Cover.find(composition_product.cover_id)
    @information_coverage = composition_product.information_coverage.find(params[:id])

    @information_coverage.minimum_reference = @information_coverage.minimum_reference * 10
    @information_coverage.maximum_reference = @information_coverage.maximum_reference * 10
    if @information_coverage.rate_pure != nil
      @information_coverage.rate_pure = @information_coverage.rate_pure * 10
    end
    if @information_coverage.fixed_value != nil
      @information_coverage.fixed_value = @information_coverage.fixed_value * 10
    end
    @information_coverage.minimum_importance_value = @information_coverage.minimum_importance_value * 10
    @information_coverage.maximum_importance_value = @information_coverage.maximum_importance_value * 10
    @information_coverage.minimum_premium_reference = @information_coverage.minimum_premium_reference * 10

  end

  def create

    composition_product = CompositionProduct.find(params[:composition_product_id])
    @name_product = Product.find(composition_product.product_id)
    @name_cover = Cover.find(composition_product.cover_id)
    @information_coverage = composition_product.information_coverage.new( information_coverage_params )
    @information_coverage.minimum_reference = information_coverage_params[:minimum_reference].gsub(/[%]/,"").gsub(/[,]/,".")
    @information_coverage.maximum_reference = information_coverage_params[:maximum_reference].gsub(/[%]/,"").gsub(/[,]/,".")
    @information_coverage.rate_pure = information_coverage_params[:rate_pure].gsub(/[%]/,"").gsub(/[,]/,".")
    @information_coverage.fixed_value = information_coverage_params[:fixed_value].gsub(/[.]/,"").gsub(/[,]/,".")
    @information_coverage.minimum_importance_value = information_coverage_params[:minimum_importance_value].gsub(/[.]/,"").gsub(/[,]/,".")
    @information_coverage.maximum_importance_value = information_coverage_params[:maximum_importance_value].gsub(/[.]/,"").gsub(/[,]/,".")
    @information_coverage.minimum_premium_reference = information_coverage_params[:minimum_premium_reference].gsub(/[.]/,"").gsub(/[,]/,".")
    @information_coverage.status = 1
    @information_coverage.date_status = Date.today

    respond_to do |format|
      if @information_coverage.save
        format.html { redirect_to location_composition_product_information_coverages_path(composition_product), notice: "Informações da composição do produto #{@name_product.name}/#{@name_cover.name}, foram cadastradas com sucesso" }
        format.json { render :show, status: :created, location: @ic }
      else
        format.html { render :new }
        format.json { render json: @ic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|

      composition_product = CompositionProduct.find(params[:composition_product_id])
      @name_product = Product.find(composition_product.product_id)
      @name_cover = Cover.find(composition_product.cover_id)
      @information_coverage = composition_product.information_coverage.find(params[:id])
     
      if @information_coverage.update(@ic)
        format.html { redirect_to location_composition_product_information_coverages_path(composition_product), notice: "Informações da composição do produto #{@name_product.name}/#{@name_cover.name}, foram atualizadas com sucesso" }
        format.json { render :show, status: :ok, location: @information_coverage }
      else
        format.html { render :edit }
        format.json { render json: @information_coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    composition_product = CompositionProduct.find(params[:composition_product_id])
    @name_product = Product.find(composition_product.product_id)
    @name_cover = Cover.find(composition_product.cover_id)
    @information_coverage = composition_product.information_coverage.find(params[:id])

    @information_coverage.destroy
    if @information_coverage.errors.any?

      @information_coverage.errors.full_messages.each do |message|
        @message = message
       end

      redirect_to location_composition_product_information_coverages_path(composition_product), alert: @message
    else
      redirect_to location_composition_product_information_coverages_path(composition_product), notice: "Informações da compodição do produto #{@name_product.name}/#{@name_cover.name}, foram excluidas com sucesso"
    end
  end

  def update_status
    composition_product = CompositionProduct.find(params[:composition_product_id])
    @name_product = Product.find(composition_product.product_id)
    @name_cover = Cover.find(composition_product.cover_id)
    @information_coverage = composition_product.information_coverage.find(params[:id])

    @information_coverage.date_status = Date.today

    if @information_coverage.pendent?
       @locked_up = InformationCoverage.where(["composition_product_id = :b", {b: composition_product.id}]).where.not(["status = :c", {c: 3}]).where(["id < :a", {a: @information_coverage.id}]).order("validity DESC")
       @locked_up.update(status: 3, date_status: Date.today, final_term: @information_coverage.validity) 
       @information_coverage.status = 2
       @information_coverage.final_term = "31/12/2099"
    else
       @information_coverage.status = 3
       @information_coverage.final_term = Date.today
    end

    @information_coverage.save!
    respond_to do |format|
      format.html { redirect_to location_composition_product_information_coverages_path(composition_product), notice: "Situação da composição do produto #{@name_product.name}/#{@name_cover.name}, foi atualizada com sucesso" }
      format.json { render :show, status: :ok, location: @information_coverage }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information_coverage
      @information_coverage = InformationCoverage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_coverage_params
      params.require(:information_coverage).permit(:validity, :final_term, :multiplier_importance_value, :minimum_importance_value, :maximum_importance_value, :minimum_reference, :maximum_reference, :minimum_premium_reference, :compulsory_coverage, :type_coverage, :description_franchise, :status, :date_status, :type_use, :rate_pure, :fixed_value, :composition_product_id)
    end

    def unformat_data_update
      @ic = information_coverage_params
      @ic[:minimum_reference] = information_coverage_params[:minimum_reference].gsub(/[%]/,"").gsub(/[,]/,".")
      @ic[:maximum_reference] = information_coverage_params[:maximum_reference].gsub(/[%]/,"").gsub(/[,]/,".")
      @ic[:rate_pure] = information_coverage_params[:rate_pure].gsub(/[%]/,"").gsub(/[,]/,".")
      @ic[:fixed_value] = information_coverage_params[:fixed_value].gsub(/[.]/,"").gsub(/[,]/,".")
      @ic[:minimum_importance_value] = information_coverage_params[:minimum_importance_value].gsub(/[.]/,"").gsub(/[,]/,".")
      @ic[:maximum_importance_value] = information_coverage_params[:maximum_importance_value].gsub(/[.]/,"").gsub(/[,]/,".")
      @ic[:minimum_premium_reference] = information_coverage_params[:minimum_premium_reference].gsub(/[.]/,"").gsub(/[,]/,".")

    end

end
