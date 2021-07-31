class addressController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /address
  def index
    @address = Address.all
  end

  # GET /address/1
  def show
  end

  # GET /address/new
  def new
    @address = Address.new
    @address.users.build
  end

  # GET /address/1/edit
  def edit
  end

  # POST /address
  def create
    @address = Address.new(address_params)

    if @address.save
      redirect_to @address, notice: 'Address was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /address/1
  def update
    if @address.update(address_params)
      redirect_to @address, notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /address/1
  def destroy
    @address.destroy
    redirect_to address_url, notice: 'Address was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def address_params
    #   params.fetch(:Address)
    # end
end
