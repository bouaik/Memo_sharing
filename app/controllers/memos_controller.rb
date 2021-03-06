class MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memo, only: %i[show edit update destroy]
  before_action :authorzie_user, only: %i[edit destroy]

  # GET /memos
  # GET /memos.json
  def index
    @memos = Memo.all.includes(:user)
    @memo = Memo.new
    @other_users = User.where.not(id: current_user.id)
  end

  # GET /memos/1
  # GET /memos/1.json
  def show; end

  # GET /memos/new
  def new
    @memo = Memo.new
  end

  # GET /memos/1/edit
  def edit; end

  # POST /memos
  # POST /memos.json
  def create
    @memos = Memo.all.includes(:user)
    @other_users = User.where.not(id: current_user.id).with_attached_profile_image
    @memo = Memo.new(memo_params)
    @memo.user = current_user

    respond_to do |format|
      if @memo.save
        format.html { redirect_to memos_path, notice: 'Memo was successfully created.' }
        format.json { render :show, status: :created, location: @memo }
      else
        format.html { render :index }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memos/1
  # PATCH/PUT /memos/1.json
  def update
    respond_to do |format|
      if @memo.update(memo_params)
        format.html { redirect_to @memo, notice: 'Memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @memo }
      else
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memos/1
  # DELETE /memos/1.json
  def destroy
    @memo.destroy
    respond_to do |format|
      format.html { redirect_to memos_url, notice: 'Memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def authorzie_user
    return unless @memo.user != current_user

    flash[:error] = 'unauthorized access!'
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_memo
    @memo = Memo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def memo_params
    params.require(:memo).permit(:title, :body)
  end
end
