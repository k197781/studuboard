class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes.json

  # GET /notes/1.json

  def new
    @note = Note.new
  end


  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.chatroom_id = $chatroom_id
    @chatroom = Chatroom.find_by(id: @note.chatroom_id)
    @chatroom.updated_at = Time.now
    respond_to do |format|
      if @note.save
        @chatroom.save
        format.html { redirect_to chatroom_path($chatroom_id), notice: 'コメントは保存されました。' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1.json
  def destroy
    #if !user_signed_in? || current_user.id != @user.id
    #  redirect_to root_path
    #end
    
    @note.destroy
    respond_to do |format|
      format.html { redirect_to chatroom_path($chatroom_id), notice: 'コメントはさくじょされました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:content)
    end
end
