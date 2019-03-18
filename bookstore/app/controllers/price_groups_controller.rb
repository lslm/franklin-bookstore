class PriceGroupsController < ApplicationController
  before_action :set_price_group, only: [:show, :edit, :update, :destroy]

  # GET /price_groups
  # GET /price_groups.json
  def index
    @price_groups = PriceGroup.all
  end

  # GET /price_groups/1
  # GET /price_groups/1.json
  def show
  end

  # GET /price_groups/new
  def new
    @price_group = PriceGroup.new
  end

  # GET /price_groups/1/edit
  def edit
  end

  # POST /price_groups
  # POST /price_groups.json
  def create
    @price_group = PriceGroup.new(price_group_params)

    respond_to do |format|
      if @price_group.save
        format.html { redirect_to @price_group, notice: 'Price group was successfully created.' }
        format.json { render :show, status: :created, location: @price_group }
      else
        format.html { render :new }
        format.json { render json: @price_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_groups/1
  # PATCH/PUT /price_groups/1.json
  def update
    respond_to do |format|
      if @price_group.update(price_group_params)
        format.html { redirect_to @price_group, notice: 'Price group was successfully updated.' }
        format.json { render :show, status: :ok, location: @price_group }
      else
        format.html { render :edit }
        format.json { render json: @price_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_groups/1
  # DELETE /price_groups/1.json
  def destroy
    @price_group.destroy
    respond_to do |format|
      format.html { redirect_to price_groups_url, notice: 'Price group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_group
      @price_group = PriceGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_group_params
      params.require(:price_group).permit(:prefix, :description)
    end
end
