class DocumentsController < ApplicationController
  before_action :set_current_user, only: [:index, :show, :edit, :update, :destroy]

  def index
    @document = @current_user.documents.last




    #@drafts = Documents.published_drafts
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      render "documents/show"
    else
      respond_with @document
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def delete

  end

  def destroy

  end

  private
  def set_current_user
    @current_user ||= current_user
  end


end
