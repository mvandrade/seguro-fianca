class Location::CompositionProductsController < LocationController
  before_action :set_composition_product, only: [:edit, :update, :destroy]

  # GET /composition_products
  # GET /composition_products.json
  def index

    if params[:composition_product] and params[:composition_product][:product_id]
      distinct_product
      @product_id = params[:composition_product][:product_id]
      @composition_product_covers = Cover.joins(:composition_products).where(['composition_products.product_id = :b',{b: params[:composition_product][:product_id]}])
    else
      distinct_product
      first_product
      @composition_product_covers = Cover.joins(:composition_products).where(['composition_products.product_id = :b',{b: @first_product.product_id}])
    end

  end

  # GET /composition_products/1
  # GET /composition_products/1.json
  def show
  end

  # GET /composition_products/new
  def new

 
    product_options
    cover_options
    @composition_product = CompositionProduct.new

  end

  # GET /composition_products/1/edit
  def edit
  end

  # POST /composition_products
  # POST /composition_products.json
  def create

    product_options
    cover_options

    @composition_product = CompositionProduct.new(composition_product_params)

    respond_to do |format|
      if @composition_product.save
        format.html { redirect_to location_composition_products_path, notice: 'Composition product was successfully created.' }
        format.json { render :show, status: :created, location: @composition_product }
      else
        format.html { render :new }
        format.json { render json: @composition_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /composition_products/1
  # PATCH/PUT /composition_products/1.json
  def update
    respond_to do |format|
      if @composition_product.update(composition_product_params)
        format.html { redirect_to location_composition_products_path, notice: 'Composition product was successfully updated.' }
        format.json { render :show, status: :ok, location: @composition_product }
      else
        format.html { render :edit }
        format.json { render json: @composition_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /composition_products/1
  # DELETE /composition_products/1.json
  def destroy
    @composition_product.destroy
    respond_to do |format|
      format.html { redirect_to location_composition_products_path, notice: 'Composition product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def distinct_product
      @distinct_product = Product.joins(:composition_products).distinct
    end

    def first_product
      @first_product = CompositionProduct.joins(:product, :cover).first
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_composition_product
      @composition_product = CompositionProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def composition_product_params
      params.require(:composition_product).permit(:product_id, :cover_id)
    end
end
