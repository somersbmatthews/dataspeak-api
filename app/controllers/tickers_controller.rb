class TickersController < ApplicationController
  before_action :set_ticker, only: [:show, :update, :destroy]

  # GET /tickers
  def index
    @tickers = Ticker.all

    render json: @tickers
  end

  # GET /tickers/1
  def show
    render json: @ticker
  end

  # POST /tickers
  def create
    payload = ticker_params

    payload.each_with_index do |payload, index|
      entry = payload[index]
      @ticker = Ticker.new
      @ticker.name = entry["Name"]
      @ticker.symbol = entry["Symbol"]
      if @ticker.save
        render json: @ticker, status: :created, location: @ticker
      else
       render json: @ticker.errors, status: :unprocessable_entity
      end
    end

    # @ticker = Ticker.new(ticker_entry)


  end

  # PATCH/PUT /tickers/1
  def update
    if @ticker.update(ticker_params)
      render json: @ticker
    else
      render json: @ticker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickers/1
  def destroy
    @ticker.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticker
      @ticker = Ticker.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ticker_params
      params.require(:ticker).permit(:company_name)
    end

    def make_nasdaq_hash
      @JSON_file = File.read('./nasdaq.json')
      @array_of_objects = JSON.parse(@JSON_file)
      @string_of_array = " "'" + #{@array_of_objects} + "'" "
      @output = File.new('nasdaq_hash.rb', 'w')
      @output.write(@string_of_objects)
      # File.open(output, 'w') do |f|

        # f.puts('[')
        # array_of_objects.each_with_index do |index|
        #   element = hash_data[index]
        #   f.write
        #   f.write(element)
        # end
        # f.puts(']')
      # end
    end

    def make_nyse_hash
      @JSON_file = File.read('./nyse.json')
      @array_of_objects = JSON.parse(@JSON_file)
      @string_of_array = " "'" + #{@array_of_objects} + "'" "
      @output = File.new('nyse_hash.rb', 'w')
      @output.write(@string_of_objects)
      # File.open(output, 'w') do |f|
        # f.puts('[')
        # array_of_objects.each_with_index do |index|
        #   element = hash_data[index]
        #   f.puts(element['Symbol'])
        #   f.write(':')
        #   f.write('')
        # end
        # f.puts(']')
      # end
      
    end


end
