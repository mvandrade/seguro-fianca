class Location::InformationProductsController < LocationController
  before_action :set_information_product, only: [:edit, :update, :destroy]

  def index

    product = Product.find(params[:product_id])

    @name_product = product.name

    @information_products = product.information_product

  end

  def show
  end

  def new

    product = Product.find(params[:product_id])

    @information_product = product.information_product.new

    @name_product = product.name

  end

  def edit

    product = Product.find(params[:product_id])

    @information_product = product.information_product.find(params[:id])

    @name_product = product.name

    @information_product.discount_limit = @information_product.discount_limit * 10
    @information_product.commission_limit = @information_product.commission_limit * 10
    @information_product.minimum_plot_value = @information_product.minimum_plot_value * 10
    @information_product.minimum_policy_value = @information_product.minimum_policy_value * 10
  end

  def create

    product = Product.find(params[:product_id])

    @information_product = product.information_product.new(information_product_params)


    @information_product.discount_limit = information_product_params[:discount_limit].gsub(/[%]/,"").gsub(/[,]/,".")
    @information_product.commission_limit = information_product_params[:commission_limit].gsub(/[%]/,"").gsub(/[,]/,".")
    @information_product.minimum_plot_value = information_product_params[:minimum_plot_value].gsub(/[,]/,".")
    @information_product.minimum_policy_value = information_product_params[:minimum_policy_value].gsub(/[,]/,".")

    respond_to do |format|
      if @information_product.save
        format.html { redirect_to location_product_information_products_path(product), notice: "Informações do produto (#{product.name}) ,foram cadastradas com sucesso"}
        format.json { render :show, status: :created, location: @information_product }
      else
        format.html { render :new }
        format.json { render json: @information_product.errors, status: :unprocessable_entity }
      end
    end

  end

  def update

    product = Product.find(params[:product_id])

    @information_product = product.information_product.find(params[:id])

    respond_to do |format|
      if @information_product.update(information_product_params)
        format.html { redirect_to location_product_information_products_path(product), notice: "Informações do produto (#{product.name}) foram atualizadas com sucesso"}
        format.json { render :show, status: :ok,  location: @information_product }
      else
        format.html { render :edit }
        format.json { render json: @information_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    product = Product.find(params[:product_id])

    @information_product = product.information_product.find(params[:id])

    @information_product.destroy
    if @information_product.errors.any?

      @information_product.errors.full_messages.each do |message|
        @message = message
       end

      redirect_to location_product_information_products_path(product), alert: @message
    else
      redirect_to location_product_information_products_path(product), notice: "Informações do produto (#{product.name}) foram excluidas com sucesso"
    end
  end

  private

    def set_information_product
      @information_product = InformationProduct.find(params[:id])
    end

    def information_product_params
      params.require(:information_product).permit( :validity, :minimum_plot_value, :minimum_policy_value, :discount_limit, :commission_limit, :product_id )
    end

end
