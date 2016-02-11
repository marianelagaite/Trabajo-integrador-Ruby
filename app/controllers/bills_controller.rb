class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:index, :show, :edit, :update, :destroy, :new, :create]

  # GET clients/1/bills
  # GET clients/1/bills.json
  def index
    @bills = @client.bills
  end

  # GET bills
  # GET bills
  def bills
    @clients = Client.notDeleted
  end

  # GET clients/1/bills/1
  # GET clients/1/bills/1.json
  def show
  end

  # GET clients/1/bills/new
  def new
    @bill = Bill.new
    @purchasers = Purchaser.all
  end

  # GET clients/1/bills/1/edit
  def edit
  end

  # POST clients/1/bills
  # POST clients/1/bills.json
  def create
    @bill = @client.bills.new(bill_params)
    @bill.client = @client 
    respond_to do |format|
      if @bill.save
        format.html { redirect_to client_bills_path(@client), notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT clients/1/bills/1
  # PATCH/PUT clients/1/bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to client_bills_path(@client), notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE clients/1/bills/1
  # DELETE clients/1/bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to client_bills_path(@client), notice: 'La factura fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:client_id, :purchaser_id, :amount, :description, :date, purchaser_attributes: [:id, :person_id, :cuil_cuit, person_attributes: [:id, :name, :surname, :type_person, :trash]])
    end
end
