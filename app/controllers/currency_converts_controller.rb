class CurrencyConvertsController < ApplicationController
  before_action :set_currency_convert, only: [:show, :edit, :update, :destroy]

  def index
    @currency_converts = Currency.all
    @array = []
  end

  def convert
    @i = params[:q][:number].to_i   
    currency_converts = Currency.all
    data = YahooFinance::Client.new.quotes(["BVSP", "NATU3.SA", currency_converts[@i].currency + currency_converts[@i].currency_to + "=X"], [:ask])
    @sum = params[:q][:index]
    @data = data[2].ask
    respond_to do |format|
      format.js
    end 
  end

  def new
    @currency_convert = Currency.new
  end

  def time
    @text = Time.now.to_s
   respond_to do |format|
    format.js
   end
  end

  def show 
  end

  def create
    @currency_convert = Currency.new(currency_convert_params)

    respond_to do |format|
      if @currency_convert.save
        format.html { redirect_to @currency_convert, notice: 'Currency convert was successfully created.' }
        format.json { render :show, status: :created, location: @currency_convert }
      else
        format.html { render :new }
        format.json { render json: @currency_convert.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @currency_convert.update(currency_convert_params)
        format.html { redirect_to @currency_convert, notice: 'Currency convert was successfully updated.' }
        format.json { render :show, status: :ok, location: @currency_convert }
      else
        format.html { render :edit }
        format.json { render json: @currency_convert.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @currency_convert.destroy
    respond_to do |format|
      format.html { redirect_to currency_converts_url, notice: 'Currency convert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency_convert
      @currency_convert = Currency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currency_convert_params
      params.require(:currency_convert).permit(:currency)
    end
end
