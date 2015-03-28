class SimilaritiesController < ApplicationController
  before_action :set_similarity, only: [:show, :edit, :update, :destroy]

  # GET /similarities
  # GET /similarities.json
  def index
    @similarities = Similarity.all
  end

  # GET /similarities/1
  # GET /similarities/1.json
  def show
  end

  # GET /similarities/new
  def new
    @similarity = Similarity.new
  end

  # GET /similarities/1/edit
  def edit
  end

  # POST /similarities
  # POST /similarities.json
  def create
    @similarity = Similarity.new(similarity_params)

    respond_to do |format|
      if @similarity.save
        format.html { redirect_to @similarity, notice: 'Similarity was successfully created.' }
        format.json { render :show, status: :created, location: @similarity }
      else
        format.html { render :new }
        format.json { render json: @similarity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /similarities/1
  # PATCH/PUT /similarities/1.json
  def update
    respond_to do |format|
      if @similarity.update(similarity_params)
        format.html { redirect_to @similarity, notice: 'Similarity was successfully updated.' }
        format.json { render :show, status: :ok, location: @similarity }
      else
        format.html { render :edit }
        format.json { render json: @similarity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /similarities/1
  # DELETE /similarities/1.json
  def destroy
    @similarity.destroy
    respond_to do |format|
      format.html { redirect_to similarities_url, notice: 'Similarity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_similarity
      @similarity = Similarity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def similarity_params
      params.require(:similarity).permit(:score, :user_id, :partner, :user_id)
    end
end
