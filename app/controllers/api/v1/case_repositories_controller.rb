class Api::V1::CaseRepositoriesController < Api::V1::GraphitiController
  def index
    case_repositories = CaseRepositoryResource.all(params)
    respond_with(case_repositories)
  end

  def show
    case_repository = CaseRepositoryResource.find(params)
    respond_with(case_repository)
  end

  def create
    case_repository = CaseRepositoryResource.build(params)

    if case_repository.save
      render jsonapi: case_repository, status: 201
    else
      render jsonapi_errors: case_repository
    end
  end

  def update
    case_repository = CaseRepositoryResource.find(params)

    if case_repository.update_attributes
      render jsonapi: case_repository
    else
      render jsonapi_errors: case_repository
    end
  end

  def destroy
    case_repository = CaseRepositoryResource.find(params)

    if case_repository.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: case_repository
    end
  end
end
