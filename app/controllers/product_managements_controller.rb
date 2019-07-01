class ProductManagementsController < AuthenticatedController
  before_action :set_product_management, only: [:show, :edit, :update, :destroy]

  # GET /product_managements
  # GET /product_managements.json
  def index
    @products = Product.all
  end

  # GET /product_managements/1
  # GET /product_managements/1.json
  def show
  end

  # GET /product_managements/new
  def new
    @product = Product.new
  end

  # GET /product_managements/1/edit
  def edit
  end

  # POST /product_managements
  # POST /product_managements.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_management_path(@product), notice: 'A Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_managements/1
  # PATCH/PUT /product_managements/1.json
  def update
    respond_to do |format|
      @product.load(product_params) # same assign attributes
      # FIXME: using here @product.update(product_params)
      if @product.save
        format.html { redirect_to product_management_path(@product), notice: "Product #{@product.title} was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_managements/1
  # DELETE /product_managements/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to product_managements_url, notice: "Product #{@product.title} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_management
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product)
            .permit(:title)
      # FIXME: change to params.fetch(:product, :title)
    end
end
