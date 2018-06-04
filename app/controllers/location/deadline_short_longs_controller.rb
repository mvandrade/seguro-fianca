class Location::DeadlineShortLongsController < LocationController
  before_action :set_deadline_short_long, only: [:edit, :update, :destroy]

  def index
    @deadline_short_longs = DeadlineShortLong.all
  end

  def show
  end

  def new
    @deadline_short_long = DeadlineShortLong.new
    @deadline_short_long["date_status"]=Date.today
    @deadline_short_long["status"]=1
    # COMENTÁRIO: O build inicializa a página com 1 nested já renderizado
    @percent_deadline = @deadline_short_long.percent_deadlines.build

  end

  def edit
  end

  def create
    @deadline_short_long = DeadlineShortLong.new(deadline_short_long_params)

    @deadline_short_long["date_status"]=Date.today
    @deadline_short_long["status"]=1

    respond_to do |format|
      if @deadline_short_long.save
        format.html { redirect_to location_deadline_short_longs_path, notice: "Tabela Prazo Curto e Longo (#{@deadline_short_long.description}) foi cadastrado com sucesso"}
        format.json { render :show, status: :created, location: @deadline_short_long }
      else
        format.html { render :new }
        format.json { render json: @deadline_short_long.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @deadline_short_long.update(deadline_short_long_params)
        format.html { redirect_to location_deadline_short_longs_path, notice: "Tabela Prazo Curto e Longo (#{@deadline_short_long.description}) foi atualizada com sucesso"}
        format.json { render :show, status: :ok, location: @deadline_short_long }
      else
        format.html { render :edit }
        format.json { render json: @deadline_short_long.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @deadline_short_long.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_status

    @deadline_short_long = DeadlineShortLong.find(params[:id])

    @deadline_short_long.date_status = Date.today
    @deadline_short_long.status = 2

    @deadline_short_long.save!
    respond_to do |format|
      format.html { redirect_to location_deadline_short_longs_path, notice: "Situação da Tabela Prazo Curto e Longo (#{@deadline_short_long.description}) foi atualizada com sucesso"}
      format.json { render :show, status: :ok, location: @deadline_short_long }
    end

  end

  private
    def set_deadline_short_long
      @deadline_short_long = DeadlineShortLong.find(params[:id])
    end

    def deadline_short_long_params
      # COMENTÁRIO: Aqui estamos permitindo a passagem dos parâmetros do nested attribute "experiences"
      params.require(:deadline_short_long).permit(:code, :description, :status, :date_status, percent_deadlines_attributes: [:id, :quantity_days, :percentage_aplided, :_destroy])
    end
end