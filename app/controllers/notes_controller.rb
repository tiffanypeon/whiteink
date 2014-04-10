class NotesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  # before_action :set_draft, only: [:create, :show]
  before_action :set_current_user, only: [:index, :show, :edit, :update, :destroy]

  def new
    @note = Note.new
  end

  def index
    @draft = Draft.find params[:draft_id]
    @notes = @draft.notes
  end

  def create
    # binding.pry
    # @note = @draft.notes.build(note_params)
    @note = Note.new(note_params)
# params have to contain draft_id
    if @note.save
      render "notes/show"
    else
      respond_with @note
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes note_params
      render "notes/show"
    else
      respond_with @note
    end
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private
  def note_params
    params.permit(:content, :id, :draft_id, :draft_index)
  end

  # def set_draft
  #   @draft = set_document.drafts.last
  # end

  # def set_document
  #   @document = current_user.documents.find_or_create_by(published: false)
  # end

  def set_current_user
    @current_user ||= current_user
  end
end
