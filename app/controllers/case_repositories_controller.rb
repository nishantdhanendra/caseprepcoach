class CaseRepositoriesController < ApplicationController
  before_action :set_case_repository, only: %i[show edit update destroy]

  def index
    @q = CaseRepository.ransack(params[:q])
    @case_repositories = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show; end

  def new
    @case_repository = CaseRepository.new
  end

  def edit; end

  def create
    @case_repository = CaseRepository.new(case_repository_params)

    if @case_repository.save
      redirect_to @case_repository,
                  notice: "Case repository was successfully created."
    else
      render :new
    end
  end

  def update
    if @case_repository.update(case_repository_params)
      redirect_to @case_repository,
                  notice: "Case repository was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @case_repository.destroy
    redirect_to case_repositories_url,
                notice: "Case repository was successfully destroyed."
  end

  private

  def set_case_repository
    @case_repository = CaseRepository.find(params[:id])
  end

  def case_repository_params
    params.require(:case_repository).permit(:user_id)
  end
end
