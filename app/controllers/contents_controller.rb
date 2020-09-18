class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all.order('created_at DESC').paginate(page: params[:page], per_page: 4)
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = current_user.contents.build
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = current_user.contents.build(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Il contenuto è stato creato con successo.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Il contenuto è stato aggiornato con successo.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Il contenuto è stato eliminato.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:titolo, :descrizione, :price, :cover, :allegato)
    end

    def check_user
      if current_user != @content.user
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
