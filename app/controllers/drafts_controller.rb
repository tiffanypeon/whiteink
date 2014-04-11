class DraftsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_current_user, only: [:index, :show, :edit, :update, :destroy, :editable, :reviewable]
  before_action :set_document, only: [:index, :show, :create]

  def new
    @draft = Draft.new
  end

  def create
    @draft = @document.drafts.build(draft_params)
    if @draft.save
      render "drafts/show"
    else
      respond_with @draft
    end
  end

  def edit
  end

  def show
    @draft = Draft.find(params[:id])
  end

  def destroy
  end

  def index
    @draft = @document.drafts.last
  end

  def editable
    @draft = @document.drafts.last
  end

  def reviewable
    @draft = set_reviewable_draft
  end

  def update
    @draft = Draft.find(params[:id])
    if @draft.update_attributes draft_params
      render "drafts/show"
    else
      respond_with @draft
    end
  end

  private
  def draft_params
    params.permit(:content, :id, :document_id)
  end

  def set_document
    @document = current_user.documents.find_or_create_by(published: false)
  end

  def set_reviewable_draft
    current_user.reviewable_draft
  end

  def set_current_user
    @current_user ||= current_user
  end
end
