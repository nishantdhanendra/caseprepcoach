class CaseRepositoriesController < ApplicationController
  before_action :set_case_repository, only: [:show, :edit, :update, :destroy]

  # GET /case_repositories
  def index
    @case_repositories = CaseRepository.page(params[:page]).per(10)
  end

  # GET /case_repositories/1
  def show
  end

  # GET /case_repositories/new
  def new
    @case_repository = CaseRepository.new
  end

  # GET /case_repositories/1/edit
  def edit
  end

  # POST /case_repositories
  def create
    @case_repository = CaseRepository.new(case_repository_params)

    if @case_repository.save
      redirect_to @case_repository, notice: 'Case repository was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /case_repositories/1
  def update
    if @case_repository.update(case_repository_params)
      redirect_to @case_repository, notice: 'Case repository was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /case_repositories/1
  def destroy
    @case_repository.destroy
    redirect_to case_repositories_url, notice: 'Case repository was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_repository
      @case_repository = CaseRepository.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def case_repository_params
      params.require(:case_repository).permit(:user_id)
    end
end
