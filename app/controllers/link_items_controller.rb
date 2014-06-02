class LinkItemsController < ApplicationController
  before_action :set_link_item, only: [:show, :edit, :update, :destroy]

  def redirector
      short_name = params[:short_name]
      li = LinkItem.find_by_short_name(short_name)

      v = Visit.new({ :ip_address => request.remote_ip, :referrer => request.referrer })

      li.visits << v

      redirect_to li.original_url
  end

  # GET /link_items
  # GET /link_items.json
  def index
    @link_items = LinkItem.all
  end

  # GET /link_items/1
  # GET /link_items/1.json
  def show
  end

  # GET /link_items/new
  def new
    @link_item = LinkItem.new
  end

  # GET /link_items/1/edit
  def edit
  end

  # POST /link_items
  # POST /link_items.json
  def create
    @link_item = LinkItem.new(link_item_params)

    respond_to do |format|
      if @link_item.save
        format.html { redirect_to @link_item, notice: 'Link item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @link_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /link_items/1
  # PATCH/PUT /link_items/1.json
  def update
    respond_to do |format|
      if @link_item.update(link_item_params)
        format.html { redirect_to @link_item, notice: 'Link item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_items/1
  # DELETE /link_items/1.json
  def destroy
    @link_item.destroy
    respond_to do |format|
      format.html { redirect_to link_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_item
      @link_item = LinkItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_item_params
      params.require(:link_item).permit(:original_url, :short_name, :password, :needs_email)
    end

end
