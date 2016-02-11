class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :restore]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.notDeleted
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
    @client.build_person
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'El cliente fue creado correctamente.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'El cliente fue editado correctamente.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.toTrash
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'El cliente fué eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  def trash
    @clients = Client.deleted
  end

  def restore
    @client.restore
    respond_to do |format|
      format.html { redirect_to client_trash_path, notice: 'El cliente fué restaurado correctamente.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:birthday, :gender, :dni, :cuil_cuit, person_attributes: [:id, :name, :surname, :type_person, :trash], contacts_attributes: [:id, :type_contact, :data_contact, :client_id, :_destroy])
    end
end
