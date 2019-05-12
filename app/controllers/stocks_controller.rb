class StocksController < ApplicationController
<<<<<<< HEAD

=======
>>>>>>> Adicionado controle de Estoque
  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def new
    @stock = Stock.new
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def create
    stock = Stock.new(stock_params)

    respond_to do |format|
      if stock.save
        create_items_for_stock(stock)

        format.html { redirect_to stock, notice: 'Entrada de estoque criada com sucesso' }
        format.json { render :show, status: :created, location: stock }
      else
        format.html { render :new }
        format.json { render json: stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @stock = Stock.find(params[:id])

    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
<<<<<<< HEAD
    @stock = Stock.find(params[:id])
    @stock.destroy
=======
    stock = Stock.find(params[:id])

    stock.destroy
>>>>>>> Adicionado controle de Estoque
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def create_items_for_stock(stock)
    stock.quantity.times do
      item = Item.new(
        stock_id: stock.id,
<<<<<<< HEAD
=======
        product_id: stock.product_id,
>>>>>>> Adicionado controle de Estoque
        sold: false
      )

      item.save!
    end
  end

  def stock_params
    params.require(:stock).permit(:product_id, :quantity, :price, :lot)
  end
end
