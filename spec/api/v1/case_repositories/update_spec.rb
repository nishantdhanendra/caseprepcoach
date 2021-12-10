require "rails_helper"

RSpec.describe "case_repositories#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/case_repositories/#{case_repository.id}", payload
  end

  describe "basic update" do
    let!(:case_repository) { create(:case_repository) }

    let(:payload) do
      {
        data: {
          id: case_repository.id.to_s,
          type: "case_repositories",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CaseRepositoryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { case_repository.reload.attributes }
    end
  end
end
