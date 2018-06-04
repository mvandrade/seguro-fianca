class Location::ProductsController < LocationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @product = Product.new
    branch_options
    insurer_options
    cover_options
  end

  def edit
    branch_options
    insurer_options
    cover_options
    list_informatio_products
  end

  def create
    branch_options
    insurer_options
    cover_options

    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to location_products_path, notice: "Produto (#{@product.name}) foi cadastrado com sucesso"}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to location_products_path, notice: "Produto (#{@product.name}) foi atualizado com sucesso"}
        format.json { render :show, status: :ok,  location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    product_name = @product.name
    @product.destroy
    if @product.errors.any?
      redirect_to location_products_path, alert: "Produto (#{product_name}) não pode ser excluido, existe(m) dependência(s)"
    else
      redirect_to location_products_path, notice: "Produto (#{product_name}) foi excluido com sucesso"
    end
  end

  private

    def list_informatio_products
      @information_products = InformationProduct.where(product_id: params[:id] ).paginate(:page => params[:page], :per_page => 10)
    end

    def branch_options
      @branch_options = Branch.all
    end

    def insurer_options
      @insurer_options = Insurer.all
    end

    def cover_options
      @cover_options = Cover.all
     end


    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit( :branch_id, :code, :name, :description, :insurer_id, cover_ids:[])
    end
end
